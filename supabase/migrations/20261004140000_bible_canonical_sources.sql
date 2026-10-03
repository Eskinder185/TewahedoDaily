-- Bible storage only. No scripture is imported or published by this migration.
-- A canonical book can contain multiple original source volumes.
begin;

create extension if not exists pgcrypto;

create table if not exists public.bible_editions (
  id uuid primary key default gen_random_uuid(),
  code text not null unique check (code ~ '^[a-z0-9-]+$'),
  name text not null check (length(trim(name)) > 0),
  language_code text not null check (length(trim(language_code)) > 0),
  source_metadata jsonb not null default '{}'::jsonb,
  review_status text not null default 'draft'
    check (review_status in ('draft', 'needs_review', 'reviewed')),
  is_public boolean not null default false
    check (not is_public or review_status = 'reviewed'),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.bible_canonical_books (
  id uuid primary key default gen_random_uuid(),
  canonical_number integer not null,
  collection text not null check (collection in ('old', 'new')),
  slug text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  name_en text,
  name_am text,
  sort_order integer not null unique check (sort_order between 1 and 81),
  source_status text not null default 'missing'
    check (source_status in ('available', 'partial', 'missing')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (collection, canonical_number),
  check (
    (collection = 'old' and canonical_number between 1 and 46)
    or (collection = 'new' and canonical_number between 1 and 35)
  )
);

create table if not exists public.bible_source_books (
  id uuid primary key default gen_random_uuid(),
  edition_id uuid not null references public.bible_editions(id) on delete restrict,
  canonical_book_id uuid not null references public.bible_canonical_books(id) on delete restrict,
  source_book_number integer not null check (source_book_number > 0),
  source_file text not null check (length(trim(source_file)) > 0),
  source_name_en text,
  source_name_am text,
  source_short_name_en text,
  source_short_name_am text,
  source_order integer not null check (source_order > 0),
  source_part integer check (source_part > 0),
  source_metadata jsonb not null default '{}'::jsonb,
  review_status text not null default 'draft'
    check (review_status in ('draft', 'needs_review', 'reviewed')),
  is_public boolean not null default false
    check (not is_public or review_status = 'reviewed'),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (edition_id, source_book_number),
  unique (edition_id, source_order)
);

create table if not exists public.bible_chapters (
  id uuid primary key default gen_random_uuid(),
  source_book_id uuid not null references public.bible_source_books(id) on delete cascade,
  chapter_number integer not null check (chapter_number >= 0),
  source_order integer not null check (source_order > 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (source_book_id, source_order),
  unique (source_book_id, chapter_number)
);

create table if not exists public.bible_sections (
  id uuid primary key default gen_random_uuid(),
  chapter_id uuid not null references public.bible_chapters(id) on delete cascade,
  source_order integer not null check (source_order > 0),
  title text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (chapter_id, source_order)
);

create table if not exists public.bible_verses (
  id uuid primary key default gen_random_uuid(),
  section_id uuid not null references public.bible_sections(id) on delete cascade,
  source_order integer not null check (source_order > 0),
  verse_number integer not null check (verse_number >= 0),
  text text not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (section_id, source_order)
);

-- Verse number is deliberately not unique: the source can repeat explicit labels.
create index if not exists bible_source_books_canonical_idx
  on public.bible_source_books(canonical_book_id, edition_id, source_order);
-- The three child-table (parent_id, source_order) indexes are supplied by
-- their unique constraints above; separate copies would duplicate them.

create trigger bible_editions_set_updated_at before update on public.bible_editions
  for each row execute function public.set_updated_at();
create trigger bible_canonical_books_set_updated_at before update on public.bible_canonical_books
  for each row execute function public.set_updated_at();
create trigger bible_source_books_set_updated_at before update on public.bible_source_books
  for each row execute function public.set_updated_at();
create trigger bible_chapters_set_updated_at before update on public.bible_chapters
  for each row execute function public.set_updated_at();
create trigger bible_sections_set_updated_at before update on public.bible_sections
  for each row execute function public.set_updated_at();
create trigger bible_verses_set_updated_at before update on public.bible_verses
  for each row execute function public.set_updated_at();

alter table public.bible_editions enable row level security;
alter table public.bible_canonical_books enable row level security;
alter table public.bible_source_books enable row level security;
alter table public.bible_chapters enable row level security;
alter table public.bible_sections enable row level security;
alter table public.bible_verses enable row level security;

revoke all on public.bible_editions, public.bible_canonical_books,
  public.bible_source_books, public.bible_chapters, public.bible_sections,
  public.bible_verses from public, anon, authenticated;
grant select on public.bible_editions, public.bible_canonical_books,
  public.bible_source_books, public.bible_chapters, public.bible_sections,
  public.bible_verses to anon, authenticated;
grant all on public.bible_editions, public.bible_canonical_books,
  public.bible_source_books, public.bible_chapters, public.bible_sections,
  public.bible_verses to service_role;

create policy bible_editions_public_read on public.bible_editions
  for select to anon, authenticated using (is_public and review_status = 'reviewed');
create policy bible_canonical_books_public_read on public.bible_canonical_books
  for select to anon, authenticated using (true);
create policy bible_source_books_public_read on public.bible_source_books
  for select to anon, authenticated using (
    is_public and review_status = 'reviewed' and exists (
      select 1 from public.bible_editions e
      where e.id = edition_id and e.is_public and e.review_status = 'reviewed'
    )
  );
create policy bible_chapters_public_read on public.bible_chapters
  for select to anon, authenticated using (
    exists (select 1 from public.bible_source_books b where b.id = source_book_id)
  );
create policy bible_sections_public_read on public.bible_sections
  for select to anon, authenticated using (
    exists (select 1 from public.bible_chapters c where c.id = chapter_id)
  );
create policy bible_verses_public_read on public.bible_verses
  for select to anon, authenticated using (
    exists (select 1 from public.bible_sections s where s.id = section_id)
  );

notify pgrst, 'reload schema';
commit;
