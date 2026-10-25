-- MEZMUR_PUBLICATION_GUARD.sql
--
-- MANUAL, GUARDED production action. This script does not approve or publish
-- any row. It aborts unless every currently published row has required
-- fields (title, slug, lyrics_amharic) and is not restricted to external_only.
--
-- Safe properties:
--   * never disables RLS
--   * never updates/deletes Mezmur content
--   * preserves review_status, review_notes, lyrics, Zemari fields, and links
--   * blocks duplicate/blank stable identifiers before adding uniqueness
--   * hides draft or external_only rows and their relationship links from anon clients

begin;

alter table public.mezmur_data_import
  add column if not exists rights_status text not null default 'unknown',
  add column if not exists publication_approved_at timestamptz,
  add column if not exists publication_approved_by uuid references auth.users(id) on delete set null;

do $$ begin
  alter table public.mezmur_data_import
    add constraint mezmur_data_import_rights_status_check
    check (rights_status in (
      'owned', 'licensed', 'authorized_contributor', 'public_domain',
      'display_only', 'external_only', 'unknown'
    ));
exception when duplicate_object then null; end $$;

do $$
declare
  blocker_count integer;
begin
  select count(*) into blocker_count
  from public.mezmur_data_import
  where nullif(trim(slug), '') is null or nullif(trim(mezmur_id), '') is null;
  if blocker_count > 0 then
    raise exception 'Publication guard blocked: % rows have blank slug or mezmur_id.', blocker_count;
  end if;

  select count(*) into blocker_count
  from (
    select lower(trim(slug))
    from public.mezmur_data_import
    group by lower(trim(slug))
    having count(*) > 1
  ) duplicates;
  if blocker_count > 0 then
    raise exception 'Publication guard blocked: % duplicate normalized slugs require editorial resolution.', blocker_count;
  end if;

  select count(*) into blocker_count
  from public.mezmur_data_import
  where lower(trim(coalesce(status, ''))) = 'published'
    and (
      nullif(trim(coalesce(title, '')), '') is null
      or nullif(trim(coalesce(slug, '')), '') is null
      or nullif(trim(coalesce(lyrics_amharic, '')), '') is null
      or coalesce(rights_status, 'unknown') = 'external_only'
    );
  if blocker_count > 0 then
    raise exception
      'Publication guard blocked: % published rows lack title, slug, Amharic lyrics, or have external_only rights.',
      blocker_count;
  end if;
end $$;

create unique index if not exists mezmur_data_import_slug_normalized_uidx
  on public.mezmur_data_import (lower(trim(slug)));
create unique index if not exists mezmur_data_import_mezmur_id_uidx
  on public.mezmur_data_import (mezmur_id);

alter table public.mezmur_data_import enable row level security;
revoke select on public.mezmur_data_import from anon;
grant select, insert, update on public.mezmur_data_import to authenticated;

drop policy if exists mezmur_data_import_public_read on public.mezmur_data_import;
drop policy if exists mezmur_data_import_staff_read on public.mezmur_data_import;
create policy mezmur_data_import_staff_read
  on public.mezmur_data_import
  for select
  to authenticated
  using (coalesce(public.is_staff(), false));

-- Relationship staging tables must not reveal unpublished slugs.
alter table public.mezmur_section_links_import enable row level security;
alter table public.mezmur_occasion_links_import enable row level security;
alter table public.mezmur_category_links_import enable row level security;

grant select on public.mezmur_section_links_import,
  public.mezmur_occasion_links_import,
  public.mezmur_category_links_import to anon, authenticated;

drop policy if exists mezmur_section_links_import_public_read on public.mezmur_section_links_import;
create policy mezmur_section_links_import_public_read
  on public.mezmur_section_links_import for select to anon, authenticated
  using (exists (
    select 1 from public.mezmur_public m
    where lower(trim(m.slug)) = lower(trim(mezmur_slug))
  ));

drop policy if exists mezmur_occasion_links_import_public_read on public.mezmur_occasion_links_import;
create policy mezmur_occasion_links_import_public_read
  on public.mezmur_occasion_links_import for select to anon, authenticated
  using (exists (
    select 1 from public.mezmur_public m
    where lower(trim(m.slug)) = lower(trim(mezmur_slug))
  ));

drop policy if exists mezmur_category_links_import_public_read on public.mezmur_category_links_import;
create policy mezmur_category_links_import_public_read
  on public.mezmur_category_links_import for select to anon, authenticated
  using (exists (
    select 1 from public.mezmur_public m
    where lower(trim(m.slug)) = lower(trim(mezmur_slug))
  ));

notify pgrst, 'reload schema';

commit;
