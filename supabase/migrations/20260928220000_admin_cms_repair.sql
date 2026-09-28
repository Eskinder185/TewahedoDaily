-- Repair migration for Admin CMS + Community Submissions.
-- Safe / re-runnable where practical. Does not destroy production data.
begin;

-- Editors may maintain taxonomy (categories, singers, tags), matching CMS UI expectations.
-- Admins/super_admins retain full access. Contributors remain read-only.
do $$
declare
  t text;
begin
  foreach t in array array['categories', 'singers', 'tags'] loop
    execute format('drop policy if exists taxonomy_manage on public.%I', t);
    execute format(
      $policy$
      create policy taxonomy_manage on public.%I for all to authenticated
      using (cms_private.current_role() in ('editor', 'admin', 'super_admin'))
      with check (cms_private.current_role() in ('editor', 'admin', 'super_admin'))
      $policy$,
      t
    );
  end loop;
end $$;

-- Ensure content_reports stays staff-only for browse/update; anonymous insert remains denied
-- (corrections go through community_submissions + Pages Function).
do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'content_reports' and policyname = 'reports_review'
  ) then
    create policy reports_review on public.content_reports for select to authenticated
    using (cms_private.current_role() in ('editor', 'admin', 'super_admin'));
  end if;
end $$;

-- Helpful lookup indexes if missing (no-op when already present).
create index if not exists mezmur_status_updated_idx on public.mezmur (status, updated_at desc);
create index if not exists community_submissions_type_status_idx
  on public.community_submissions (submission_type, status, created_at desc);

commit;
