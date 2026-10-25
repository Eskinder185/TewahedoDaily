-- READ ONLY verification for 20261024180000_mezmur_two_state_publication_final.sql.
-- Run after applying the single reviewed migration. No content is changed.

-- Exactly one two-argument publication function should remain. Its definition
-- must contain role/content/rights checks and no review_status approval gate.
select
  p.oid::regprocedure::text as routine,
  p.prosecdef as security_definer,
  pg_get_functiondef(p.oid) as definition
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in ('publish_mezmur_import', 'guard_mezmur_import_publication')
order by routine;

select
  count(*) filter (where pg_get_function_identity_arguments(p.oid) = 'p_slug text, p_expected_updated_at text') as expected_overloads,
  count(*) as all_publish_overloads
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public' and p.proname = 'publish_mezmur_import';

select
  has_function_privilege('authenticated', 'public.publish_mezmur_import(text,text)', 'execute') as authenticated_can_execute,
  has_function_privilege('anon', 'public.publish_mezmur_import(text,text)', 'execute') as anon_can_execute,
  has_function_privilege('public', 'public.publish_mezmur_import(text,text)', 'execute') as public_can_execute;

select t.tgname, pg_get_triggerdef(t.oid, true) as definition
from pg_trigger t
where t.tgrelid = 'public.mezmur_data_import'::regclass
  and not t.tgisinternal
order by t.tgname;

-- RLS must be on. There must be no anon base-table privilege or unrestricted
-- base-table policy. Authenticated table privilege is still constrained by RLS.
select
  c.relrowsecurity as rls_enabled,
  has_table_privilege('anon', c.oid, 'SELECT') as anon_can_select_base,
  has_table_privilege('authenticated', c.oid, 'SELECT') as authenticated_has_table_select
from pg_class c
where c.oid = 'public.mezmur_data_import'::regclass;

select policyname, cmd, roles, qual, with_check
from pg_policies
where schemaname = 'public' and tablename = 'mezmur_data_import'
order by policyname;

select pg_get_viewdef('public.mezmur_public'::regclass, true) as public_view_definition;

-- Save this ordered contract before applying the migration and compare it with
-- the post-migration result. No optional Mezmur columns are assumed.
select ordinal_position, column_name, data_type, udt_name
from information_schema.columns
where table_schema = 'public' and table_name = 'mezmur_public'
order by ordinal_position;

select column_name as unexpected_optional_column
from information_schema.columns
where table_schema = 'public' and table_name in ('mezmur_data_import', 'mezmur_public')
  and column_name in (
    'structured_lyrics', 'lyrics_language', 'source_info',
    'external_lyrics_url', 'last_verified_at', 'related_content'
  )
order by table_name, ordinal_position;

-- Counts only; never expose protected draft lyrics in this verification output.
select
  count(*) filter (where lower(trim(coalesce(status, ''))) = 'draft') as private_drafts,
  count(*) filter (where lower(trim(coalesce(status, ''))) = 'published') as stored_published,
  (select count(*) from public.mezmur_public) as public_projection_rows
from public.mezmur_data_import;

select count(*) as restricted_lyrics_exposed
from public.mezmur_public
where coalesce(rights_status, 'unknown') in ('unknown', 'external_only')
  and (
    lyrics_amharic is not null
    or lyrics_transliteration is not null
    or lyrics_english is not null
    or lyrics_geez is not null
    or lyrics_oromo is not null
  );
