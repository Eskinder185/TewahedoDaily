begin;
-- BEFORE revision triggers must reject accounts without CMS membership before audit FKs run.
create or replace function cms_private.record_version() returns trigger
language plpgsql security definer set search_path='' as $$
declare saved jsonb; tags jsonb;
begin
 if auth.uid() is not null and cms_private.current_role() is null then raise exception 'CMS membership required' using errcode='42501';end if;
 saved:=case when tg_op='INSERT' then to_jsonb(new) else to_jsonb(old) end;
 if tg_table_name='mezmur' then select coalesce(jsonb_agg(tag_id order by tag_id),'[]'::jsonb) into tags from public.mezmur_tags where mezmur_id=(saved->>'id')::uuid;end if;
 insert into public.content_versions(content_type,content_id,snapshot,changed_by) values(tg_table_name::public.cms_content_type,(saved->>'id')::uuid,jsonb_build_object('operation',tg_op,'state',case when tg_op='INSERT' then 'created' else 'before' end,'record',saved,'tag_ids',tags),auth.uid());
 return coalesce(new,old);
end $$;
do $$ declare t text; begin
 foreach t in array array['saints','feasts','prayers','articles'] loop
  execute format('alter table public.%I add column if not exists body_oromo text, add column if not exists audio_url text, add column date_notes text, add column related_content jsonb not null default ''[]'' check(jsonb_typeof(related_content)=''array'' and jsonb_array_length(related_content)<=30)',t);
  execute format('drop trigger content_revision on public.%I',t);
  execute format('create trigger content_revision before insert or update or delete on public.%I for each row execute function cms_private.record_version()',t);
 end loop;
end $$;
alter table public.feasts add fasting_info text;
alter table public.articles add teaching_category text check(teaching_category in ('Church teaching','Saints','Feasts','Bible study','Church history','The Seven Mysteries'));

-- One invoker RPC for all four editors. RLS remains authoritative and stale edits fail.
create function public.save_cms_content(content_kind text,payload jsonb,expected_updated_at timestamptz default null) returns jsonb
language plpgsql security invoker set search_path='' as $$
declare old_row jsonb; saved jsonb; target uuid:=coalesce((payload->>'id')::uuid,gen_random_uuid()); desired public.content_status:=coalesce((payload->>'status')::public.content_status,'draft'); fields text[]:=array['title','title_amharic','title_oromo','slug','description','thumbnail_url','audio_url','body','body_amharic','body_oromo','date_notes','related_content']; assignments text; columns text; values_sql text;
begin
 if content_kind not in ('saints','feasts','prayers','articles') then raise exception 'Invalid content kind'; end if;
 if length(trim(coalesce(payload->>'title',''))) not between 2 and 200 or coalesce(payload->>'slug','') !~ '^[a-z0-9]+(-[a-z0-9]+)*$' then raise exception 'Provide a title and valid slug'; end if;
 if content_kind='saints' then fields:=fields||array['commemoration_month','commemoration_day'];
 elsif content_kind='feasts' then fields:=fields||array['ethiopian_month','ethiopian_day','is_movable','fasting_info'];
 elsif content_kind='prayers' then fields:=fields||array['transliteration'];
 else fields:=fields||array['teaching_category']; end if;
 execute format('select to_jsonb(t) from public.%I t where id=$1 for update',content_kind) into old_row using target;
 select string_agg(format('%1$I=r.%1$I',f),','),string_agg(format('%I',f),','),string_agg(format('r.%I',f),',') into assignments,columns,values_sql from unnest(fields) f;
 if old_row is null then
  if expected_updated_at is not null then raise exception 'Content no longer available' using errcode='42501'; end if;
  execute format('insert into public.%1$I(id,%2$s,status) select $2,%3$s,''draft'' from jsonb_populate_record(null::public.%1$I,$1) r returning to_jsonb(%1$I)',content_kind,columns,values_sql) into saved using payload,target;
 else
  if expected_updated_at is distinct from (old_row->>'updated_at')::timestamptz then raise exception 'Content changed. Reload before saving.' using errcode='40001'; end if;
  execute format('update public.%1$I t set %2$s from jsonb_populate_record(null::public.%1$I,$1) r where t.id=$2 returning to_jsonb(t)',content_kind,assignments) into saved using payload,target;
  if saved is null then raise exception 'Edit permission required' using errcode='42501'; end if;
 end if;
 if desired::text<>saved->>'status' then execute format('update public.%I t set status=$1 where id=$2 returning to_jsonb(t)',content_kind) into saved using desired,target; end if;
 if saved is null then raise exception 'Review permission required' using errcode='42501'; end if;
 return saved;
end $$;
revoke all on function public.save_cms_content(text,jsonb,timestamptz) from public,anon;
grant execute on function public.save_cms_content(text,jsonb,timestamptz) to authenticated;

create table public.daily_content (
 day date primary key,
 mezmur_id uuid references public.mezmur(id) on delete set null,
 saint_id uuid references public.saints(id) on delete set null,
 feast_id uuid references public.feasts(id) on delete set null,
 bible_references text not null default '' check(length(bible_references)<=2000),
 fasting_indicator text not null default 'Not specified' check(fasting_indicator in ('Not specified','Fasting day','No fasting')),
 fasting_notes text not null default '' check(length(fasting_notes)<=2000),
 announcement text not null default '' check(length(announcement)<=3000),
 published boolean not null default false,
 updated_at timestamptz not null default clock_timestamp(),updated_by uuid references public.profiles(id) on delete set null
);
alter table public.daily_content enable row level security;
revoke all on public.daily_content from public,anon,authenticated;
grant select on public.daily_content to anon,authenticated;
grant insert,update,delete on public.daily_content to authenticated;
grant all on public.daily_content to service_role;
create policy daily_read on public.daily_content for select to anon,authenticated using(published or cms_private.current_role() in ('admin','super_admin'));
create policy daily_manage on public.daily_content for all to authenticated using(cms_private.current_role() in ('admin','super_admin')) with check(cms_private.current_role() in ('admin','super_admin'));
create function cms_private.guard_daily() returns trigger language plpgsql set search_path='' as $$
begin new.updated_at:=clock_timestamp();new.updated_by:=auth.uid();return new;end $$;
create trigger daily_audit before insert or update on public.daily_content for each row execute function cms_private.guard_daily();
revoke all on function cms_private.guard_daily() from public,anon,authenticated;
create function public.public_daily_content(target_day date) returns jsonb language sql stable security invoker set search_path='' as $$
 select jsonb_build_object('day',d.day,'bible_references',d.bible_references,'fasting_indicator',d.fasting_indicator,'fasting_notes',d.fasting_notes,'announcement',d.announcement,
 'mezmur',(select jsonb_build_object('title',m.title,'slug',m.slug,'thumbnail_url',m.thumbnail_url) from public.mezmur m where m.id=d.mezmur_id and m.status='published'),
 'saint',(select jsonb_build_object('title',m.title,'slug',m.slug,'thumbnail_url',m.thumbnail_url) from public.saints m where m.id=d.saint_id and m.status='published'),
 'feast',(select jsonb_build_object('title',m.title,'slug',m.slug,'thumbnail_url',m.thumbnail_url) from public.feasts m where m.id=d.feast_id and m.status='published'))
 from public.daily_content d where d.day=target_day and d.published
$$;
revoke all on function public.public_daily_content(date) from public;
grant execute on function public.public_daily_content(date) to anon,authenticated;

update storage.buckets set file_size_limit=52428800,allowed_mime_types=array['image/jpeg','image/png','image/webp','audio/mpeg','audio/mp4','audio/ogg','audio/wav','application/pdf'] where id='general-media';
create function cms_private.media_in_use(bucket text,object_name text) returns boolean language plpgsql stable security definer set search_path='' as $$
declare t text; used boolean; ref text:='storage://'||bucket||'/'||object_name;
begin
 foreach t in array array['mezmur','saints','feasts','prayers','articles'] loop
  execute format('select exists(select 1 from public.%I where thumbnail_url=$1 or audio_url=$1)',t) into used using ref;
  if used then return true;end if;
 end loop;
 return exists(select 1 from public.content_versions where strpos(snapshot::text,ref)>0);
end $$;
create or replace function cms_private.can_read_cms_media(bucket text,object_name text) returns boolean language plpgsql stable security definer set search_path='' as $$
declare t text; visible boolean; ref text:='storage://'||bucket||'/'||object_name;
begin
 if cms_private.current_role() in ('editor','admin','super_admin') then return true;end if;
 foreach t in array array['mezmur','saints','feasts','prayers','articles'] loop
  execute format('select exists(select 1 from public.%I where (status=''published'' and (thumbnail_url=$1 or audio_url=$1)) or (cms_private.current_role()=''contributor'' and created_by=auth.uid() and id::text=$2 and $3=%L))',t,t) into visible using ref,split_part(object_name,'/',2),split_part(object_name,'/',1);
  if visible then return true;end if;
 end loop;
 return false;
end $$;
create function cms_private.can_upload_content(object_name text) returns boolean language plpgsql stable security definer set search_path='' as $$
declare t text:=split_part(object_name,'/',1); allowed boolean;
begin
 if cms_private.current_role() in ('admin','super_admin') then return true;end if;
 if t not in ('saints','feasts','prayers','articles') or split_part(object_name,'/',3)='' then return false;end if;
 execute format('select exists(select 1 from public.%I where id::text=$1 and (cms_private.current_role()=''editor'' or (cms_private.current_role()=''contributor'' and created_by=auth.uid() and status=''draft'')))',t) into allowed using split_part(object_name,'/',2);
 return allowed;
end $$;
revoke all on function cms_private.media_in_use(text,text),cms_private.can_upload_content(text) from public;
grant execute on function cms_private.media_in_use(text,text),cms_private.can_upload_content(text) to authenticated;
drop policy cms_media_insert on storage.objects;
drop policy cms_media_insert_boundary on storage.objects;
create policy cms_media_insert on storage.objects for insert to authenticated with check((bucket_id in ('mezmur-images','mezmur-audio') and cms_private.can_upload_mezmur(name)) or (bucket_id in ('saints','feasts','articles','general-media') and cms_private.can_upload_content(name)));
create policy cms_media_insert_boundary on storage.objects as restrictive for insert to anon,authenticated with check(bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or ((bucket_id in ('mezmur-images','mezmur-audio') and cms_private.can_upload_mezmur(name)) or (bucket_id in ('saints','feasts','articles','general-media') and cms_private.can_upload_content(name))));
create policy cms_media_safe_delete on storage.objects as restrictive for delete to authenticated using(bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or not cms_private.media_in_use(bucket_id,name));
create policy cms_media_safe_update on storage.objects as restrictive for update to authenticated using(bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or not cms_private.media_in_use(bucket_id,name));
create function public.cms_media_inventory(q text default '',media_type text default '',page_number integer default 1) returns jsonb language plpgsql stable security definer set search_path='' as $$
begin
 if coalesce(cms_private.current_role() not in ('admin','super_admin'),true) then raise exception 'Admin permission required' using errcode='42501';end if;
 return (with rows as (select id,bucket_id,name,metadata,created_at,cms_private.media_in_use(bucket_id,name) in_use from storage.objects where bucket_id in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') and strpos(lower(name),lower(left(q,200)))>0 and (media_type='' or split_part(metadata->>'mimetype','/',1)=media_type)),page as(select * from rows order by created_at desc,id limit 24 offset (least(greatest(page_number,1),10000)-1)*24) select jsonb_build_object('items',coalesce((select jsonb_agg(page) from page),'[]'),'total',(select count(*) from rows)));
end $$;
revoke all on function public.cms_media_inventory(text,text,integer) from public,anon;
grant execute on function public.cms_media_inventory(text,text,integer) to authenticated;
commit;
