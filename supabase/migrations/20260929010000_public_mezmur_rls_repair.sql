-- Public mezmur: ensure anon/authenticated can SELECT published rows only.
-- Does not disable RLS. Does not grant write to anon.
-- Safe to re-run.

begin;

alter table public.mezmur enable row level security;

revoke all on table public.mezmur from anon, authenticated;
grant select on table public.mezmur to anon, authenticated;

drop policy if exists content_read on public.mezmur;
create policy content_read on public.mezmur
  for select to anon, authenticated
  using (
    status = 'published'
    or cms_private.current_role() in ('editor', 'admin', 'super_admin')
    or (cms_private.current_role() = 'contributor' and created_by = auth.uid())
  );

-- Taxonomy + tag links used by public library embeds
alter table public.categories enable row level security;
alter table public.singers enable row level security;
alter table public.tags enable row level security;
alter table public.mezmur_tags enable row level security;

revoke all on table public.categories from anon, authenticated;
revoke all on table public.singers from anon, authenticated;
revoke all on table public.tags from anon, authenticated;
revoke all on table public.mezmur_tags from anon, authenticated;

grant select on table public.categories to anon, authenticated;
grant select on table public.singers to anon, authenticated;
grant select on table public.tags to anon, authenticated;
grant select on table public.mezmur_tags to anon, authenticated;

drop policy if exists taxonomy_read on public.categories;
drop policy if exists taxonomy_read on public.singers;
drop policy if exists taxonomy_read on public.tags;
create policy taxonomy_read on public.categories for select to anon, authenticated using (true);
create policy taxonomy_read on public.singers for select to anon, authenticated using (true);
create policy taxonomy_read on public.tags for select to anon, authenticated using (true);

drop policy if exists links_read on public.mezmur_tags;
create policy links_read on public.mezmur_tags
  for select to anon, authenticated
  using (
    exists (
      select 1 from public.mezmur m
      where m.id = mezmur_id
        and (
          m.status = 'published'
          or cms_private.current_role() in ('editor', 'admin', 'super_admin')
          or (cms_private.current_role() = 'contributor' and m.created_by = auth.uid())
        )
    )
  );

commit;
