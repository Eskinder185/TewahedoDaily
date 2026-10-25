-- Bible Manager: draft editing, controlled publication, revision history, imports,
-- and reusable links to other CMS content. This extends the canonical Bible
-- tables introduced in 20261004140000; it does not import or publish content.
begin;

alter table public.bible_editions
  add column if not exists source_edition text,
  add column if not exists attribution text,
  add column if not exists rights_status text not null default 'unknown',
  add column if not exists canon_code text not null default 'eotc-81',
  add column if not exists numbering_scheme text not null default 'source',
  add column if not exists publication_status text not null default 'draft';

alter table public.bible_editions drop constraint if exists bible_editions_rights_status_check;
alter table public.bible_editions add constraint bible_editions_rights_status_check
  check (rights_status in ('unknown', 'owned', 'licensed', 'public_domain', 'permission_granted', 'restricted'));
alter table public.bible_editions drop constraint if exists bible_editions_publication_status_check;
alter table public.bible_editions add constraint bible_editions_publication_status_check
  check (publication_status in ('draft', 'published'));

alter table public.bible_source_books
  add column if not exists publication_status text not null default 'draft';
alter table public.bible_source_books drop constraint if exists bible_source_books_publication_status_check;
alter table public.bible_source_books add constraint bible_source_books_publication_status_check
  check (publication_status in ('draft', 'published'));

-- Preserve every edition/source that was already public before this migration.
update public.bible_editions set publication_status = 'published' where is_public;
update public.bible_source_books set publication_status = 'published' where is_public;

create table if not exists public.bible_chapter_drafts (
  id uuid primary key default gen_random_uuid(),
  chapter_id uuid not null unique references public.bible_chapters(id) on delete cascade,
  verses jsonb not null default '[]'::jsonb check (jsonb_typeof(verses) = 'array'),
  updated_by uuid not null references auth.users(id) on delete restrict,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.bible_chapter_revisions (
  id uuid primary key default gen_random_uuid(),
  chapter_id uuid not null references public.bible_chapters(id) on delete cascade,
  revision_number integer not null check (revision_number > 0),
  verses jsonb not null check (jsonb_typeof(verses) = 'array'),
  action text not null check (action in ('published', 'restored')),
  note text,
  created_by uuid not null references auth.users(id) on delete restrict,
  created_at timestamptz not null default now(),
  unique (chapter_id, revision_number)
);

create table if not exists public.bible_import_jobs (
  id uuid primary key default gen_random_uuid(),
  file_name text not null,
  format text not null check (format in ('csv', 'json', 'usfm')),
  mode text not null check (mode in ('create_only', 'update_existing')),
  status text not null default 'processing' check (status in ('processing', 'completed', 'completed_with_errors', 'failed')),
  total_chapters integer not null default 0 check (total_chapters >= 0),
  processed_chapters integer not null default 0 check (processed_chapters >= 0),
  created_chapters integer not null default 0 check (created_chapters >= 0),
  updated_chapters integer not null default 0 check (updated_chapters >= 0),
  skipped_chapters integer not null default 0 check (skipped_chapters >= 0),
  errors jsonb not null default '[]'::jsonb check (jsonb_typeof(errors) = 'array'),
  created_by uuid not null references auth.users(id) on delete restrict,
  created_at timestamptz not null default now(),
  completed_at timestamptz
);

create table if not exists public.bible_content_links (
  id uuid primary key default gen_random_uuid(),
  canonical_book_id uuid not null references public.bible_canonical_books(id) on delete cascade,
  chapter_number integer check (chapter_number is null or chapter_number >= 0),
  verse_start integer check (verse_start is null or verse_start >= 0),
  verse_end integer check (verse_end is null or verse_end >= 0),
  content_type text not null check (content_type in ('calendar_card', 'feast', 'fast', 'mezmur', 'prayer', 'library_book')),
  content_id text not null check (length(trim(content_id)) > 0),
  label text,
  is_public boolean not null default true,
  created_by uuid not null references auth.users(id) on delete restrict,
  created_at timestamptz not null default now(),
  unique (canonical_book_id, chapter_number, verse_start, verse_end, content_type, content_id)
);

create index if not exists bible_chapter_revisions_chapter_created_idx
  on public.bible_chapter_revisions(chapter_id, created_at desc);
create index if not exists bible_import_jobs_created_idx
  on public.bible_import_jobs(created_at desc);
create index if not exists bible_content_links_content_idx
  on public.bible_content_links(content_type, content_id);

drop trigger if exists bible_chapter_drafts_set_updated_at on public.bible_chapter_drafts;
create trigger bible_chapter_drafts_set_updated_at before update on public.bible_chapter_drafts
  for each row execute function public.set_updated_at();

alter table public.bible_chapter_drafts enable row level security;
alter table public.bible_chapter_revisions enable row level security;
alter table public.bible_import_jobs enable row level security;
alter table public.bible_content_links enable row level security;

-- Public rows remain read-only. Authenticated staff get visibility into drafts,
-- but all mutation of Bible text occurs through the guarded RPCs below.
drop policy if exists bible_editions_staff_read on public.bible_editions;
create policy bible_editions_staff_read on public.bible_editions for select to authenticated
  using (coalesce(public.is_staff(), false));
drop policy if exists bible_source_books_staff_read on public.bible_source_books;
create policy bible_source_books_staff_read on public.bible_source_books for select to authenticated
  using (coalesce(public.is_staff(), false));
drop policy if exists bible_chapters_staff_read on public.bible_chapters;
create policy bible_chapters_staff_read on public.bible_chapters for select to authenticated
  using (coalesce(public.is_staff(), false));
drop policy if exists bible_sections_staff_read on public.bible_sections;
create policy bible_sections_staff_read on public.bible_sections for select to authenticated
  using (coalesce(public.is_staff(), false));
drop policy if exists bible_verses_staff_read on public.bible_verses;
create policy bible_verses_staff_read on public.bible_verses for select to authenticated
  using (coalesce(public.is_staff(), false));

drop policy if exists bible_chapter_drafts_staff_read on public.bible_chapter_drafts;
create policy bible_chapter_drafts_staff_read on public.bible_chapter_drafts for select to authenticated
  using (coalesce(public.is_staff(), false));
drop policy if exists bible_chapter_revisions_staff_read on public.bible_chapter_revisions;
create policy bible_chapter_revisions_staff_read on public.bible_chapter_revisions for select to authenticated
  using (coalesce(public.is_staff(), false));
drop policy if exists bible_import_jobs_staff_read on public.bible_import_jobs;
create policy bible_import_jobs_staff_read on public.bible_import_jobs for select to authenticated
  using (coalesce(public.is_staff(), false));
drop policy if exists bible_content_links_staff_all on public.bible_content_links;
create policy bible_content_links_staff_all on public.bible_content_links for all to authenticated
  using (coalesce(public.is_staff(), false)) with check (coalesce(public.is_staff(), false));
drop policy if exists bible_content_links_public_read on public.bible_content_links;
create policy bible_content_links_public_read on public.bible_content_links for select to anon, authenticated
  using (is_public);

revoke all on public.bible_chapter_drafts, public.bible_chapter_revisions,
  public.bible_import_jobs, public.bible_content_links from public, anon, authenticated;
grant select on public.bible_chapter_drafts, public.bible_chapter_revisions,
  public.bible_import_jobs to authenticated;
grant select, insert, update, delete on public.bible_content_links to authenticated;
grant select on public.bible_content_links to anon;
grant all on public.bible_chapter_drafts, public.bible_chapter_revisions,
  public.bible_import_jobs, public.bible_content_links to service_role;

-- Replace the original public policies with explicit two-state publication
-- checks. Existing public rows were backfilled above, so no reader route changes.
drop policy if exists bible_editions_public_read on public.bible_editions;
create policy bible_editions_public_read on public.bible_editions for select to anon, authenticated
  using (is_public and publication_status = 'published');
drop policy if exists bible_source_books_public_read on public.bible_source_books;
create policy bible_source_books_public_read on public.bible_source_books for select to anon, authenticated
  using (
    is_public and publication_status = 'published' and exists (
      select 1 from public.bible_editions e
      where e.id = edition_id and e.is_public and e.publication_status = 'published'
    )
  );

create or replace function public.bible_validate_verses(p_chapter_id uuid, p_verses jsonb)
returns void language plpgsql security definer set search_path = public, pg_temp as $$
declare v_item jsonb; v_number integer; v_order integer; v_section uuid;
begin
  if p_chapter_id is null or not exists (select 1 from public.bible_chapters where id = p_chapter_id) then
    raise exception 'Bible chapter was not found' using errcode = 'P0002';
  end if;
  if p_verses is null or jsonb_typeof(p_verses) <> 'array' or jsonb_array_length(p_verses) = 0 then
    raise exception 'At least one verse is required' using errcode = '23514';
  end if;
  if jsonb_array_length(p_verses) > 500 then
    raise exception 'A chapter cannot contain more than 500 verse rows' using errcode = '22023';
  end if;
  for v_item in select value from jsonb_array_elements(p_verses) loop
    begin
      v_number := (v_item->>'verse_number')::integer;
      v_order := (v_item->>'source_order')::integer;
      v_section := nullif(v_item->>'section_id', '')::uuid;
    exception when others then
      raise exception 'Every verse needs numeric verse_number and source_order values' using errcode = '22023';
    end;
    if v_number < 0 or v_order < 1 or length(trim(coalesce(v_item->>'text', ''))) = 0 then
      raise exception 'Every verse needs a non-negative number, positive order, and text' using errcode = '23514';
    end if;
    if v_section is not null and not exists (
      select 1 from public.bible_sections where id = v_section and chapter_id = p_chapter_id
    ) then
      raise exception 'A verse section does not belong to the selected chapter' using errcode = '23503';
    end if;
  end loop;
  if exists (
    select 1 from (
      select nullif(value->>'section_id', '') section_id, (value->>'source_order')::integer source_order, count(*)
      from jsonb_array_elements(p_verses) group by 1, 2 having count(*) > 1
    ) duplicate_orders
  ) then raise exception 'Verse source_order values must be unique within a section' using errcode = '23505'; end if;
end $$;
revoke all on function public.bible_validate_verses(uuid, jsonb) from public, anon, authenticated;

create or replace function public.save_bible_chapter_draft(
  p_chapter_id uuid, p_verses jsonb, p_expected_updated_at timestamptz default null
) returns public.bible_chapter_drafts
language plpgsql security definer set search_path = public, pg_temp as $$
declare v_actor uuid := auth.uid(); v_existing public.bible_chapter_drafts; v_result public.bible_chapter_drafts;
begin
  if v_actor is null or not coalesce(public.is_staff(), false) then
    raise exception 'Bible editing requires an authenticated editor, admin, or super admin' using errcode = '42501';
  end if;
  perform public.bible_validate_verses(p_chapter_id, p_verses);
  select * into v_existing from public.bible_chapter_drafts where chapter_id = p_chapter_id;
  if v_existing.id is not null and p_expected_updated_at is not null and v_existing.updated_at <> p_expected_updated_at then
    raise exception 'This chapter draft changed after it was opened. Reload before saving.' using errcode = '40001';
  end if;
  insert into public.bible_chapter_drafts(chapter_id, verses, updated_by)
  values (p_chapter_id, p_verses, v_actor)
  on conflict (chapter_id) do update set verses = excluded.verses, updated_by = excluded.updated_by
  returning * into v_result;
  return v_result;
end $$;

create or replace function public.publish_bible_chapter_draft(p_chapter_id uuid, p_note text default null)
returns public.bible_chapter_revisions
language plpgsql security definer set search_path = public, pg_temp as $$
declare
  v_actor uuid := auth.uid(); v_role text; v_draft public.bible_chapter_drafts;
  v_source public.bible_source_books; v_edition public.bible_editions;
  v_revision integer; v_result public.bible_chapter_revisions; v_item jsonb;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('editor', 'admin', 'super_admin') then
    raise exception 'Publishing requires an authenticated editor, admin, or super admin' using errcode = '42501';
  end if;
  select * into v_draft from public.bible_chapter_drafts where chapter_id = p_chapter_id for update;
  if v_draft.id is null then raise exception 'Save a chapter draft before publishing' using errcode = 'P0002'; end if;
  perform public.bible_validate_verses(p_chapter_id, v_draft.verses);
  select s.* into v_source from public.bible_source_books s join public.bible_chapters c on c.source_book_id = s.id where c.id = p_chapter_id;
  select * into v_edition from public.bible_editions where id = v_source.edition_id;
  if v_edition.rights_status not in ('owned', 'licensed', 'public_domain', 'permission_granted') then
    raise exception 'Confirm a truthful publication-rights basis on the edition before publishing' using errcode = '23514';
  end if;
  if length(trim(coalesce(v_edition.name, ''))) = 0 or length(trim(coalesce(v_edition.language_code, ''))) = 0
     or length(trim(coalesce(v_edition.attribution, ''))) = 0 then
    raise exception 'Edition name, language, and attribution are required before publishing' using errcode = '23514';
  end if;
  select coalesce(max(revision_number), 0) + 1 into v_revision from public.bible_chapter_revisions where chapter_id = p_chapter_id;
  insert into public.bible_chapter_revisions(chapter_id, revision_number, verses, action, note, created_by)
  values (p_chapter_id, v_revision, v_draft.verses, 'published', nullif(trim(p_note), ''), v_actor)
  returning * into v_result;
  delete from public.bible_verses where chapter_id = p_chapter_id;
  for v_item in select value from jsonb_array_elements(v_draft.verses) loop
    insert into public.bible_verses(chapter_id, section_id, source_order, verse_number, text)
    values (p_chapter_id, nullif(v_item->>'section_id', '')::uuid,
      (v_item->>'source_order')::integer, (v_item->>'verse_number')::integer, trim(v_item->>'text'));
  end loop;
  -- review_status is retained only as a legacy compatibility field for the
  -- original table constraint; no separate review action is required.
  update public.bible_source_books set publication_status = 'published', is_public = true, review_status = 'reviewed' where id = v_source.id;
  update public.bible_editions set publication_status = 'published', is_public = true, review_status = 'reviewed' where id = v_edition.id;
  delete from public.bible_chapter_drafts where id = v_draft.id;
  return v_result;
end $$;

create or replace function public.restore_bible_chapter_revision(p_revision_id uuid)
returns public.bible_chapter_drafts
language plpgsql security definer set search_path = public, pg_temp as $$
declare v_actor uuid := auth.uid(); v_role text; v_revision public.bible_chapter_revisions; v_result public.bible_chapter_drafts;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('admin', 'super_admin') then
    raise exception 'Restoring Bible revisions requires an admin or super admin' using errcode = '42501';
  end if;
  select * into v_revision from public.bible_chapter_revisions where id = p_revision_id;
  if v_revision.id is null then raise exception 'Bible revision was not found' using errcode = 'P0002'; end if;
  insert into public.bible_chapter_drafts(chapter_id, verses, updated_by)
  values (v_revision.chapter_id, v_revision.verses, v_actor)
  on conflict (chapter_id) do update set verses = excluded.verses, updated_by = excluded.updated_by
  returning * into v_result;
  return v_result;
end $$;

create or replace function public.update_bible_edition_metadata(
  p_edition_id uuid, p_name text, p_language_code text, p_source_edition text,
  p_attribution text, p_rights_status text, p_canon_code text, p_numbering_scheme text
) returns public.bible_editions
language plpgsql security definer set search_path = public, pg_temp as $$
declare v_actor uuid := auth.uid(); v_result public.bible_editions;
begin
  if v_actor is null or not coalesce(public.is_staff(), false) then
    raise exception 'Bible metadata editing requires staff access' using errcode = '42501';
  end if;
  if p_rights_status not in ('unknown', 'owned', 'licensed', 'public_domain', 'permission_granted', 'restricted') then
    raise exception 'Choose a valid rights status' using errcode = '22023';
  end if;
  update public.bible_editions set name = trim(p_name), language_code = trim(p_language_code),
    source_edition = nullif(trim(p_source_edition), ''), attribution = nullif(trim(p_attribution), ''),
    rights_status = p_rights_status, canon_code = trim(p_canon_code), numbering_scheme = trim(p_numbering_scheme)
  where id = p_edition_id returning * into v_result;
  if v_result.id is null then raise exception 'Bible edition was not found' using errcode = 'P0002'; end if;
  return v_result;
end $$;

create or replace function public.create_bible_edition(
  p_code text, p_name text, p_language_code text, p_source_edition text,
  p_attribution text, p_rights_status text, p_canon_code text, p_numbering_scheme text
) returns public.bible_editions
language plpgsql security definer set search_path = public, pg_temp as $$
declare v_actor uuid := auth.uid(); v_result public.bible_editions;
begin
  if v_actor is null or not coalesce(public.is_staff(), false) then
    raise exception 'Creating a Bible translation requires staff access' using errcode = '42501';
  end if;
  if lower(trim(p_code)) !~ '^[a-z0-9-]+$' then raise exception 'Translation code must use lowercase letters, numbers, and hyphens' using errcode = '22023'; end if;
  if length(trim(p_name)) = 0 or length(trim(p_language_code)) = 0 then raise exception 'Translation name and language are required' using errcode = '23514'; end if;
  if p_rights_status not in ('unknown', 'owned', 'licensed', 'public_domain', 'permission_granted', 'restricted') then raise exception 'Choose a valid rights status' using errcode = '22023'; end if;
  insert into public.bible_editions(code, name, language_code, source_edition, attribution,
    rights_status, canon_code, numbering_scheme, publication_status, is_public, review_status)
  values (lower(trim(p_code)), trim(p_name), trim(p_language_code), nullif(trim(p_source_edition), ''),
    nullif(trim(p_attribution), ''), p_rights_status, trim(p_canon_code), trim(p_numbering_scheme),
    'draft', false, 'draft') returning * into v_result;
  return v_result;
end $$;

create or replace function public.start_bible_import(p_file_name text, p_format text, p_mode text, p_total_chapters integer)
returns uuid language plpgsql security definer set search_path = public, pg_temp as $$
declare v_id uuid;
begin
  if auth.uid() is null or not coalesce(public.is_staff(), false) then raise exception 'Bible import requires staff access' using errcode = '42501'; end if;
  insert into public.bible_import_jobs(file_name, format, mode, total_chapters, created_by)
  values (trim(p_file_name), p_format, p_mode, greatest(p_total_chapters, 0), auth.uid()) returning id into v_id;
  return v_id;
end $$;

create or replace function public.finish_bible_import(
  p_job_id uuid, p_processed integer, p_created integer, p_updated integer, p_skipped integer, p_errors jsonb
) returns public.bible_import_jobs language plpgsql security definer set search_path = public, pg_temp as $$
declare v_result public.bible_import_jobs;
begin
  if auth.uid() is null or not coalesce(public.is_staff(), false) then raise exception 'Bible import requires staff access' using errcode = '42501'; end if;
  update public.bible_import_jobs set processed_chapters = greatest(p_processed, 0),
    created_chapters = greatest(p_created, 0), updated_chapters = greatest(p_updated, 0),
    skipped_chapters = greatest(p_skipped, 0), errors = coalesce(p_errors, '[]'::jsonb),
    status = case when jsonb_array_length(coalesce(p_errors, '[]'::jsonb)) > 0 then 'completed_with_errors' else 'completed' end,
    completed_at = now() where id = p_job_id and created_by = auth.uid() returning * into v_result;
  if v_result.id is null then raise exception 'Bible import job was not found' using errcode = 'P0002'; end if;
  return v_result;
end $$;

create or replace function public.stage_bible_import_chapter(
  p_job_id uuid, p_edition_code text, p_book_slug text, p_chapter_number integer,
  p_verses jsonb, p_source_name text default null
) returns jsonb language plpgsql security definer set search_path = public, pg_temp as $$
declare
  v_actor uuid := auth.uid(); v_job public.bible_import_jobs; v_edition public.bible_editions;
  v_book public.bible_canonical_books; v_source public.bible_source_books; v_chapter public.bible_chapters;
  v_existed boolean := false; v_result public.bible_chapter_drafts;
begin
  if v_actor is null or not coalesce(public.is_staff(), false) then raise exception 'Bible import requires staff access' using errcode = '42501'; end if;
  select * into v_job from public.bible_import_jobs where id = p_job_id and created_by = v_actor and status = 'processing';
  if v_job.id is null then raise exception 'Active Bible import job was not found' using errcode = 'P0002'; end if;
  select * into v_edition from public.bible_editions where code = lower(trim(p_edition_code));
  if v_edition.id is null then raise exception 'Bible edition code % was not found', p_edition_code using errcode = 'P0002'; end if;
  select * into v_book from public.bible_canonical_books where slug = lower(trim(p_book_slug));
  if v_book.id is null then raise exception 'Canonical Bible book % was not found', p_book_slug using errcode = 'P0002'; end if;
  select * into v_source from public.bible_source_books
    where edition_id = v_edition.id and canonical_book_id = v_book.id order by source_order limit 1;
  if v_source.id is null then
    insert into public.bible_source_books(
      edition_id, canonical_book_id, source_book_number, source_file,
      source_name_en, source_name_am, source_order, source_metadata
    ) values (
      v_edition.id, v_book.id, v_book.sort_order, v_job.file_name,
      case when v_edition.language_code = 'en' then coalesce(nullif(trim(p_source_name), ''), v_book.name_en) else v_book.name_en end,
      case when v_edition.language_code in ('am', 'gez') then coalesce(nullif(trim(p_source_name), ''), v_book.name_am) else v_book.name_am end,
      v_book.sort_order, jsonb_build_object('import_job_id', v_job.id)
    ) returning * into v_source;
  end if;
  select * into v_chapter from public.bible_chapters where source_book_id = v_source.id and chapter_number = p_chapter_number;
  v_existed := v_chapter.id is not null;
  if v_existed and v_job.mode = 'create_only' and (
    exists (select 1 from public.bible_verses where chapter_id = v_chapter.id)
    or exists (select 1 from public.bible_chapter_drafts where chapter_id = v_chapter.id)
  ) then
    return jsonb_build_object('status', 'skipped', 'chapter_id', v_chapter.id, 'reason', 'Chapter already exists');
  end if;
  if v_chapter.id is null then
    insert into public.bible_chapters(source_book_id, chapter_number, source_order)
    values (v_source.id, p_chapter_number, greatest(p_chapter_number, 1)) returning * into v_chapter;
  end if;
  perform public.bible_validate_verses(v_chapter.id, p_verses);
  insert into public.bible_chapter_drafts(chapter_id, verses, updated_by)
  values (v_chapter.id, p_verses, v_actor)
  on conflict (chapter_id) do update set verses = excluded.verses, updated_by = excluded.updated_by
  returning * into v_result;
  return jsonb_build_object('status', case when v_existed then 'updated' else 'created' end, 'chapter_id', v_chapter.id, 'draft_id', v_result.id);
end $$;

revoke all on function public.save_bible_chapter_draft(uuid, jsonb, timestamptz),
  public.publish_bible_chapter_draft(uuid, text), public.restore_bible_chapter_revision(uuid),
  public.update_bible_edition_metadata(uuid, text, text, text, text, text, text, text),
  public.create_bible_edition(text, text, text, text, text, text, text, text),
  public.start_bible_import(text, text, text, integer),
  public.finish_bible_import(uuid, integer, integer, integer, integer, jsonb),
  public.stage_bible_import_chapter(uuid, text, text, integer, jsonb, text)
  from public, anon;
grant execute on function public.save_bible_chapter_draft(uuid, jsonb, timestamptz),
  public.publish_bible_chapter_draft(uuid, text), public.restore_bible_chapter_revision(uuid),
  public.update_bible_edition_metadata(uuid, text, text, text, text, text, text, text),
  public.create_bible_edition(text, text, text, text, text, text, text, text),
  public.start_bible_import(text, text, text, integer),
  public.finish_bible_import(uuid, integer, integer, integer, integer, jsonb),
  public.stage_bible_import_chapter(uuid, text, text, integer, jsonb, text)
  to authenticated, service_role;

notify pgrst, 'reload schema';
commit;
