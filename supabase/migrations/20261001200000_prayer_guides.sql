-- Prayer educational guides (Learn How to Pray, Order of Prayer, future guides).
-- Additive: does not modify existing prayer book tables.

begin;

create extension if not exists pgcrypto;

create table if not exists public.prayer_guides (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null check (length(trim(title)) > 0),
  title_amharic text,
  summary text,
  summary_amharic text,
  status public.content_status not null default 'draft',
  sort_order integer not null default 0,
  source_title text,
  source_reference text,
  review_status text not null default 'draft'
    check (review_status in ('draft', 'needs_review', 'reviewed')),
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.prayer_guide_sections (
  id uuid primary key default gen_random_uuid(),
  guide_id uuid not null references public.prayer_guides(id) on delete cascade,
  slug text not null check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null check (length(trim(title)) > 0),
  title_amharic text,
  body_english text,
  body_amharic text,
  sort_order integer not null default 0,
  source_reference text,
  review_status text not null default 'draft'
    check (review_status in ('draft', 'needs_review', 'reviewed')),
  review_notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (guide_id, slug)
);

create index if not exists prayer_guides_published_sort_idx
  on public.prayer_guides (sort_order, slug)
  where status = 'published';

create index if not exists prayer_guides_status_idx
  on public.prayer_guides (status, updated_at desc);

create index if not exists prayer_guide_sections_guide_sort_idx
  on public.prayer_guide_sections (guide_id, sort_order, slug);

create index if not exists prayer_guide_sections_review_idx
  on public.prayer_guide_sections (review_status);

drop trigger if exists prayer_guides_set_updated_at on public.prayer_guides;
create trigger prayer_guides_set_updated_at
  before update on public.prayer_guides
  for each row execute function public.set_updated_at();

drop trigger if exists prayer_guide_sections_set_updated_at on public.prayer_guide_sections;
create trigger prayer_guide_sections_set_updated_at
  before update on public.prayer_guide_sections
  for each row execute function public.set_updated_at();

alter table public.prayer_guides enable row level security;
alter table public.prayer_guide_sections enable row level security;

revoke all on public.prayer_guides from public, anon, authenticated;
revoke all on public.prayer_guide_sections from public, anon, authenticated;

grant select on public.prayer_guides, public.prayer_guide_sections to anon, authenticated;
grant insert, update, delete on public.prayer_guides, public.prayer_guide_sections to authenticated;
grant all on public.prayer_guides, public.prayer_guide_sections to service_role;

-- Ensure is_staff() exists for CMS writes (same bootstrap as mezmur save migrations).
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

drop policy if exists prayer_guides_public_read on public.prayer_guides;
create policy prayer_guides_public_read
  on public.prayer_guides for select to anon, authenticated
  using (
    status = 'published'
    or coalesce(public.is_staff(), false)
  );

drop policy if exists prayer_guides_staff_write on public.prayer_guides;
create policy prayer_guides_staff_write
  on public.prayer_guides for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists prayer_guide_sections_public_read on public.prayer_guide_sections;
create policy prayer_guide_sections_public_read
  on public.prayer_guide_sections for select to anon, authenticated
  using (
    exists (
      select 1
      from public.prayer_guides g
      where g.id = guide_id
        and (
          g.status = 'published'
          or coalesce(public.is_staff(), false)
        )
    )
  );

drop policy if exists prayer_guide_sections_staff_write on public.prayer_guide_sections;
create policy prayer_guide_sections_staff_write
  on public.prayer_guide_sections for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

commit;
