-- Read-only verification. Run in Supabase SQL Editor after applying
-- 20261024290000_mezmur_zemari_matching.sql. This never changes content.

select
  to_regclass('public.zemari_aliases') is not null as alias_table_installed,
  to_regprocedure('public.bulk_link_mezmur_zemaris(jsonb,boolean)') is not null as link_rpc_installed;

select
  count(*) filter (where m.status = 'draft' and m.deleted_at is null) as active_drafts,
  count(*) filter (where m.status = 'draft' and m.deleted_at is null and z.id is not null) as linked_to_active_zemari,
  count(*) filter (where m.status = 'draft' and m.deleted_at is null and z.id is null and nullif(trim(m.singer_name), '') is not null) as name_recorded_not_linked,
  count(*) filter (where m.status = 'draft' and m.deleted_at is null and z.id is null and nullif(trim(m.singer_name), '') is null) as singer_name_not_recorded,
  count(*) filter (where m.status = 'draft' and m.deleted_at is null and m.zemari_id is not null and z.id is null) as invalid_or_deleted_zemari_links
from public.mezmur_data_import m
left join public.zemaris z on z.id = m.zemari_id and z.deleted_at is null;

select grantee, privilege_type
from information_schema.routine_privileges
where routine_schema = 'public' and routine_name = 'bulk_link_mezmur_zemaris'
order by grantee, privilege_type;

select policyname, roles, cmd, qual, with_check
from pg_policies
where schemaname = 'public' and tablename = 'zemari_aliases'
order by policyname;

select count(*) as verified_aliases
from public.zemari_aliases
where is_verified;
