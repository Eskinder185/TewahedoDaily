-- Phase 4: identity-gated dry run only. No production write is included.
begin;
create temporary table phase4_draft_plan (import_id uuid primary key, expected_status text not null check (expected_status = 'published'), reason text not null, expected_updated_at text not null) on commit drop;
-- Populate only from an authorized read-only identity query. Never guess an import_id.
-- insert into phase4_draft_plan values ('00000000-0000-0000-0000-000000000000','published','confirmed collision','exact-updated-at');
do $$ begin
  if exists (select 1 from phase4_draft_plan p left join public.mezmur_data_import m on m.import_id=p.import_id where m.import_id is null or m.status is distinct from p.expected_status or m.updated_at::text is distinct from p.expected_updated_at) then raise exception 'Phase 4 identity/status precondition failed; no records changed.'; end if;
end $$;
select p.import_id, m.title, m.slug, m.status, m.updated_at, p.reason from phase4_draft_plan p join public.mezmur_data_import m on m.import_id=p.import_id;
-- After review, use the existing authorized unpublish/status-transition workflow.
rollback;
