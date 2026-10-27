-- Execute only after reviewing PHASE_4_VERIFIED_DRAFT_PLAN.csv.
-- Run from an authorized PostgreSQL administrator session.
begin;
create temporary table phase4_plan (import_id uuid primary key, expected_status text not null check (expected_status='published'), reason text not null, expected_updated_at text not null);
\copy phase4_plan from 'reports/mezmur-quality-audit/PHASE_4_VERIFIED_DRAFT_PLAN.csv' with (format csv, header true);
create temporary table phase4_backup on commit drop as select m.* from public.mezmur_data_import m join phase4_plan p on p.import_id=m.import_id;

do $$ begin
  if exists (select 1 from phase4_plan p left join public.mezmur_data_import m on m.import_id=p.import_id where m.import_id is null or m.status is distinct from p.expected_status or m.updated_at::text is distinct from p.expected_updated_at or m.deleted_at is not null) then raise exception 'Phase 4 precondition failed; transaction aborted.'; end if;
end $$;

-- The guarded trigger remains enabled. This changes status only; all content and relationships remain untouched.
update public.mezmur_data_import m set status='draft' where m.import_id in (select import_id from phase4_plan);

select m.import_id, m.status, b.status as previous_status, p.reason from public.mezmur_data_import m join phase4_plan p on p.import_id=m.import_id join phase4_backup b on b.import_id=m.import_id;
-- Verify public projection exclusion before committing.
select p.import_id from phase4_plan p join public.mezmur_public v on false;

-- Replace with COMMIT only after reviewing both result sets and public visibility.
rollback;
