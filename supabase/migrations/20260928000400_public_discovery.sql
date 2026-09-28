begin;
alter table public.mezmur add legacy_key text unique, add legacy_aliases text[] not null default '{}',
 add language_codes text[] not null default '{}', add legacy_metadata jsonb;
alter table public.tags add kind text not null default 'topic' check(kind in ('topic','occasion'));
create index mezmur_public_date on public.mezmur(published_at desc,id) where status='published';
create index mezmur_public_title on public.mezmur(title,id) where status='published';
create index mezmur_public_category on public.mezmur(category_id) where status='published';
create index mezmur_public_singer on public.mezmur(singer_id) where status='published';
create function cms_private.mezmur_search_text(m public.mezmur) returns text language sql immutable set search_path='' as $$
 select lower(coalesce(m.title,'')||' '||coalesce(m.title_amharic,'')||' '||coalesce(m.title_oromo,'')||' '||coalesce(m.lyrics_amharic,'')||' '||coalesce(m.lyrics_english,'')||' '||coalesce(m.lyrics_oromo,'')||' '||coalesce(m.transliteration,''))
$$;
create index mezmur_public_search on public.mezmur using gin(cms_private.mezmur_search_text(mezmur) extensions.gin_trgm_ops) where status='published';
create function cms_private.mezmur_languages(m public.mezmur) returns text[] language sql immutable set search_path='' as $$
 select array(select distinct code from unnest(m.language_codes || array[
 case when coalesce(m.lyrics_amharic,'')<>'' then 'am' end,
 case when coalesce(m.lyrics_english,'')<>'' then 'en' end,
 case when coalesce(m.lyrics_oromo,'')<>'' then 'om' end]) code where code is not null)
$$;
-- Security invoker plus explicit status filters: staff sessions also see public content only.
create function public.discover_mezmur(q text default '',language text default '',singer text default '',category text default '',occasion text default '',featured_only boolean default false,sort_by text default 'recent',page_number integer default 1)
returns jsonb language sql stable security invoker set search_path='' as $$
 with matches as (
 select m.id,m.slug,m.title,m.title_amharic,m.description,m.thumbnail_url,m.audio_url,m.featured,m.published_at,m.singer_id,m.category_id,
 s.name singer_name,c.name category_name,cms_private.mezmur_languages(m) languages,
 coalesce((select jsonb_agg(jsonb_build_object('id',t.id,'name',t.name,'slug',t.slug,'kind',t.kind) order by t.name) from public.mezmur_tags mt join public.tags t on t.id=mt.tag_id where mt.mezmur_id=m.id),'[]') tags
 from public.mezmur m left join public.singers s on s.id=m.singer_id left join public.categories c on c.id=m.category_id
 where m.status='published' and (not featured_only or m.featured)
 and (language='' or language=any(cms_private.mezmur_languages(m)))
 and (singer='' or m.singer_id::text=singer) and (category='' or m.category_id::text=category)
 and (occasion='' or exists(select 1 from public.mezmur_tags mt join public.tags t on t.id=mt.tag_id where mt.mezmur_id=m.id and t.kind='occasion' and t.slug=occasion))
 and (trim(q)='' or cms_private.mezmur_search_text(m) like '%'||replace(replace(replace(lower(left(trim(q),200)),'\','\\'),'%','\%'),'_','\_')||'%'
 or lower(coalesce(s.name,'')||' '||coalesce(s.name_amharic,'')) like '%'||replace(replace(replace(lower(left(trim(q),200)),'\','\\'),'%','\%'),'_','\_')||'%'
 or exists(select 1 from public.mezmur_tags mt join public.tags t on t.id=mt.tag_id where mt.mezmur_id=m.id and strpos(lower(t.name),lower(left(trim(q),200)))>0))
 ), page as (select * from matches order by case when sort_by='alphabetical' then title end asc,case when sort_by<>'alphabetical' then published_at end desc nulls last,id limit 24 offset (least(greatest(page_number,1),10000)-1)*24)
 select jsonb_build_object('items',coalesce((select jsonb_agg(to_jsonb(page)) from page),'[]'),'total',(select count(*) from matches),'page',least(greatest(page_number,1),10000))
$$;
create function public.public_mezmur_detail(slug_or_alias text) returns jsonb language sql stable security invoker set search_path='' as $$
 select to_jsonb(m)-'legacy_metadata'-'created_by'-'updated_by' || jsonb_build_object('singer_name',s.name,'category_name',c.name,'languages',cms_private.mezmur_languages(m),
 'tags',coalesce((select jsonb_agg(jsonb_build_object('id',t.id,'name',t.name,'slug',t.slug,'kind',t.kind) order by t.name) from public.mezmur_tags mt join public.tags t on t.id=mt.tag_id where mt.mezmur_id=m.id),'[]'))
 from public.mezmur m left join public.singers s on s.id=m.singer_id left join public.categories c on c.id=m.category_id
 where m.status='published' and (m.slug=slug_or_alias or slug_or_alias=any(m.legacy_aliases)) order by (m.slug=slug_or_alias) desc limit 1
$$;
create function public.public_discovery_facets() returns jsonb language sql stable security invoker set search_path='' as $$
 select jsonb_build_object(
 'singers',coalesce((select jsonb_agg(x order by x.name) from (select s.id,s.name from public.singers s where exists(select 1 from public.mezmur m where m.singer_id=s.id and m.status='published')) x),'[]'),
 'categories',coalesce((select jsonb_agg(x order by x.name) from (select c.id,c.name from public.categories c where exists(select 1 from public.mezmur m where m.category_id=c.id and m.status='published')) x),'[]'),
 'occasions',coalesce((select jsonb_agg(x order by x.name) from (select t.slug,t.name from public.tags t where t.kind='occasion' and exists(select 1 from public.mezmur_tags mt join public.mezmur m on m.id=mt.mezmur_id where mt.tag_id=t.id and m.status='published')) x),'[]'))
$$;
create function public.search_public_content(q text,page_number integer default 1) returns jsonb language sql stable security invoker set search_path='' as $$
 with all_content as (
 select 'mezmur' kind,m.slug,m.title,m.title_amharic,m.description,m.published_at,cms_private.mezmur_search_text(m)||' '||coalesce(s.name,'')||' '||coalesce((select string_agg(t.name,' ') from public.mezmur_tags mt join public.tags t on t.id=mt.tag_id where mt.mezmur_id=m.id),'') searchable from public.mezmur m left join public.singers s on s.id=m.singer_id where m.status='published'
 union all select 'saints',slug,title,title_amharic,description,published_at,concat_ws(' ',title,title_amharic,description,body,body_amharic) from public.saints where status='published'
 union all select 'prayers',slug,title,title_amharic,description,published_at,concat_ws(' ',title,title_amharic,title_oromo,description,body,body_amharic,body_oromo) from public.prayers where status='published'
 union all select 'feasts',slug,title,title_amharic,description,published_at,concat_ws(' ',title,title_amharic,description,body,body_amharic) from public.feasts where status='published'
 union all select 'articles',slug,title,title_amharic,description,published_at,concat_ws(' ',title,title_amharic,title_oromo,description,body,body_amharic,body_oromo) from public.articles where status='published'
 ), matches as (select kind,slug,title,title_amharic,left(description,240) description,published_at from all_content where length(trim(q))>=2 and strpos(lower(searchable),lower(left(trim(q),200)))>0),
 page as (select * from matches order by published_at desc nulls last,kind,slug limit 24 offset (least(greatest(page_number,1),10000)-1)*24)
 select jsonb_build_object('items',coalesce((select jsonb_agg(to_jsonb(page)) from page),'[]'),'total',(select count(*) from matches))
$$;
grant execute on function cms_private.mezmur_search_text(public.mezmur),cms_private.mezmur_languages(public.mezmur) to anon,authenticated;
revoke all on function public.discover_mezmur(text,text,text,text,text,boolean,text,integer),public.public_mezmur_detail(text),public.public_discovery_facets(),public.search_public_content(text,integer) from public;
grant execute on function public.discover_mezmur(text,text,text,text,text,boolean,text,integer),public.public_mezmur_detail(text),public.public_discovery_facets(),public.search_public_content(text,integer) to anon,authenticated;

create table public.mezmur_favorites (
 user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
 mezmur_id uuid not null references public.mezmur(id) on delete cascade,
 created_at timestamptz not null default now(),primary key(user_id,mezmur_id)
);
alter table public.mezmur_favorites enable row level security;
revoke all on public.mezmur_favorites from public,anon,authenticated;
grant select,insert,delete on public.mezmur_favorites to authenticated;
create policy favorites_read on public.mezmur_favorites for select to authenticated using(user_id=auth.uid());
create policy favorites_insert on public.mezmur_favorites for insert to authenticated with check(user_id=auth.uid() and exists(select 1 from public.mezmur m where m.id=mezmur_id and m.status='published'));
create policy favorites_delete on public.mezmur_favorites for delete to authenticated using(user_id=auth.uid());
create function public.public_favorites(page_number integer default 1) returns jsonb language sql stable security invoker set search_path='' as $$
 with visible as (select m.id,m.slug,m.title,m.title_amharic,m.description,m.thumbnail_url,m.audio_url,m.featured,m.published_at,s.name singer_name,c.name category_name,cms_private.mezmur_languages(m) languages,'[]'::jsonb tags,f.created_at saved_at
 from public.mezmur_favorites f join public.mezmur m on m.id=f.mezmur_id left join public.singers s on s.id=m.singer_id left join public.categories c on c.id=m.category_id where f.user_id=auth.uid() and m.status='published'),
 page as (select * from visible order by saved_at desc,id limit 24 offset (least(greatest(page_number,1),10000)-1)*24)
 select jsonb_build_object('items',coalesce((select jsonb_agg(to_jsonb(page)) from page),'[]'),'total',(select count(*) from visible))
$$;
revoke all on function public.public_favorites(integer) from public,anon;
grant execute on function public.public_favorites(integer) to authenticated;

-- Atomic, insert-only importer. Existing editorial content is never overwritten.
create function public.import_legacy_mezmur(payload jsonb,publish_existing boolean default false) returns jsonb language plpgsql security definer set search_path='' as $$
declare existing public.mezmur; new_id uuid; category_id uuid; singer_id uuid; tag_id uuid; tag jsonb; singer_label text:=nullif(trim(payload->>'singer_name'),'');
begin
 perform pg_advisory_xact_lock(9280400);
 if nullif(payload->>'legacy_key','') is null or nullif(trim(payload->>'title'),'') is null then raise exception 'Missing source key/title'; end if;
 select * into existing from public.mezmur m where m.legacy_key=payload->>'legacy_key' or m.slug=payload->>'slug'
 or (nullif(payload->>'youtube_url','') is not null and cms_private.youtube_key(m.youtube_url)=cms_private.youtube_key(payload->>'youtube_url'))
 or (lower(m.title)=lower(payload->>'title') and coalesce(lower(m.title_amharic),'')=coalesce(lower(payload->>'title_amharic'),'')) limit 1;
 if found then return jsonb_build_object('status','skipped_existing','id',existing.id,'slug',existing.slug); end if;
 insert into public.categories(name,name_amharic,slug,type) values(payload->'category'->>'name',nullif(payload->'category'->>'name_amharic',''),payload->'category'->>'slug','mezmur') on conflict(slug) do nothing;
 select id into category_id from public.categories where slug=payload->'category'->>'slug';
 if singer_label is not null then
  select id into singer_id from public.singers where lower(name)=lower(singer_label) limit 1;
  if singer_id is null then insert into public.singers(name) values(singer_label) returning id into singer_id; end if;
 end if;
 insert into public.mezmur(slug,title,title_amharic,description,lyrics_amharic,lyrics_english,lyrics_oromo,transliteration,youtube_url,audio_url,thumbnail_url,singer_id,category_id,status,legacy_key,legacy_aliases,language_codes,legacy_metadata)
 values(payload->>'slug',payload->>'title',nullif(payload->>'title_amharic',''),payload->>'description',payload->>'lyrics_amharic',payload->>'lyrics_english',payload->>'lyrics_oromo',payload->>'transliteration',nullif(payload->>'youtube_url',''),nullif(payload->>'audio_url',''),nullif(payload->>'thumbnail_url',''),singer_id,category_id,case when publish_existing then 'published'::public.content_status else 'draft'::public.content_status end,payload->>'legacy_key',array(select jsonb_array_elements_text(payload->'legacy_aliases')),array(select jsonb_array_elements_text(payload->'language_codes')),payload->'legacy_metadata') returning id into new_id;
 for tag in select value from jsonb_array_elements(payload->'tags') loop
  insert into public.tags(name,slug,kind) values(tag->>'name',tag->>'slug',tag->>'kind') on conflict(slug) do nothing;
  select id into tag_id from public.tags where slug=tag->>'slug';
  insert into public.mezmur_tags values(new_id,tag_id) on conflict do nothing;
 end loop;
 return jsonb_build_object('status','inserted','id',new_id,'slug',payload->>'slug');
end $$;
revoke all on function public.import_legacy_mezmur(jsonb,boolean) from public,anon,authenticated;
grant execute on function public.import_legacy_mezmur(jsonb,boolean) to service_role;
commit;
