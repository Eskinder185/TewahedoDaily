-- Tewahedo Daily: normalized Hymns Practice hierarchy.
-- Additive and non-destructive. This migration does not delete, archive, or
-- rewrite existing mezmur, categories, tags, singers, occasions, or browse groups.

begin;

-- Optional normalized metadata fields that are present in the migration CSV but
-- not represented by the current public.mezmur schema. Existing values are not
-- touched by this migration.
alter table public.mezmur
  add column if not exists title_english text,
  add column if not exists description_amharic text,
  add column if not exists lyrics_geez text,
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists review_status text,
  add column if not exists review_notes text,
  add column if not exists source_url text,
  add column if not exists source_notes text,
  add column if not exists hymn_search_document tsvector;

create table if not exists public.hymn_collections (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique
    check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null,
  title_amharic text,
  description text,
  description_amharic text,
  image_path text,
  image_alt text,
  collection_type text not null
    check (collection_type in (
      'occasion_group', 'subject_group', 'language_group',
      'singer_group', 'general_group'
    )),
  sort_order integer not null default 0,
  is_featured boolean not null default false,
  status text not null default 'draft'
    check (status in ('draft', 'published', 'archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.hymn_sections (
  id uuid primary key default gen_random_uuid(),
  collection_id uuid not null
    references public.hymn_collections(id) on delete cascade,
  parent_section_id uuid
    references public.hymn_sections(id) on delete set null,
  slug text not null unique
    check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null,
  title_amharic text,
  description text,
  description_amharic text,
  image_path text,
  image_alt text,
  section_type text not null
    check (section_type in (
      'occasion', 'saint', 'angel', 'subject', 'language',
      'sacrament', 'general', 'singer_collection'
    )),
  source_entity_type text not null default 'manual'
    check (source_entity_type in (
      'occasion', 'category', 'tag', 'language', 'singer', 'manual'
    )),
  source_entity_id uuid,
  source_entity_slug text,
  sort_order integer not null default 0,
  is_featured boolean not null default false,
  status text not null default 'draft'
    check (status in ('draft', 'published', 'archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  check (parent_section_id is null or parent_section_id <> id)
);

create table if not exists public.mezmur_section_links (
  mezmur_id uuid not null
    references public.mezmur(id) on delete cascade,
  section_id uuid not null
    references public.hymn_sections(id) on delete cascade,
  sort_order integer not null default 0,
  is_primary boolean not null default false,
  created_at timestamptz not null default now(),
  primary key (mezmur_id, section_id)
);

create index if not exists hymn_collections_status_sort_idx
  on public.hymn_collections (status, sort_order);
create index if not exists hymn_sections_collection_status_sort_idx
  on public.hymn_sections (collection_id, status, sort_order);
create index if not exists hymn_sections_parent_sort_idx
  on public.hymn_sections (parent_section_id, sort_order)
  where parent_section_id is not null;
create index if not exists hymn_sections_source_idx
  on public.hymn_sections (source_entity_type, source_entity_slug)
  where source_entity_slug is not null;
create index if not exists mezmur_section_links_section_sort_idx
  on public.mezmur_section_links (section_id, sort_order);
create index if not exists mezmur_section_links_mezmur_idx
  on public.mezmur_section_links (mezmur_id);
create unique index if not exists mezmur_section_links_one_primary_idx
  on public.mezmur_section_links (mezmur_id)
  where is_primary;
create index if not exists mezmur_status_idx
  on public.mezmur (status);
create index if not exists mezmur_singer_status_idx
  on public.mezmur (singer_id, status)
  where singer_id is not null;
create index if not exists mezmur_hymn_search_document_idx
  on public.mezmur using gin (hymn_search_document);

drop trigger if exists hymn_collections_updated on public.hymn_collections;
create trigger hymn_collections_updated
  before update on public.hymn_collections
  for each row execute function public.set_updated_at();

drop trigger if exists hymn_sections_updated on public.hymn_sections;
create trigger hymn_sections_updated
  before update on public.hymn_sections
  for each row execute function public.set_updated_at();

create or replace function public.refresh_mezmur_hymn_search_document()
returns trigger
language plpgsql
set search_path = public
as $$
begin
  new.hymn_search_document := to_tsvector(
    'simple',
    concat_ws(
      ' ',
      new.title,
      new.title_amharic,
      new.title_english,
      new.transliteration,
      array_to_string(new.search_keywords, ' '),
      new.description,
      new.description_amharic
    )
  );
  return new;
end;
$$;

drop trigger if exists mezmur_hymn_search_document_updated on public.mezmur;
create trigger mezmur_hymn_search_document_updated
  before insert or update of
    title, title_amharic, title_english, transliteration,
    search_keywords, description, description_amharic
  on public.mezmur
  for each row execute function public.refresh_mezmur_hymn_search_document();

update public.mezmur
set hymn_search_document = to_tsvector(
  'simple',
  concat_ws(
    ' ',
    title,
    title_amharic,
    title_english,
    transliteration,
    array_to_string(search_keywords, ' '),
    description,
    description_amharic
  )
)
where hymn_search_document is null;

alter table public.hymn_collections enable row level security;
alter table public.hymn_sections enable row level security;
alter table public.mezmur_section_links enable row level security;

grant select on public.hymn_collections to anon, authenticated;
grant select on public.hymn_sections to anon, authenticated;
grant select on public.mezmur_section_links to anon, authenticated;
grant insert, update, delete on public.hymn_collections to authenticated;
grant insert, update, delete on public.hymn_sections to authenticated;
grant insert, update, delete on public.mezmur_section_links to authenticated;
grant all on public.hymn_collections to service_role;
grant all on public.hymn_sections to service_role;
grant all on public.mezmur_section_links to service_role;

drop policy if exists hymn_collections_public_read on public.hymn_collections;
create policy hymn_collections_public_read
  on public.hymn_collections for select to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));

drop policy if exists hymn_collections_staff_manage on public.hymn_collections;
create policy hymn_collections_staff_manage
  on public.hymn_collections for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists hymn_sections_public_read on public.hymn_sections;
create policy hymn_sections_public_read
  on public.hymn_sections for select to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));

drop policy if exists hymn_sections_staff_manage on public.hymn_sections;
create policy hymn_sections_staff_manage
  on public.hymn_sections for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists mezmur_section_links_public_read on public.mezmur_section_links;
create policy mezmur_section_links_public_read
  on public.mezmur_section_links for select to anon, authenticated
  using (
    coalesce(public.is_staff(), false)
    or (
      exists (
        select 1 from public.hymn_sections s
        where s.id = section_id and s.status = 'published'
      )
      and exists (
        select 1 from public.mezmur m
        where m.id = mezmur_id and m.status = 'published'
      )
    )
  );

drop policy if exists mezmur_section_links_staff_manage on public.mezmur_section_links;
create policy mezmur_section_links_staff_manage
  on public.mezmur_section_links for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

create or replace view public.hymn_sections_with_counts
with (security_invoker = true)
as
select
  s.id,
  s.slug,
  s.collection_id,
  s.parent_section_id,
  s.title,
  s.title_amharic,
  s.description,
  s.description_amharic,
  s.image_path,
  s.image_alt,
  s.section_type,
  s.source_entity_type,
  s.source_entity_id,
  s.source_entity_slug,
  s.sort_order,
  s.is_featured,
  count(distinct m.id) filter (where m.status = 'published')::integer
    as published_mezmur_count
from public.hymn_sections s
left join public.mezmur_section_links l on l.section_id = s.id
left join public.mezmur m on m.id = l.mezmur_id
where s.status = 'published'
group by s.id;

create or replace view public.hymn_collections_with_counts
with (security_invoker = true)
as
select
  c.id,
  c.slug,
  c.title,
  c.title_amharic,
  c.description,
  c.description_amharic,
  c.image_path,
  c.image_alt,
  c.collection_type,
  c.sort_order,
  c.is_featured,
  count(distinct s.id) filter (where s.status = 'published')::integer
    as published_section_count,
  count(distinct m.id) filter (
    where s.status = 'published' and m.status = 'published'
  )::integer as published_mezmur_count
from public.hymn_collections c
left join public.hymn_sections s on s.collection_id = c.id
left join public.mezmur_section_links l on l.section_id = s.id
left join public.mezmur m on m.id = l.mezmur_id
where c.status = 'published'
group by c.id;

grant select on public.hymn_sections_with_counts to anon, authenticated;
grant select on public.hymn_collections_with_counts to anon, authenticated;

create or replace function public.get_hymns_for_section(
  p_section_slug text,
  p_limit integer default 50,
  p_offset integer default 0
)
returns setof public.mezmur
language sql
stable
security invoker
set search_path = public
as $$
  select m.*
  from public.hymn_sections s
  join public.mezmur_section_links l on l.section_id = s.id
  join public.mezmur m on m.id = l.mezmur_id
  where s.slug = p_section_slug
    and s.status = 'published'
    and m.status = 'published'
  order by l.sort_order, coalesce(m.title, m.title_amharic, m.slug), m.id
  limit greatest(1, least(coalesce(p_limit, 50), 100))
  offset greatest(coalesce(p_offset, 0), 0);
$$;

grant execute on function public.get_hymns_for_section(text, integer, integer)
  to anon, authenticated;

create or replace function public.search_hymn_practice(
  p_query text,
  p_limit integer default 30,
  p_offset integer default 0
)
returns table (
  mezmur_id uuid,
  slug text,
  title text,
  title_amharic text,
  title_english text,
  singer_name text,
  section_slugs text[],
  collection_slugs text[],
  search_rank real
)
language sql
stable
security invoker
set search_path = public
as $$
  with needle as (
    select
      nullif(trim(coalesce(p_query, '')), '') as raw,
      websearch_to_tsquery('simple', trim(coalesce(p_query, ''))) as tsq
  )
  select
    m.id,
    m.slug,
    m.title,
    m.title_amharic,
    m.title_english,
    sg.name,
    coalesce(array_agg(distinct hs.slug) filter (where hs.slug is not null), '{}'),
    coalesce(array_agg(distinct hc.slug) filter (where hc.slug is not null), '{}'),
    (
      ts_rank_cd(coalesce(m.hymn_search_document, ''::tsvector), n.tsq)
      + case when sg.name ilike '%' || n.raw || '%' then 0.25 else 0 end
      + case when bool_or(hs.title ilike '%' || n.raw || '%') then 0.15 else 0 end
      + case when bool_or(hc.title ilike '%' || n.raw || '%') then 0.10 else 0 end
    )::real
  from public.mezmur m
  cross join needle n
  left join public.singers sg on sg.id = m.singer_id
  left join public.mezmur_section_links msl on msl.mezmur_id = m.id
  left join public.hymn_sections hs on hs.id = msl.section_id and hs.status = 'published'
  left join public.hymn_collections hc on hc.id = hs.collection_id and hc.status = 'published'
  where n.raw is not null
    and m.status = 'published'
    and (
      coalesce(m.hymn_search_document, ''::tsvector) @@ n.tsq
      or sg.name ilike '%' || n.raw || '%'
      or hs.title ilike '%' || n.raw || '%'
      or hs.title_amharic ilike '%' || n.raw || '%'
      or hc.title ilike '%' || n.raw || '%'
      or hc.title_amharic ilike '%' || n.raw || '%'
    )
  group by m.id, sg.name, n.raw, n.tsq
  order by search_rank desc, coalesce(m.title, m.title_amharic, m.slug), m.id
  limit greatest(1, least(coalesce(p_limit, 30), 100))
  offset greatest(coalesce(p_offset, 0), 0);
$$;

grant execute on function public.search_hymn_practice(text, integer, integer)
  to anon, authenticated;

comment on table public.hymn_collections is
  'Level 1 Hymns Practice browse cards. Coexists with hymn_browse_groups during cutover.';
comment on table public.hymn_sections is
  'Level 2 browse sections; source_entity_* optionally links existing taxonomy.';
comment on table public.mezmur_section_links is
  'Many-to-many Level 3 membership. Mezmur rows remain canonical in public.mezmur.';

commit;
