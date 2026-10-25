-- Forward-only Church Library passage editing and revision history schema.
-- Adds original_content preservation, review workflows, optimistic concurrency locking,
-- and audit trail table for passage corrections.
begin;

-- 1. Extend church_library_passages with revision and review tracking columns
alter table public.church_library_passages
  add column if not exists original_content text,
  add column if not exists review_status text not null default 'pending',
  add column if not exists reviewer_notes text,
  add column if not exists reviewed_by uuid references auth.users(id) on delete set null,
  add column if not exists reviewed_at timestamptz,
  add column if not exists revision_count integer not null default 0,
  add column if not exists updated_by uuid references auth.users(id) on delete set null,
  add column if not exists updated_at timestamptz not null default now();

do $$
begin
  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.church_library_passages'::regclass
      and conname = 'church_library_passages_review_status_check'
  ) then
    alter table public.church_library_passages add constraint church_library_passages_review_status_check
      check (review_status in ('pending', 'reviewed', 'needs_attention'));
  end if;
  if not exists (
    select 1 from pg_constraint
    where conrelid = 'public.church_library_passages'::regclass
      and conname = 'church_library_passages_revision_count_check'
  ) then
    alter table public.church_library_passages add constraint church_library_passages_revision_count_check
      check (revision_count >= 0);
  end if;
end $$;

-- 2. Backfill original_content from existing content where null
update public.church_library_passages
set original_content = content
where original_content is null;

-- 3. Create passage revisions audit history table
create table if not exists public.church_library_passage_revisions (
  id uuid primary key default gen_random_uuid(),
  passage_id uuid not null references public.church_library_passages(id) on delete cascade,
  revision_number integer not null check (revision_number > 0),
  previous_content text not null,
  new_content text not null,
  change_summary text,
  review_status text not null default 'pending'
    check (review_status in ('pending', 'reviewed', 'needs_attention')),
  reviewer_notes text,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  unique (passage_id, revision_number)
);

create index if not exists church_library_passage_revisions_passage_idx
  on public.church_library_passage_revisions (passage_id, revision_number desc);

-- 4. RPC: Atomically update an extracted passage with concurrency protection
create or replace function public.update_church_library_passage(
  p_passage_id uuid,
  p_content text,
  p_review_status text default 'reviewed',
  p_change_summary text default null,
  p_reviewer_notes text default null,
  p_expected_revision integer default null
)
returns public.church_library_passages
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_actor uuid := auth.uid();
  v_current public.church_library_passages%rowtype;
  v_new_content text := trim(coalesce(p_content, ''));
  v_status text := coalesce(nullif(trim(p_review_status), ''), 'reviewed');
  v_next_rev integer;
  v_result public.church_library_passages;
begin
  if not coalesce(public.is_staff(), false) then
    raise exception 'Staff role required to edit Church Library passages' using errcode = '42501';
  end if;

  if v_new_content = '' then
    raise exception 'Passage content cannot be empty' using errcode = '22023';
  end if;

  if v_status not in ('pending', 'reviewed', 'needs_attention') then
    raise exception 'Invalid review status: %', v_status using errcode = '22023';
  end if;

  -- Lock target row
  select * into v_current
  from public.church_library_passages
  where id = p_passage_id
  for update;

  if v_current.id is null then
    raise exception 'Passage not found: %', p_passage_id using errcode = 'P0002';
  end if;

  -- Optimistic lock check
  if p_expected_revision is not null and v_current.revision_count <> p_expected_revision then
    raise exception 'Conflict: This passage was modified by another editor (revision % expected, found %). Please reload.',
      p_expected_revision, v_current.revision_count using errcode = '40001';
  end if;

  v_next_rev := v_current.revision_count + 1;

  -- Preserve initial original content if not already stored
  if v_current.original_content is null then
    v_current.original_content := v_current.content;
  end if;

  -- Record revision audit row
  insert into public.church_library_passage_revisions (
    passage_id,
    revision_number,
    previous_content,
    new_content,
    change_summary,
    review_status,
    reviewer_notes,
    created_by
  ) values (
    v_current.id,
    v_next_rev,
    v_current.content,
    v_new_content,
    nullif(trim(p_change_summary), ''),
    v_status,
    nullif(trim(p_reviewer_notes), ''),
    v_actor
  );

  -- Update passage
  update public.church_library_passages
  set content = v_new_content,
      original_content = coalesce(v_current.original_content, v_current.content),
      review_status = v_status,
      reviewer_notes = nullif(trim(p_reviewer_notes), ''),
      reviewed_by = v_actor,
      reviewed_at = now(),
      revision_count = v_next_rev,
      updated_by = v_actor,
      updated_at = now(),
      search_document = to_tsvector('simple', v_new_content || ' ' || coalesce(v_current.chapter_reference, ''))
  where id = v_current.id
  returning * into v_result;

  -- Touch parent book updated_at
  update public.church_library_books
  set updated_at = now(),
      updated_by = v_actor
  where id = v_current.book_id;

  return v_result;
end;
$$;

-- 5. RPC: Safe rollback to previous revision
create or replace function public.rollback_church_library_passage(
  p_passage_id uuid,
  p_target_revision integer
)
returns public.church_library_passages
language plpgsql
security invoker
set search_path = public
as $$
declare
  v_actor uuid := auth.uid();
  v_current public.church_library_passages%rowtype;
  v_target public.church_library_passage_revisions%rowtype;
  v_next_rev integer;
  v_result public.church_library_passages;
begin
  if not coalesce(public.is_staff(), false) then
    raise exception 'Staff role required to rollback Church Library passages' using errcode = '42501';
  end if;

  select * into v_current
  from public.church_library_passages
  where id = p_passage_id
  for update;

  if v_current.id is null then
    raise exception 'Passage not found: %', p_passage_id using errcode = 'P0002';
  end if;

  select * into v_target
  from public.church_library_passage_revisions
  where passage_id = p_passage_id and revision_number = p_target_revision;

  if v_target.id is null then
    raise exception 'Revision % not found for passage %', p_target_revision, p_passage_id using errcode = 'P0002';
  end if;

  v_next_rev := v_current.revision_count + 1;

  -- Record rollback action as a new durable revision
  insert into public.church_library_passage_revisions (
    passage_id,
    revision_number,
    previous_content,
    new_content,
    change_summary,
    review_status,
    reviewer_notes,
    created_by
  ) values (
    v_current.id,
    v_next_rev,
    v_current.content,
    v_target.new_content,
    format('Rolled back to revision %s', p_target_revision),
    v_target.review_status,
    format('Restored from revision %s', p_target_revision),
    v_actor
  );

  update public.church_library_passages
  set content = v_target.new_content,
      review_status = v_target.review_status,
      reviewer_notes = format('Rolled back to revision %s', p_target_revision),
      reviewed_by = v_actor,
      reviewed_at = now(),
      revision_count = v_next_rev,
      updated_by = v_actor,
      updated_at = now(),
      search_document = to_tsvector('simple', v_target.new_content || ' ' || coalesce(v_current.chapter_reference, ''))
  where id = v_current.id
  returning * into v_result;

  return v_result;
end;
$$;

-- 6. Permissions and RLS for revisions table
alter table public.church_library_passage_revisions enable row level security;

revoke all on public.church_library_passage_revisions from anon;
grant select, insert on public.church_library_passage_revisions to authenticated;
grant all on public.church_library_passage_revisions to service_role;

drop policy if exists church_library_passage_revisions_staff_read on public.church_library_passage_revisions;
create policy church_library_passage_revisions_staff_read
  on public.church_library_passage_revisions for select to authenticated
  using (public.is_staff());

drop policy if exists church_library_passage_revisions_staff_write on public.church_library_passage_revisions;
create policy church_library_passage_revisions_staff_write
  on public.church_library_passage_revisions for insert to authenticated
  with check (public.is_staff());

revoke all on function public.update_church_library_passage(uuid, text, text, text, text, integer) from public, anon;
grant execute on function public.update_church_library_passage(uuid, text, text, text, text, integer) to authenticated, service_role;

revoke all on function public.rollback_church_library_passage(uuid, integer) from public, anon;
grant execute on function public.rollback_church_library_passage(uuid, integer) to authenticated, service_role;

notify pgrst, 'reload schema';
commit;
