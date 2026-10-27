-- Migration: 20261025040000_grant_zemaris_with_counts_anon.sql
-- Description: Grant SELECT on public.zemaris_with_counts to anon and authenticated roles.
-- Ensures public visitors browsing hymns and singers receive accurate counts without 42501 permission denials.

do $$
begin
  if exists (
    select 1
    from pg_views
    where schemaname = 'public'
      and viewname = 'zemaris_with_counts'
  ) then
    grant select on table public.zemaris_with_counts to anon, authenticated;
  end if;
end $$;

notify pgrst, 'reload schema';
