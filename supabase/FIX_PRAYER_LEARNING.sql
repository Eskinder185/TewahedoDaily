-- Prayer learning hierarchy (collection → section → bilingual content).
-- Safe to run multiple times. Matches the normalized CSV import shape.

begin;

create table if not exists public.prayer_learning_collections (
  collection_slug text primary key check (collection_slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title_english text not null,
  title_amharic text,
  description_english text,
  description_amharic text,
  sort_order integer not null default 0,
  display_style text,
  status public.content_status not null default 'draft',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.prayer_learning_sections (
  section_slug text primary key check (section_slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  collection_slug text not null references public.prayer_learning_collections(collection_slug) on delete cascade,
  parent_section_slug text references public.prayer_learning_sections(section_slug) on delete set null,
  sort_order integer not null default 0,
  title_english text not null,
  title_amharic text,
  summary_english text,
  summary_amharic text,
  content_type text,
  display_style text,
  show_in_contents boolean not null default true,
  step_number integer,
  is_expandable boolean not null default false,
  status public.content_status not null default 'draft',
  review_status text not null default 'draft',
  review_note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.prayer_learning_content (
  content_id text primary key,
  section_slug text not null references public.prayer_learning_sections(section_slug) on delete cascade,
  content_order integer not null default 0,
  content_kind text not null default 'body',
  language text not null check (language in ('am', 'en')),
  heading text,
  body text,
  source_reference text,
  review_status text not null default 'draft',
  review_note text,
  status public.content_status not null default 'draft',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists prayer_learning_collections_sort_idx
  on public.prayer_learning_collections (sort_order, collection_slug);
create index if not exists prayer_learning_sections_collection_sort_idx
  on public.prayer_learning_sections (collection_slug, sort_order, section_slug);
create index if not exists prayer_learning_content_section_order_idx
  on public.prayer_learning_content (section_slug, content_order, language);

alter table public.prayer_learning_collections enable row level security;
alter table public.prayer_learning_sections enable row level security;
alter table public.prayer_learning_content enable row level security;

grant select on public.prayer_learning_collections, public.prayer_learning_sections, public.prayer_learning_content to anon, authenticated;
grant insert, update, delete on public.prayer_learning_collections, public.prayer_learning_sections, public.prayer_learning_content to authenticated;
grant all on public.prayer_learning_collections, public.prayer_learning_sections, public.prayer_learning_content to service_role;

drop policy if exists prayer_learning_collections_public_read on public.prayer_learning_collections;
create policy prayer_learning_collections_public_read
  on public.prayer_learning_collections for select to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));

drop policy if exists prayer_learning_sections_public_read on public.prayer_learning_sections;
create policy prayer_learning_sections_public_read
  on public.prayer_learning_sections for select to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));

drop policy if exists prayer_learning_content_public_read on public.prayer_learning_content;
create policy prayer_learning_content_public_read
  on public.prayer_learning_content for select to anon, authenticated
  using (status = 'published' or coalesce(public.is_staff(), false));

drop policy if exists prayer_learning_collections_staff_write on public.prayer_learning_collections;
create policy prayer_learning_collections_staff_write
  on public.prayer_learning_collections for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists prayer_learning_sections_staff_write on public.prayer_learning_sections;
create policy prayer_learning_sections_staff_write
  on public.prayer_learning_sections for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

drop policy if exists prayer_learning_content_staff_write on public.prayer_learning_content;
create policy prayer_learning_content_staff_write
  on public.prayer_learning_content for all to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

commit;
