-- PHASE 2 — REVIEW-ONLY / DRY-RUN TEMPLATE
-- Generated from public snapshot 2026-10-27T16:10:09.326Z (86a02421886cc1dc782a3ccfd503d9d7b566e7a947d2260ecaff5da2e20f57f1).
-- Default behavior: verifies an empty approval plan and ROLLBACKs.
-- It cannot modify production until an administrator adds reviewed rows and replaces ROLLBACK with COMMIT.

begin;

-- Approved rows must be populated only after a staff read-only identity audit.
create temporary table phase2_slug_plan (
  import_id uuid primary key,
  expected_slug text not null,
  proposed_slug text not null,
  expected_updated_at text not null,
  expected_status text not null check (expected_status in ('draft', 'published')),
  preserve_alias boolean not null default true
) on commit drop;

-- Example only; keep commented until explicit approval.
-- insert into phase2_slug_plan(import_id, expected_slug, proposed_slug, expected_updated_at, expected_status)
-- values ('00000000-0000-0000-0000-000000000000', 'old-slug', 'old-slug--a1b2c3d4', 'exact-updated-at-value', 'published');

-- Fail the dry run if any approved entry does not still identify the same exact
-- active row. This is intentionally read-only and leaves every row unchanged.
do $$
begin
  if exists (
    select 1
    from phase2_slug_plan p
    left join public.mezmur_data_import m on m.import_id = p.import_id
    where m.import_id is null
       or m.deleted_at is not null
       or m.slug is distinct from p.expected_slug
       or m.updated_at::text is distinct from p.expected_updated_at
       or m.status is distinct from p.expected_status
       or nullif(trim(p.proposed_slug), '') is null
       or lower(trim(p.proposed_slug)) = lower(trim(p.expected_slug))
  ) then
    raise exception 'Phase 2 slug plan precondition failed; no changes were made.';
  end if;

  if exists (
    select 1
    from phase2_slug_plan p
    join public.mezmur_data_import other
      on other.deleted_at is null
     and lower(trim(other.slug)) = lower(trim(p.proposed_slug))
     and other.import_id <> p.import_id
  ) then
    raise exception 'Phase 2 target slug is already active; no changes were made.';
  end if;
end $$;

-- Preconditions: exact immutable identity, no deleted/draft mutation, exact old value,
-- exact optimistic-lock value, and a target slug unused by every other active record.
select p.import_id, m.slug as actual_slug, m.updated_at as actual_updated_at, m.status, m.deleted_at
from phase2_slug_plan p
left join public.mezmur_data_import m on m.import_id = p.import_id;

select p.import_id, p.proposed_slug
from phase2_slug_plan p
join public.mezmur_data_import other
  on other.deleted_at is null
 and lower(trim(other.slug)) = lower(trim(p.proposed_slug))
 and other.import_id <> p.import_id;

-- Route aliases require a separately reviewed, deployed alias mechanism. Do not
-- change a slug until its old route has a verified alias to this exact import_id.
-- This template deliberately contains no UPDATE, INSERT, DELETE, or status change.

rollback;
