-- Zemari (singer) CMS registry + mezmur_data_import.zemari_id link.
-- Additive. Keeps legacy singer_id / singer_slug / singer_name.

begin;

do $$
begin
  if to_regprocedure('public.is_staff()') is null then
    execute $fn$
      create function public.is_staff()
      returns boolean
      language sql
      stable
      security definer
      set search_path = public
      as $body$
        select coalesce(
          (select role in ('editor', 'admin', 'super_admin')
           from public.profiles
           where id = auth.uid()),
          false
        );
      $body$;
    $fn$;
    revoke all on function public.is_staff() from public, anon;
    grant execute on function public.is_staff() to authenticated, anon;
  end if;
end $$;

create table if not exists public.zemaris (
  id uuid primary key default gen_random_uuid(),
  slug text not null,
  name text not null,
  name_amharic text,
  bio text,
  bio_amharic text,
  image_path text,
  image_alt text,
  youtube_url text,
  website_url text,
  sort_order integer not null default 0,
  is_featured boolean not null default false,
  status text not null default 'published'
    check (status in ('draft', 'published', 'archived')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint zemaris_slug_unique unique (slug)
);

create index if not exists zemaris_status_sort_idx
  on public.zemaris (status, sort_order, name);

create index if not exists zemaris_featured_idx
  on public.zemaris (is_featured)
  where is_featured = true;

drop trigger if exists zemaris_set_updated_at on public.zemaris;
create trigger zemaris_set_updated_at
  before update on public.zemaris
  for each row execute function public.set_updated_at();

comment on table public.zemaris is
  'Canonical Zemari / singer profiles for Hymns Practice CMS and public browse.';

-- Link column on import hymns (legacy singer_* kept)
alter table public.mezmur_data_import
  add column if not exists zemari_id uuid;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'mezmur_data_import_zemari_id_fkey'
  ) then
    alter table public.mezmur_data_import
      add constraint mezmur_data_import_zemari_id_fkey
      foreign key (zemari_id) references public.zemaris(id)
      on delete set null;
  end if;
end $$;

create index if not exists mezmur_data_import_zemari_id_idx
  on public.mezmur_data_import (zemari_id)
  where zemari_id is not null;

-- Seed distinct zemaris from existing singer_* fields (no duplicates)
with source as (
  select
    nullif(trim(singer_slug), '') as singer_slug,
    nullif(trim(singer_id), '') as singer_id,
    nullif(trim(singer_name), '') as singer_name
  from public.mezmur_data_import
  where coalesce(nullif(trim(singer_name), ''), nullif(trim(singer_slug), ''), nullif(trim(singer_id), '')) is not null
),
normalized as (
  select distinct on (identity_key)
    identity_key,
    preferred_slug,
    display_name
  from (
    select
      lower(
        coalesce(
          nullif(trim(singer_slug), ''),
          nullif(trim(singer_id), ''),
          regexp_replace(lower(trim(singer_name)), '[^a-z0-9]+', '-', 'g')
        )
      ) as identity_key,
      coalesce(
        nullif(trim(singer_slug), ''),
        nullif(
          trim(both '-' from regexp_replace(lower(coalesce(singer_name, singer_id, 'zemari')), '[^a-z0-9]+', '-', 'g')),
          ''
        ),
        'zemari'
      ) as preferred_slug,
      coalesce(nullif(trim(singer_name), ''), nullif(trim(singer_slug), ''), nullif(trim(singer_id), ''), 'Zemari')
        as display_name
    from source
  ) s
  where identity_key is not null and identity_key <> ''
  order by identity_key, preferred_slug
)
insert into public.zemaris (slug, name, status, sort_order)
select
  left(preferred_slug, 80),
  display_name,
  'published',
  row_number() over (order by display_name) * 10
from normalized n
where not exists (
  select 1 from public.zemaris z where z.slug = left(n.preferred_slug, 80)
)
on conflict (slug) do nothing;

-- Backfill mezmur_data_import.zemari_id
update public.mezmur_data_import m
set zemari_id = z.id
from public.zemaris z
where m.zemari_id is null
  and (
    (nullif(trim(m.singer_slug), '') is not null and lower(trim(m.singer_slug)) = lower(z.slug))
    or (
      nullif(trim(m.singer_name), '') is not null
      and lower(trim(m.singer_name)) = lower(z.name)
    )
    or (
      nullif(trim(m.singer_id), '') is not null
      and (
        lower(trim(m.singer_id)) = lower(z.slug)
        or trim(m.singer_id) = z.id::text
      )
    )
  );

create or replace view public.zemaris_with_counts
with (security_invoker = true)
as
select
  z.id,
  z.slug,
  z.name,
  z.name_amharic,
  z.bio,
  z.bio_amharic,
  z.image_path,
  z.image_alt,
  z.youtube_url,
  z.website_url,
  z.sort_order,
  z.is_featured,
  z.status,
  z.created_at,
  z.updated_at,
  coalesce((
    select count(*)::int
    from public.mezmur_data_import m
    where m.zemari_id is not null
      and m.zemari_id::text = z.id::text
      and (
        nullif(trim(coalesce(m.status, '')), '') is null
        or lower(trim(m.status)) in ('published', 'active', 'true', '1')
        or lower(trim(m.status)) not in ('draft', 'archived', 'hidden', 'rejected', 'deleted')
      )
  ), 0) as published_mezmur_count,
  coalesce((
    select count(*)::int
    from public.mezmur_data_import m
    where m.zemari_id is not null
      and m.zemari_id::text = z.id::text
  ), 0) as mezmur_count
from public.zemaris z;

comment on view public.zemaris_with_counts is
  'Zemaris with mezmur counts from mezmur_data_import.zemari_id.';

-- RLS: public read published; staff full write
alter table public.zemaris enable row level security;

grant select on table public.zemaris to anon, authenticated;
grant insert, update, delete on table public.zemaris to authenticated;
revoke insert, update, delete on table public.zemaris from anon;

drop policy if exists zemaris_public_read on public.zemaris;
create policy zemaris_public_read
  on public.zemaris
  for select
  to anon, authenticated
  using (
    status = 'published'
    or coalesce(public.is_staff(), false)
  );

drop policy if exists zemaris_staff_insert on public.zemaris;
create policy zemaris_staff_insert
  on public.zemaris
  for insert
  to authenticated
  with check (coalesce(public.is_staff(), false));

drop policy if exists zemaris_staff_update on public.zemaris;
create policy zemaris_staff_update
  on public.zemaris
  for update
  to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists zemaris_staff_delete on public.zemaris;
create policy zemaris_staff_delete
  on public.zemaris
  for delete
  to authenticated
  using (coalesce(public.is_staff(), false));

grant select on table public.zemaris_with_counts to anon, authenticated;

-- Staff may update mezmur_data_import (including zemari_id); keep anon read-only
alter table if exists public.mezmur_data_import enable row level security;
grant select on table public.mezmur_data_import to anon, authenticated;
grant insert, update on table public.mezmur_data_import to authenticated;
revoke insert, update, delete on table public.mezmur_data_import from anon;

drop policy if exists mezmur_data_import_public_read on public.mezmur_data_import;
create policy mezmur_data_import_public_read
  on public.mezmur_data_import
  for select
  to anon, authenticated
  using (true);

drop policy if exists mezmur_data_import_staff_update on public.mezmur_data_import;
create policy mezmur_data_import_staff_update
  on public.mezmur_data_import
  for update
  to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists mezmur_data_import_staff_insert on public.mezmur_data_import;
create policy mezmur_data_import_staff_insert
  on public.mezmur_data_import
  for insert
  to authenticated
  with check (coalesce(public.is_staff(), false));

notify pgrst, 'reload schema';

commit;
