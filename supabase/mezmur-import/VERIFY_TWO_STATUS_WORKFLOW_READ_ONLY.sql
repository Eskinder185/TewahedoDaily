-- Read-only verification for 20261024160000_mezmur_media_only_publication.sql.
-- Safe for staging or production: SELECT statements only.

-- 1. The active publication RPC and trigger definitions.
select
  p.oid::regprocedure::text as routine,
  pg_get_functiondef(p.oid) as definition
from pg_proc p
join pg_namespace n on n.oid = p.pronamespace
where n.nspname = 'public'
  and p.proname in ('publish_mezmur_import', 'guard_mezmur_import_publication')
order by routine;

select
  t.tgname as trigger_name,
  pg_get_triggerdef(t.oid, true) as definition
from pg_trigger t
where t.tgrelid = 'public.mezmur_data_import'::regclass
  and not t.tgisinternal;

-- 2. Publication privileges: authenticated may execute; anon/public may not.
select
  has_function_privilege('authenticated', 'public.publish_mezmur_import(text,text)', 'execute')
    as authenticated_can_publish,
  has_function_privilege('anon', 'public.publish_mezmur_import(text,text)', 'execute')
    as anon_can_publish,
  has_function_privilege('public', 'public.publish_mezmur_import(text,text)', 'execute')
    as public_can_publish;

-- 3. RLS remains enabled and policies remain staff-scoped.
select relrowsecurity as rls_enabled
from pg_class
where oid = 'public.mezmur_data_import'::regclass;

select policyname, cmd, roles, qual, with_check
from pg_policies
where schemaname = 'public' and tablename = 'mezmur_data_import'
order by policyname;

-- 4. Historical statuses are reported, never rewritten by the migration.
select coalesce(status, '<null>') as stored_status, count(*) as records
from public.mezmur_data_import
group by status
order by stored_status;

-- 5. Explain published rows excluded from public display without exposing lyrics.
select
  count(*) filter (where lower(trim(coalesce(status, ''))) = 'published') as marked_published,
  count(*) filter (
    where lower(trim(coalesce(status, ''))) = 'published'
      and nullif(trim(coalesce(title, '')), '') is not null
      and nullif(trim(coalesce(slug, '')), '') is not null
      and nullif(trim(coalesce(lyrics_amharic, '')), '') is not null
      and (
        (
          rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
          and publication_approved_at is not null
          and publication_approved_by is not null
        )
        or nullif(trim(coalesce(youtube_url, '')), '') is not null
        or nullif(trim(coalesce(source_url, '')), '') is not null
      )
  ) as eligible_for_public_display,
  count(*) filter (
    where lower(trim(coalesce(status, ''))) = 'published'
      and coalesce(rights_status, 'unknown') in ('unknown', 'external_only')
      and (
        nullif(trim(coalesce(youtube_url, '')), '') is not null
        or nullif(trim(coalesce(source_url, '')), '') is not null
      )
  ) as media_only_eligible
from public.mezmur_data_import;

select count(*) as public_view_records from public.mezmur_public;

select count(*) as unsafe_restricted_lyrics_exposed
from public.mezmur_public
where coalesce(rights_status, 'unknown') in ('unknown', 'external_only')
  and (
    lyrics_amharic is not null
    or lyrics_transliteration is not null
    or lyrics_english is not null
    or lyrics_geez is not null
    or lyrics_oromo is not null
  );

-- 6. Confirm the public projection has no editorial-review predicate.
select pg_get_viewdef('public.mezmur_public'::regclass, true) as public_view_definition;
