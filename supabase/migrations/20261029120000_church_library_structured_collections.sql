-- ============================================================================
-- TEWAHEDODAILY: CHURCH LIBRARY — STRUCTURED, BILINGUAL COLLECTIONS
-- Migration: 20261029120000_church_library_structured_collections.sql
--
-- Extends the existing church_library_* schema (it does not create a second
-- library). Forward-only, additive and idempotent:
--   * no table, column, book, section or passage is dropped or rewritten;
--   * existing books keep their current visibility (publication_status stays
--     NULL = "legacy, governed by the existing gates");
--   * books created by the structured import start as 'draft' and can only be
--     read publicly after staff move them draft → reviewed → published AND the
--     existing rights/approval gates are satisfied.
-- Adds: stable slugs and section/paragraph keys, chapter → section hierarchy,
-- language-edition groups, Amharic-aware search folding, per-user bookmarks and
-- reading progress, staff import/publication RPCs, permitted original downloads.
-- ============================================================================
begin;

create extension if not exists pg_trgm with schema extensions;
create extension if not exists vector with schema extensions;

-- 0. Columns referenced by the legacy public gate must exist everywhere --------
alter table public.church_library_books
  add column if not exists search_enabled boolean,
  add column if not exists ingestion_status text,
  add column if not exists title_amharic text,
  add column if not exists access_level text not null default 'private',
  add column if not exists rights_status text not null default 'unknown',
  add column if not exists allow_search_quotes boolean not null default false,
  add column if not exists approved_for_ingestion boolean not null default false,
  add column if not exists public_retrieval_enabled boolean not null default false,
  add column if not exists processing_status text not null default 'not_uploaded',
  add column if not exists current_version_id uuid,
  add column if not exists author text,
  add column if not exists category text,
  add column if not exists description text,
  add column if not exists source_url text,
  add column if not exists allow_source_link boolean not null default false,
  add column if not exists rights_notes text,
  add column if not exists document_type text not null default 'book';

alter table public.church_library_passages
  add column if not exists review_status text not null default 'pending',
  add column if not exists reviewer_notes text;

-- The oldest deployed Church Library table used a bigint sequence for `id`,
-- but one production revision lost the column default. Structured imports do
-- not provide internal passage IDs, so restore the existing owned sequence as
-- the default without rewriting or renumbering any row.
do $$
declare
  v_sequence text;
begin
  select pg_get_serial_sequence('public.church_library_passages', 'id')
    into v_sequence;
  if v_sequence is not null
     and exists (
       select 1
         from information_schema.columns
        where table_schema = 'public'
          and table_name = 'church_library_passages'
          and column_name = 'id'
          and data_type = 'bigint'
          and column_default is null
          and identity_generation is null
     ) then
    execute format(
      'alter table public.church_library_passages alter column id set default nextval(%L::regclass)',
      v_sequence
    );
  end if;
end
$$;

-- The deployed legacy table required an uploaded file path; structured imports
-- have none, so the requirement is relaxed (no values are changed).
do $$
begin
  if exists (select 1 from information_schema.columns
             where table_schema = 'public' and table_name = 'church_library_books'
               and column_name = 'storage_path' and is_nullable = 'NO') then
    alter table public.church_library_books alter column storage_path drop not null;
  end if;
end $$;

-- 1. Books: identity, multilingual metadata, editions, workflow, downloads -----
alter table public.church_library_books
  add column if not exists slug text,
  add column if not exists title_english text,
  add column if not exists title_geez text,
  add column if not exists collection_key text,
  add column if not exists source_document_name text,
  add column if not exists source_document_sha256 text,
  add column if not exists import_source text,
  add column if not exists publication_status text,
  add column if not exists reviewed_at timestamptz,
  add column if not exists reviewed_by uuid,
  add column if not exists published_at timestamptz,
  add column if not exists published_by uuid,
  add column if not exists review_notes text,
  add column if not exists allow_original_download boolean not null default false,
  add column if not exists download_storage_path text;

do $$
begin
  if not exists (select 1 from pg_constraint where conname = 'church_library_books_publication_status_check') then
    alter table public.church_library_books add constraint church_library_books_publication_status_check
      check (publication_status is null or publication_status in ('draft', 'reviewed', 'published'));
  end if;
  if not exists (select 1 from pg_constraint where conname = 'church_library_books_slug_format_check') then
    alter table public.church_library_books add constraint church_library_books_slug_format_check
      check (slug is null or slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$');
  end if;
end $$;

create unique index if not exists church_library_books_slug_key
  on public.church_library_books (slug) where slug is not null;
create unique index if not exists church_library_books_collection_language_key
  on public.church_library_books (collection_key, language) where collection_key is not null;

-- 2. Sections: hierarchy + stable keys -----------------------------------------
create table if not exists public.church_library_sections (
  id uuid primary key default gen_random_uuid(),
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  version_id uuid,
  section_order integer not null default 0,
  title text,
  chapter_reference text,
  page_start integer,
  page_end integer,
  created_at timestamptz not null default now()
);

-- Structured imports have no uploaded file version; allow sections without one.
do $$
begin
  if exists (select 1 from information_schema.columns
             where table_schema = 'public' and table_name = 'church_library_sections'
               and column_name = 'version_id' and is_nullable = 'NO') then
    alter table public.church_library_sections alter column version_id drop not null;
  end if;
end $$;

alter table public.church_library_sections
  add column if not exists parent_section_id uuid references public.church_library_sections(id) on delete cascade,
  add column if not exists level smallint not null default 1,
  add column if not exists stable_key text,
  add column if not exists language text,
  add column if not exists publication_status text,
  add column if not exists source_heading text,
  add column if not exists updated_at timestamptz not null default now();

do $$
begin
  if not exists (select 1 from pg_constraint where conname = 'church_library_sections_publication_status_check') then
    alter table public.church_library_sections add constraint church_library_sections_publication_status_check
      check (publication_status is null or publication_status in ('draft', 'reviewed', 'published'));
  end if;
  if not exists (select 1 from pg_constraint where conname = 'church_library_sections_level_check') then
    alter table public.church_library_sections add constraint church_library_sections_level_check
      check (level between 1 and 4);
  end if;
end $$;

create unique index if not exists church_library_sections_book_stable_key
  on public.church_library_sections (book_id, stable_key) where stable_key is not null;
create index if not exists church_library_sections_book_order_idx
  on public.church_library_sections (book_id, section_order);

-- 3. Passages: stable keys, block types, duplicates, review notes, search ------
alter table public.church_library_passages
  add column if not exists version_id uuid,
  add column if not exists section_id uuid,
  add column if not exists page_start integer,
  add column if not exists page_end integer,
  add column if not exists chapter_reference text,
  add column if not exists locator_label text,
  add column if not exists search_document tsvector,
  add column if not exists embedding extensions.vector(384),
  add column if not exists embedding_model text,
  add column if not exists stable_key text,
  add column if not exists block_type text not null default 'paragraph',
  add column if not exists content_hash text,
  add column if not exists source_review_notes text[] not null default '{}',
  add column if not exists search_folded text;

do $$
begin
  if not exists (select 1 from pg_constraint where conname = 'church_library_passages_block_type_check') then
    alter table public.church_library_passages add constraint church_library_passages_block_type_check
      check (block_type in ('paragraph', 'list_item', 'quotation', 'heading'));
  end if;
end $$;

create unique index if not exists church_library_passages_book_stable_key
  on public.church_library_passages (book_id, stable_key) where stable_key is not null;
create index if not exists church_library_passages_section_idx
  on public.church_library_passages (section_id, passage_order);
create index if not exists church_library_passages_content_hash_idx
  on public.church_library_passages (content_hash) where content_hash is not null;

-- 4. Amharic-aware folding ------------------------------------------------------
-- Letters written interchangeably in Amharic are folded to one form for search:
-- ሐ/ኀ/ሃ → ሀ family, ሠ → ሰ, ዐ/ኣ → አ, ፀ → ጸ (all vowel orders); Ethiopic
-- punctuation becomes spaces (፥ becomes ':' so "3፥16" matches "3:16"); Latin is
-- lower-cased. Stored text is never changed — only the search column is folded.
create or replace function public.church_library_fold_am(input text)
returns text
language sql
immutable
parallel safe
set search_path = pg_catalog
as $$
  select btrim(regexp_replace(
    translate(
      lower(coalesce(input, '')),
      -- ሐ-ሗ, ኀ-ኇ, ሠ-ሧ, ዐ-ዖ, ፀ-ፆ, ሃ, ኣ, ፥, ፡ ። ፣ ፤ ፦ ፧ ፨
      'ሐሑሒሓሔሕሖሗኀኁኂኃኄኅኆኇሠሡሢሣሤሥሦሧዐዑዒዓዔዕዖፀፁፂፃፄፅፆሃኣ፥፡።፣፤፦፧፨',
      'ሀሁሂሀሄህሆሏሀሁሂሀሄህሆሏሰሱሲሳሴስሶሷአኡኢአኤእኦጸጹጺጻጼጽጾሀአ:       '
    ),
    '\s+', ' ', 'g'));
$$;

create or replace function public.church_library_passage_search_document()
returns trigger
language plpgsql
security invoker
set search_path = pg_catalog, public
as $function$
begin
  new.search_document := to_tsvector(
    'simple',
    coalesce(new.content, '') || ' ' ||
    coalesce(new.chapter_reference, '') || ' ' ||
    coalesce(new.locator_label, '')
  );
  new.search_folded := public.church_library_fold_am(
    coalesce(new.content, '') || ' ' || coalesce(new.chapter_reference, '')
  );
  return new;
end
$function$;

drop trigger if exists church_library_passages_search_document on public.church_library_passages;
create trigger church_library_passages_search_document
before insert or update of content, chapter_reference, locator_label
on public.church_library_passages
for each row execute function public.church_library_passage_search_document();

update public.church_library_passages
   set search_folded = public.church_library_fold_am(coalesce(content, '') || ' ' || coalesce(chapter_reference, ''))
 where search_folded is null;

create index if not exists church_library_passages_search_folded_trgm
  on public.church_library_passages using gin (search_folded extensions.gin_trgm_ops);

-- 5. Visibility helpers ----------------------------------------------------------
-- A book is public when the existing gates pass (legacy search_enabled/ready, or
-- the full modern rights gate) AND it is not held in the review workflow.
create or replace function public.church_library_book_is_public(target_book_id uuid)
returns boolean
language sql
stable
security definer
set search_path = pg_catalog, public
as $$
  select exists (
    select 1 from public.church_library_books b
    where b.id = target_book_id
      and coalesce(b.publication_status, 'published') = 'published'
      and (
        (coalesce(b.search_enabled, false) is true and b.ingestion_status = 'ready')
        or (
          b.public_retrieval_enabled is true
          and b.access_level in ('public_search', 'public')
          and b.approved_for_ingestion is true
          and b.allow_search_quotes is true
          and b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
          and b.processing_status = 'ready'
        )
      )
  );
$$;
revoke all on function public.church_library_book_is_public(uuid) from public;
grant execute on function public.church_library_book_is_public(uuid) to anon, authenticated, service_role;

-- 6. Restrictive publication gates (AND-ed with every existing read policy) -----
alter table public.church_library_books enable row level security;
alter table public.church_library_sections enable row level security;
alter table public.church_library_passages enable row level security;
grant select on public.church_library_books, public.church_library_passages to anon, authenticated;
grant select on public.church_library_sections to anon, authenticated;
grant insert, update, delete on public.church_library_sections to authenticated;
do $$
declare
  v_sequence text;
begin
  select pg_get_serial_sequence('public.church_library_passages', 'id')
    into v_sequence;
  if v_sequence is not null then
    execute format('grant usage, select on sequence %s to authenticated, service_role', v_sequence);
  end if;
end
$$;

-- Staff manage sections (same rule as the existing staff policies on books/passages).
drop policy if exists church_library_sections_staff_write on public.church_library_sections;
create policy church_library_sections_staff_write on public.church_library_sections
  for all to authenticated using (public.is_staff()) with check (public.is_staff());

drop policy if exists church_library_books_publication_gate on public.church_library_books;
create policy church_library_books_publication_gate on public.church_library_books
  as restrictive for select to anon, authenticated
  using (coalesce(publication_status, 'published') = 'published' or public.is_staff());

drop policy if exists church_library_books_public_structured_read on public.church_library_books;
create policy church_library_books_public_structured_read on public.church_library_books
  for select to anon, authenticated
  using (public.church_library_book_is_public(id));

drop policy if exists church_library_sections_publication_gate on public.church_library_sections;
create policy church_library_sections_publication_gate on public.church_library_sections
  as restrictive for select to anon, authenticated
  using (
    public.is_staff()
    or (coalesce(publication_status, 'published') = 'published'
        and public.church_library_book_is_public(book_id))
  );

drop policy if exists church_library_sections_public_structured_read on public.church_library_sections;
create policy church_library_sections_public_structured_read on public.church_library_sections
  for select to anon, authenticated
  using (public.church_library_book_is_public(book_id));

drop policy if exists church_library_passages_publication_gate on public.church_library_passages;
create policy church_library_passages_publication_gate on public.church_library_passages
  as restrictive for select to anon, authenticated
  using (
    public.is_staff()
    or (
      public.church_library_book_is_public(book_id)
      and (
        section_id is null
        or not exists (
          select 1 from public.church_library_sections s
          where s.id = church_library_passages.section_id
            and coalesce(s.publication_status, 'published') <> 'published'
        )
      )
    )
  );

drop policy if exists church_library_passages_public_structured_read on public.church_library_passages;
create policy church_library_passages_public_structured_read on public.church_library_passages
  for select to anon, authenticated
  using (public.church_library_book_is_public(book_id));

-- 7. Bookmarks and reading progress (each person sees only their own rows) ----
create table if not exists public.church_library_bookmarks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  section_key text,
  passage_key text,
  label text,
  note text,
  created_at timestamptz not null default now(),
  unique (user_id, book_id, section_key, passage_key)
);
create table if not exists public.church_library_reading_progress (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  book_id uuid not null references public.church_library_books(id) on delete cascade,
  section_key text,
  passage_key text,
  percent numeric(5, 2) not null default 0 check (percent between 0 and 100),
  updated_at timestamptz not null default now(),
  primary key (user_id, book_id)
);
alter table public.church_library_bookmarks enable row level security;
alter table public.church_library_reading_progress enable row level security;
revoke all on public.church_library_bookmarks, public.church_library_reading_progress from anon;
grant select, insert, update, delete on public.church_library_bookmarks, public.church_library_reading_progress to authenticated;

drop policy if exists church_library_bookmarks_own on public.church_library_bookmarks;
create policy church_library_bookmarks_own on public.church_library_bookmarks
  for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());
drop policy if exists church_library_reading_progress_own on public.church_library_reading_progress;
create policy church_library_reading_progress_own on public.church_library_reading_progress
  for all to authenticated using (user_id = auth.uid()) with check (user_id = auth.uid());

-- 8. Structured import (staff only; always draft; never overwrites) -------------
create or replace function public.church_library_import_structured(payload jsonb)
returns jsonb
language plpgsql
security invoker
set search_path = pg_catalog, public
as $function$
declare
  b jsonb := payload -> 'book';
  v_slug text := lower(btrim(b ->> 'slug'));
  v_lang text := coalesce(nullif(b ->> 'language', ''), 'other');
  v_book uuid;
  v_existing record;
  v_section jsonb;
  v_passage jsonb;
  v_section_id uuid;
  v_parent uuid;
  v_keys jsonb := '{}'::jsonb;
  v_sections integer := 0;
  v_passages integer := 0;
  v_order integer := 0;
begin
  if not public.is_staff() then
    raise exception 'Church Library staff role required' using errcode = '42501';
  end if;
  if v_slug is null or v_slug !~ '^[a-z0-9]+(-[a-z0-9]+)*$' then
    raise exception 'A lowercase slug is required (letters, digits and hyphens)' using errcode = '22023';
  end if;
  if coalesce(btrim(b ->> 'title'), '') = '' then
    raise exception 'A book title is required' using errcode = '22023';
  end if;
  if v_lang not in ('en', 'am', 'gez', 'mixed', 'other') then
    raise exception 'Unsupported language %', v_lang using errcode = '22023';
  end if;
  if jsonb_array_length(coalesce(payload -> 'passages', '[]'::jsonb)) = 0 then
    raise exception 'Nothing to import: no paragraphs' using errcode = '22023';
  end if;

  -- Duplicate detection: the same slug, the same edition of a collection, or the
  -- same source file is never imported twice and never overwritten.
  select id, publication_status, slug into v_existing from public.church_library_books
   where slug = v_slug
      or (nullif(b ->> 'collection_key', '') is not null and collection_key = b ->> 'collection_key' and language = v_lang)
      or (nullif(b ->> 'source_document_sha256', '') is not null and source_document_sha256 = b ->> 'source_document_sha256' and language = v_lang)
   limit 1;
  if found then
    raise exception 'A Church Library book already exists for this import (slug "%", status %). Existing books are never overwritten; use a new slug or remove the draft first.',
      coalesce(v_existing.slug, '?'), coalesce(v_existing.publication_status, 'legacy') using errcode = '23505';
  end if;

  insert into public.church_library_books (
    title, title_amharic, title_english, title_geez, author, language, category, description,
    slug, collection_key, source_document_name, source_document_sha256, import_source,
    publication_status, access_level, rights_status, rights_notes, approved_for_ingestion,
    allow_search_quotes, public_retrieval_enabled, processing_status, document_type, review_notes)
  values (
    btrim(b ->> 'title'), nullif(b ->> 'title_amharic', ''), nullif(b ->> 'title_english', ''), nullif(b ->> 'title_geez', ''),
    nullif(b ->> 'author', ''), v_lang, nullif(b ->> 'category', ''), nullif(b ->> 'description', ''),
    v_slug, nullif(b ->> 'collection_key', ''), nullif(b ->> 'source_document_name', ''), nullif(b ->> 'source_document_sha256', ''),
    'structured_import', 'draft', 'private', coalesce(nullif(b ->> 'rights_status', ''), 'unknown'), nullif(b ->> 'rights_notes', ''),
    false, false, false, 'ready', coalesce(nullif(b ->> 'document_type', ''), 'book'), nullif(b ->> 'review_notes', ''))
  returning id into v_book;

  for v_section in select * from jsonb_array_elements(coalesce(payload -> 'sections', '[]'::jsonb)) loop
    v_parent := null;
    if nullif(v_section ->> 'parent_key', '') is not null then
      v_parent := (v_keys ->> (v_section ->> 'parent_key'))::uuid;
      if v_parent is null then
        raise exception 'Section % refers to unknown parent %', v_section ->> 'key', v_section ->> 'parent_key' using errcode = '22023';
      end if;
    end if;
    insert into public.church_library_sections (
      book_id, version_id, section_order, title, chapter_reference, page_start, page_end,
      parent_section_id, level, stable_key, language, publication_status, source_heading)
    values (
      v_book, null, v_sections, nullif(v_section ->> 'title', ''), nullif(v_section ->> 'chapter_reference', ''),
      nullif(v_section ->> 'page_start', '')::integer, nullif(v_section ->> 'page_end', '')::integer,
      v_parent, coalesce(nullif(v_section ->> 'level', '')::smallint, 1), v_section ->> 'key', v_lang, 'draft',
      nullif(v_section ->> 'source_heading', ''))
    returning id into v_section_id;
    v_keys := v_keys || jsonb_build_object(v_section ->> 'key', v_section_id);
    v_sections := v_sections + 1;
  end loop;

  for v_passage in select * from jsonb_array_elements(payload -> 'passages') loop
    if coalesce(btrim(v_passage ->> 'content'), '') = '' then
      raise exception 'Paragraph % is empty', v_passage ->> 'key' using errcode = '22023';
    end if;
    v_section_id := (v_keys ->> (v_passage ->> 'section_key'))::uuid;
    if nullif(v_passage ->> 'section_key', '') is not null and v_section_id is null then
      raise exception 'Paragraph % refers to unknown section %', v_passage ->> 'key', v_passage ->> 'section_key' using errcode = '22023';
    end if;
    insert into public.church_library_passages (
      book_id, version_id, section_id, passage_order, language, content, page_start, page_end,
      chapter_reference, locator_label, stable_key, block_type, content_hash, source_review_notes, review_status)
    values (
      v_book, null, v_section_id, v_order, v_lang, v_passage ->> 'content',
      nullif(v_passage ->> 'page_start', '')::integer, nullif(v_passage ->> 'page_end', '')::integer,
      nullif(v_passage ->> 'chapter_reference', ''), nullif(v_passage ->> 'locator_label', ''),
      v_passage ->> 'key', coalesce(nullif(v_passage ->> 'block_type', ''), 'paragraph'), nullif(v_passage ->> 'content_hash', ''),
      coalesce(array(select jsonb_array_elements_text(coalesce(v_passage -> 'review_notes', '[]'::jsonb))), '{}'),
      'pending');
    v_order := v_order + 1;
    v_passages := v_passages + 1;
  end loop;

  return jsonb_build_object('book_id', v_book, 'slug', v_slug, 'sections', v_sections, 'passages', v_passages,
                            'publication_status', 'draft');
end
$function$;
revoke all on function public.church_library_import_structured(jsonb) from public, anon;
grant execute on function public.church_library_import_structured(jsonb) to authenticated;

-- 9. Review workflow: draft → reviewed → published (and back to draft) ---------
create or replace function public.church_library_set_publication_status(
  target_book_id uuid,
  next_status text,
  note text default null
)
returns public.church_library_books
language plpgsql
security invoker
set search_path = pg_catalog, public
as $function$
declare
  v public.church_library_books;
  result public.church_library_books;
  flagged integer;
begin
  if not public.is_staff() then
    raise exception 'Church Library staff role required' using errcode = '42501';
  end if;
  select * into v from public.church_library_books where id = target_book_id for update;
  if not found then
    raise exception 'Book not found' using errcode = 'P0002';
  end if;
  if next_status not in ('draft', 'reviewed', 'published') then
    raise exception 'Unknown status %', next_status using errcode = '22023';
  end if;

  if next_status = 'reviewed' then
    if coalesce(v.publication_status, 'draft') <> 'draft' then
      raise exception 'Only a draft can be marked reviewed (current: %)', coalesce(v.publication_status, 'legacy') using errcode = '55000';
    end if;
    select count(*) into flagged from public.church_library_passages
     where book_id = target_book_id and review_status = 'needs_attention';
    if flagged > 0 then
      raise exception '% paragraph(s) are marked "needs attention"; resolve them before review is complete', flagged using errcode = '55000';
    end if;
    update public.church_library_books
       set publication_status = 'reviewed', reviewed_at = now(), reviewed_by = auth.uid(),
           review_notes = coalesce(note, review_notes)
     where id = target_book_id returning * into result;
    update public.church_library_sections set publication_status = 'reviewed', updated_at = now()
     where book_id = target_book_id and publication_status = 'draft';
    update public.church_library_passages set review_status = 'reviewed'
     where book_id = target_book_id and review_status = 'pending';
    return result;
  end if;

  if next_status = 'published' then
    if v.publication_status is distinct from 'reviewed' then
      raise exception 'A book must be reviewed before it is published (current: %)', coalesce(v.publication_status, 'legacy') using errcode = '55000';
    end if;
    -- The existing approval workflow still decides whether content may be shown.
    if not (v.approved_for_ingestion is true
            and v.allow_search_quotes is true
            and v.access_level in ('public_search', 'public')
            and v.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')) then
      raise exception 'Publishing needs the existing approval: approved for ingestion, quotes allowed, public access and a confirmed rights status'
        using errcode = '55000';
    end if;
    update public.church_library_books
       set publication_status = 'published', published_at = now(), published_by = auth.uid(),
           public_retrieval_enabled = true, processing_status = 'ready',
           review_notes = coalesce(note, review_notes)
     where id = target_book_id returning * into result;
    update public.church_library_sections set publication_status = 'published', updated_at = now()
     where book_id = target_book_id and publication_status = 'reviewed';
    return result;
  end if;

  -- back to draft (unpublish)
  update public.church_library_books
     set publication_status = 'draft', public_retrieval_enabled = false,
         review_notes = coalesce(note, review_notes)
   where id = target_book_id returning * into result;
  update public.church_library_sections set publication_status = 'draft', updated_at = now()
   where book_id = target_book_id and publication_status in ('reviewed', 'published');
  return result;
end
$function$;
revoke all on function public.church_library_set_publication_status(uuid, text, text) from public, anon;
grant execute on function public.church_library_set_publication_status(uuid, text, text) to authenticated;

-- 10. Section-aware, Amharic-folded search (source-grounded citations) --------
create or replace function public.search_church_library_sections(
  search_query text,
  result_limit integer default 8,
  search_language text default null
)
returns table (
  passage_id text,
  passage_key text,
  book_id uuid,
  book_slug text,
  book_title text,
  book_language text,
  section_key text,
  section_title text,
  chapter_title text,
  excerpt text,
  page_start integer,
  page_end integer,
  source_document_name text,
  keyword_rank real
)
language plpgsql
stable
security definer
set search_path = pg_catalog, public, extensions
as $function$
declare
  q text := left(btrim(coalesce(search_query, '')), 300);
  q_fold text;
  q_like text;
  q_ts pg_catalog.tsquery;
  n integer := greatest(1, least(coalesce(result_limit, 8), 30));
begin
  if q = '' then
    return;
  end if;
  q_fold := public.church_library_fold_am(q);
  if length(q_fold) < 2 then
    return;
  end if;
  q_like := '%' || replace(replace(replace(q_fold, '\', '\\'), '%', '\%'), '_', '\_') || '%';
  q_ts := websearch_to_tsquery('simple', q);

  return query
  with hits as (
    select p.id, p.stable_key, p.book_id, p.section_id, p.passage_order, p.content, p.page_start, p.page_end,
           p.language, p.search_folded, p.search_document
      from public.church_library_passages p
     where (p.search_folded like q_like or p.search_document @@ q_ts)
       and public.church_library_book_is_public(p.book_id)
  )
  select
    h.id::text,
    h.stable_key,
    b.id,
    b.slug,
    b.title,
    b.language,
    s.stable_key,
    s.title,
    ch.title,
    left(h.content, 600),
    h.page_start,
    h.page_end,
    b.source_document_name,
    (case when h.search_folded like q_like then 1.0 else 0.0 end
     + case when public.church_library_fold_am(coalesce(s.title, '')) like q_like then 0.5 else 0.0 end
     + ts_rank_cd(h.search_document, q_ts)
     + case when search_language is not null and b.language = search_language then 0.1 else 0.0 end)::real
  from hits h
  join public.church_library_books b on b.id = h.book_id
  left join public.church_library_sections s on s.id = h.section_id
  left join public.church_library_sections ch on ch.id = s.parent_section_id
  where (s.id is null or coalesce(s.publication_status, 'published') = 'published')
  order by 14 desc, b.title, h.passage_order
  limit n;
end
$function$;
alter function public.search_church_library_sections(text, integer, text) owner to postgres;
revoke all on function public.search_church_library_sections(text, integer, text) from public;
grant execute on function public.search_church_library_sections(text, integer, text) to anon, authenticated, service_role;


-- 10b. The existing search functions run as definer (they bypass row security),
-- so they also skip books held in the review workflow. Same signatures and
-- bodies as 20261028160000; only the publication condition is added.
create or replace function public.search_church_library(
  search_query text,
  result_limit integer default 8,
  search_language text default null,
  query_embedding extensions.vector(384) default null
)
returns table (
  passage_id text,
  book_id uuid,
  title text,
  author text,
  language text,
  excerpt text,
  page_start integer,
  page_end integer,
  chapter_reference text,
  locator_label text,
  source_url text,
  keyword_rank real,
  semantic_rank real
)
language plpgsql
stable
security definer
set search_path = pg_catalog, public, extensions
as $function$
declare
  q text := left(btrim(coalesce(search_query, '')), 500);
  q_folded text;
  q_ts pg_catalog.tsquery;
  n integer := greatest(1, least(coalesce(result_limit, 8), 30));
begin
  if q = '' then
    return;
  end if;

  q_folded := lower(q);
  q_ts := websearch_to_tsquery('simple', q);

  return query
  with eligible as materialized (
    select
      p.id,
      p.book_id,
      p.passage_order,
      p.language,
      p.content,
      p.page_start,
      p.page_end,
      p.chapter_reference,
      p.locator_label,
      p.search_document,
      p.embedding,
      b.title,
      b.author,
      b.source_url as book_source_url,
      b.allow_source_link
    from public.church_library_passages p
    join public.church_library_books b on b.id = p.book_id
    where (p.version_id is null or p.version_id = b.current_version_id)
      and coalesce(b.publication_status, 'published') = 'published'
      and (
        (
          coalesce(b.search_enabled, false) is true
          and b.ingestion_status = 'ready'
        )
        or (
          b.public_retrieval_enabled is true
          and b.access_level in ('public_search', 'public')
          and b.approved_for_ingestion is true
          and b.allow_search_quotes is true
          and b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
          and b.processing_status = 'ready'
        )
      )
  ),
  ranked as (
    select
      e.*,
      (
        case
          when lower(e.content) = q_folded then 2.0
          when strpos(lower(e.content), q_folded) > 0 then 1.0
          else 0.0
        end
        + case when lower(e.title) = q_folded then 1.5 else 0.0 end
        + case when strpos(lower(e.title), q_folded) > 0 then 0.75 else 0.0 end
        + case when e.search_document @@ q_ts
            then ts_rank_cd(e.search_document, q_ts)::double precision
            else 0.0 end
        + case when search_language is not null
                 and e.language in (search_language, 'mixed') then 0.05
            else 0.0 end
      )::real as kr,
      case
        when query_embedding is null or e.embedding is null then 0::real
        else greatest(0::real, (1 - (e.embedding <=> query_embedding))::real)
      end as sr
    from eligible e
    where strpos(lower(e.content), q_folded) > 0
       or strpos(lower(e.title), q_folded) > 0
       or e.search_document @@ q_ts
       or (
         query_embedding is not null
         and e.embedding is not null
         and (1 - (e.embedding <=> query_embedding)) >= 0.35
       )
  )
  select
    r.id::text,
    r.book_id,
    r.title,
    r.author,
    r.language,
    left(r.content, 1200),
    r.page_start,
    r.page_end,
    r.chapter_reference,
    coalesce(r.locator_label, 'Passage ' || (r.passage_order + 1)::text),
    case when r.allow_source_link and r.book_source_url ~* '^https?://'
      then r.book_source_url else null end,
    r.kr,
    r.sr
  from ranked r
  order by
    (r.kr + r.sr) desc,
    case when search_language is not null
           and r.language in (search_language, 'mixed') then 0 else 1 end,
    r.title,
    r.passage_order
  limit n;
end
$function$;

create or replace function public.church_library_public_search_status()
returns table (
  eligible_books bigint,
  indexed_passages bigint,
  embedded_passages bigint
)
language sql
stable
security definer
set search_path = pg_catalog, public, extensions
as $function$
  select
    count(distinct b.id)::bigint,
    count(p.id)::bigint,
    count(p.embedding)::bigint
  from public.church_library_books b
  left join public.church_library_passages p
    on p.book_id = b.id
   and (p.version_id is null or p.version_id = b.current_version_id)
  where coalesce(b.publication_status, 'published') = 'published'
    and (
      (
        coalesce(b.search_enabled, false) is true
        and b.ingestion_status = 'ready'
      )
      or (
        b.public_retrieval_enabled is true
        and b.access_level in ('public_search', 'public')
        and b.approved_for_ingestion is true
        and b.allow_search_quotes is true
        and b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
        and b.processing_status = 'ready'
      )
    );
$function$;

-- 11. Original downloads, only where the book allows it -------------------------
do $$
begin
  if to_regclass('storage.objects') is not null then
    execute 'drop policy if exists church_library_public_original_download on storage.objects';
    execute $p$
      create policy church_library_public_original_download on storage.objects
        for select to anon, authenticated
        using (
          bucket_id = 'church-library-originals'
          and exists (
            select 1 from public.church_library_books b
            where b.download_storage_path = storage.objects.name
              and b.allow_original_download is true
              and public.church_library_book_is_public(b.id)
          )
        )
    $p$;
  end if;
end $$;

notify pgrst, 'reload schema';

commit;
