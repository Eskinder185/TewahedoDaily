begin;
alter table public.categories add is_archived boolean not null default false;
alter table public.singers add is_archived boolean not null default false;
alter table public.content_versions alter column created_at set default clock_timestamp();
-- Keep referenced taxonomy intact; archive it instead.
alter table public.mezmur drop constraint mezmur_category_id_fkey,
 add constraint mezmur_category_id_fkey foreign key(category_id) references public.categories(id) on delete restrict;
alter table public.mezmur drop constraint mezmur_singer_id_fkey,
 add constraint mezmur_singer_id_fkey foreign key(singer_id) references public.singers(id) on delete restrict;
alter table public.mezmur_tags drop constraint mezmur_tags_tag_id_fkey,
 add constraint mezmur_tags_tag_id_fkey foreign key(tag_id) references public.tags(id) on delete restrict;

-- Every update retains its BEFORE state, including tags, in the same transaction.
create or replace function cms_private.record_version() returns trigger
language plpgsql security definer set search_path = '' as $$
declare saved jsonb; tags jsonb;
begin
 saved := case when tg_op = 'INSERT' then to_jsonb(new) else to_jsonb(old) end;
 if tg_table_name = 'mezmur' then
  select coalesce(jsonb_agg(tag_id order by tag_id),'[]'::jsonb) into tags
  from public.mezmur_tags where mezmur_id = (saved->>'id')::uuid;
 end if;
 insert into public.content_versions(content_type,content_id,snapshot,changed_by)
 values (tg_table_name::public.cms_content_type,(saved->>'id')::uuid,
 jsonb_build_object('operation',tg_op,'state',case when tg_op = 'INSERT' then 'created' else 'before' end,
 'record',saved,'tag_ids',tags),auth.uid());
 return coalesce(new,old);
end $$;
-- BEFORE DELETE preserves tag links before ON DELETE CASCADE.
drop trigger content_revision on public.mezmur;
create trigger content_revision before insert or update or delete on public.mezmur
for each row execute function cms_private.record_version();
-- Run guard first alphabetically, then revision. Other content keeps existing triggers.

-- Invoker RPC: normal grants, RLS, and triggers still apply to every statement.
-- Full editable payload, optimistic concurrency token, and tag replacement are atomic.
create function public.save_mezmur(payload jsonb, tag_ids uuid[], expected_updated_at timestamptz default null)
returns public.mezmur language plpgsql security invoker set search_path = '' as $$
declare row_before public.mezmur; saved public.mezmur; desired public.content_status;
 target_id uuid := coalesce((payload->>'id')::uuid,gen_random_uuid());
begin
 desired := coalesce((payload->>'status')::public.content_status,'draft');
 if tag_ids is null then raise exception 'Tag list is required'; end if;
 select * into row_before from public.mezmur where id = target_id for update;
 if found then
  if expected_updated_at is null or expected_updated_at <> row_before.updated_at then
   raise exception 'This mezmur changed since you opened it. Reload before saving.' using errcode = '40001';
  end if;
  update public.mezmur set
   title = payload->>'title', slug = payload->>'slug', title_amharic = payload->>'title_amharic', title_oromo = payload->>'title_oromo',
   description = payload->>'description', lyrics_amharic = payload->>'lyrics_amharic', lyrics_english = payload->>'lyrics_english',
   lyrics_oromo = payload->>'lyrics_oromo', transliteration = payload->>'transliteration', youtube_url = payload->>'youtube_url',
   thumbnail_url = payload->>'thumbnail_url', audio_url = payload->>'audio_url',
   singer_id = (payload->>'singer_id')::uuid, category_id = (payload->>'category_id')::uuid,
   featured = coalesce((payload->>'featured')::boolean,false)
  where id = target_id returning * into saved;
  if not found then raise exception 'You cannot edit this mezmur' using errcode = '42501'; end if;
 else
  if expected_updated_at is not null then raise exception 'Mezmur no longer available' using errcode = '42501'; end if;
  insert into public.mezmur(id,title,slug,title_amharic,title_oromo,description,lyrics_amharic,lyrics_english,lyrics_oromo,
   transliteration,youtube_url,thumbnail_url,audio_url,singer_id,category_id,featured,status)
  values(target_id,payload->>'title',payload->>'slug',payload->>'title_amharic',payload->>'title_oromo',payload->>'description',
   payload->>'lyrics_amharic',payload->>'lyrics_english',payload->>'lyrics_oromo',payload->>'transliteration',payload->>'youtube_url',
   payload->>'thumbnail_url',payload->>'audio_url',(payload->>'singer_id')::uuid,(payload->>'category_id')::uuid,
   coalesce((payload->>'featured')::boolean,false),'draft') on conflict (id) do nothing returning * into saved;
  if not found then raise exception 'Mezmur already exists or is not accessible' using errcode = '42501'; end if;
 end if;
 delete from public.mezmur_tags where mezmur_id = target_id;
 insert into public.mezmur_tags(mezmur_id,tag_id) select target_id,unnest from unnest(tag_ids) on conflict do nothing;
 if desired <> saved.status then
  update public.mezmur set status = desired where id = target_id returning * into saved;
  if not found then raise exception 'You cannot change this status' using errcode = '42501'; end if;
 end if;
 return saved;
end $$;
revoke all on function public.save_mezmur(jsonb,uuid[],timestamptz) from public,anon;
grant execute on function public.save_mezmur(jsonb,uuid[],timestamptz) to authenticated;

-- Names only, never private profile email, for version attribution.
create function public.cms_version_authors() returns table(id uuid,display_name text)
language sql stable security definer set search_path = '' as $$
 select p.id,coalesce(nullif(p.display_name,''),'CMS member') from public.profiles p
 where cms_private.current_role() in ('editor','admin','super_admin')
$$;
revoke all on function public.cms_version_authors() from public,anon;
grant execute on function public.cms_version_authors() to authenticated;

create function cms_private.can_upload_mezmur(object_name text) returns boolean
language sql stable security definer set search_path = '' as $$
 select exists(select 1 from public.mezmur m where split_part(object_name,'/',1) = 'mezmur'
 and m.id::text = split_part(object_name,'/',2) and split_part(object_name,'/',3) <> ''
 and (cms_private.current_role() in ('editor','admin','super_admin') or
 (cms_private.current_role() = 'contributor' and m.created_by = auth.uid() and m.status = 'draft')))
$$;
create function cms_private.can_read_cms_media(bucket text,object_name text) returns boolean
language sql stable security definer set search_path = '' as $$
 select cms_private.current_role() in ('editor','admin','super_admin') or
 case when bucket in ('mezmur-images','mezmur-audio') then exists (
  select 1 from public.mezmur m where m.id::text = split_part(object_name,'/',2) and split_part(object_name,'/',1) = 'mezmur'
  and ((m.status = 'published' and ('storage://' || bucket || '/' || object_name) in (m.thumbnail_url,m.audio_url))
   or (cms_private.current_role() = 'contributor' and m.created_by = auth.uid()))
 ) else cms_private.media_is_published(object_name) end
$$;
revoke all on function cms_private.can_upload_mezmur(text),cms_private.can_read_cms_media(text,text) from public;
grant execute on function cms_private.can_upload_mezmur(text),cms_private.can_read_cms_media(text,text) to anon,authenticated;
drop policy cms_media_read on storage.objects;
drop policy cms_media_select_boundary on storage.objects;
create policy cms_media_read on storage.objects for select to anon,authenticated using (
 bucket_id in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') and cms_private.can_read_cms_media(bucket_id,name));
create policy cms_media_select_boundary on storage.objects as restrictive for select to anon,authenticated using (
 bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or cms_private.can_read_cms_media(bucket_id,name));
drop policy cms_media_insert on storage.objects;
drop policy cms_media_insert_boundary on storage.objects;
create policy cms_media_insert on storage.objects for insert to authenticated with check (
 (bucket_id in ('mezmur-images','mezmur-audio') and cms_private.can_upload_mezmur(name)) or
 (bucket_id in ('saints','feasts','articles','general-media') and cms_private.current_role() in ('admin','super_admin')));
create policy cms_media_insert_boundary on storage.objects as restrictive for insert to anon,authenticated with check (
 bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or
 (bucket_id in ('mezmur-images','mezmur-audio') and cms_private.can_upload_mezmur(name)) or
 (bucket_id in ('saints','feasts','articles','general-media') and cms_private.current_role() in ('admin','super_admin')));
commit;

