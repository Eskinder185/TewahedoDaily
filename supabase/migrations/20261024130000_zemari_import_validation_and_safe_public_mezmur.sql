-- Read-only Zemari import capability check and least-exposure public Mezmur view.
-- Source-only: do not apply to production without explicit operator approval.
-- This migration creates no Zemaris and changes no Mezmur publication status.

begin;

create or replace function public.validate_zemari_import_access()
returns jsonb
language sql
stable
security invoker
set search_path = ''
as $$
  select jsonb_build_object(
    'user_id', auth.uid(),
    'is_staff', coalesce(public.is_staff(), false),
    'can_select_zemaris', has_table_privilege('authenticated', 'public.zemaris', 'select'),
    'can_insert_zemaris', has_table_privilege('authenticated', 'public.zemaris', 'insert'),
    'can_update_zemaris', has_table_privilege('authenticated', 'public.zemaris', 'update'),
    'can_update_mezmur_links', has_table_privilege('authenticated', 'public.mezmur_data_import', 'update')
  );
$$;

revoke all on function public.validate_zemari_import_access() from public, anon;
grant execute on function public.validate_zemari_import_access() to authenticated;

-- The base import table remains available to staff only. Public clients use a
-- deliberately narrow view that contains no review notes, import notes, or
-- approver identity and includes only fully approved, rights-cleared records.
drop view if exists public.mezmur_public;
create view public.mezmur_public
with (security_barrier = true)
as
select
  mezmur_id,
  slug,
  title,
  title_amharic,
  title_english,
  description,
  description_amharic,
  lyrics_amharic,
  lyrics_transliteration,
  lyrics_english,
  lyrics_geez,
  lyrics_oromo,
  primary_language,
  form,
  singer_id,
  singer_slug,
  singer_name,
  zemari_id,
  youtube_url,
  audio_url,
  image_path,
  image_alt,
  legacy_thumbnail_url,
  search_keywords,
  status,
  review_status,
  source_url,
  created_at,
  updated_at,
  structured_lyrics,
  lyrics_language,
  source_info,
  rights_status,
  external_lyrics_url,
  last_verified_at,
  related_content
from public.mezmur_data_import
where lower(trim(coalesce(status, ''))) = 'published'
  and lower(trim(coalesce(review_status, ''))) = 'approved'
  and rights_status in (
    'owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only'
  )
  and publication_approved_at is not null
  and publication_approved_by is not null;

revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;

revoke select on public.mezmur_data_import from anon;
drop policy if exists mezmur_data_import_public_read on public.mezmur_data_import;
drop policy if exists mezmur_data_import_staff_read on public.mezmur_data_import;
create policy mezmur_data_import_staff_read
  on public.mezmur_data_import for select to authenticated
  using (coalesce(public.is_staff(), false));

notify pgrst, 'reload schema';
commit;
