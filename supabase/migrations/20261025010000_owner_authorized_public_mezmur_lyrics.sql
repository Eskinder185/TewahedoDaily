-- ============================================================================
-- FORWARD-ONLY MIGRATION: Final Supabase Mezmur Lyrics Visibility & Publication Repair
-- Migration: 20261025010000_owner_authorized_public_mezmur_lyrics.sql
--
-- PURPOSE:
-- 1. Fulfills the owner's confirmation and authorization:
--    - The owner and author of the lyrics stored in TewahedoDaily authorizes their public display.
--    - All published Mezmurs expose their saved lyrics to all visitors without authentication.
-- 2. Repairs the guard trigger public.guard_mezmur_import_publication():
--    - Prevents SQLSTATE 42501 on rights_status transitions when called via authorized RPCs.
--    - Allows ordinary content edits on published records without failing.
--    - Removes obsolete requirement for publication_approved_at/by metadata.
--    - Permits publication of owner-authorized hymns without requiring YouTube or external links.
--    - Strictly enforces external link requirement ONLY for explicitly restricted records.
-- 3. Provides audited administrative RPCs:
--    - public.authorize_mezmur_lyrics(p_slug, p_rights_status, p_notes)
--    - public.set_mezmur_rights_authorization(p_slug, p_rights_status, p_notes)
-- 4. Backfills unverified rights_status ('unknown' or NULL) to 'owned', while strictly
--    preserving explicit per-record restrictions ('external_only', 'restricted').
-- 5. Rebuilds public.mezmur_public view:
--    - Exposes full lyrics (lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo)
--      for all published records unless explicitly restricted ('external_only', 'restricted').
--    - Appends has_stored_lyrics (column 31) to identify availability of transcriptions.
--    - Strictly filters deleted_at IS NULL, status = 'published', and non-empty title & slug.
-- 6. Updates public.publish_mezmur_import() to use clean ownership authorization.
-- 7. Provides public.get_public_mezmur_lyrics(p_slug text) Security Definer read RPC.
-- 8. Keeps Drafts, soft-deleted, and trashed records 100% private.
-- ============================================================================

begin;

-- ---------------------------------------------------------------------------
-- 1. Contract Verification: Verify existing public.mezmur_public column shape
-- ---------------------------------------------------------------------------
do $$
declare
  v_columns text[];
  v_expected text[] := array[
    'mezmur_id','slug','title','title_amharic','title_english','description','description_amharic',
    'lyrics_amharic','lyrics_transliteration','lyrics_english','lyrics_geez','lyrics_oromo',
    'primary_language','form','singer_id','singer_slug','singer_name','zemari_id',
    'youtube_url','audio_url','image_path','image_alt','legacy_thumbnail_url','search_keywords',
    'status','review_status','source_url','created_at','updated_at','rights_status'
  ];
begin
  if to_regclass('public.mezmur_public') is not null then
    select array_agg(a.attname order by a.attnum)
      into v_columns
    from pg_attribute a
    where a.attrelid = 'public.mezmur_public'::regclass
      and a.attnum > 0 and not a.attisdropped;

    -- Allow replacing if either matching 30 base columns or 31 columns (with has_stored_lyrics)
    if v_columns is distinct from v_expected and v_columns is distinct from (v_expected || 'has_stored_lyrics') then
      raise exception 'Refusing to replace public.mezmur_public: unexpected column contract %', v_columns
        using errcode = '55000',
              hint = 'Review the current view definition before applying this migration.';
    end if;
  end if;
end $$;

-- ---------------------------------------------------------------------------
-- 2. Publication Guard Trigger: Replace trigger logic BEFORE backfill
--    Prevents SQLSTATE 42501 when rights_status transitions occur via RPC or migration.
-- ---------------------------------------------------------------------------
create or replace function public.guard_mezmur_import_publication()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  v_publication_rpc boolean :=
    coalesce(current_setting('tewahedo.publication_via_rpc', true), '') = 'on';
  v_rights_rpc boolean :=
    coalesce(current_setting('tewahedo.rights_via_rpc', true), '') = 'on'
    or coalesce(current_setting('tewahedo.approval_via_rpc', true), '') = 'on'
    or v_publication_rpc;
begin
  -- 1. Status transition validation
  if tg_op = 'INSERT' or new.status is distinct from old.status then
    new.status := lower(trim(coalesce(new.status, 'draft')));
    if new.status not in ('draft', 'published') then
      raise exception 'Mezmur status must be draft or published' using errcode = '23514';
    end if;

    if new.status = 'published' and not v_publication_rpc then
      raise exception 'Use publish_mezmur_import for publication transitions' using errcode = '42501';
    end if;
  else
    new.status := lower(trim(coalesce(new.status, old.status, 'draft')));
  end if;

  -- 2. Rights status transition validation
  if tg_op = 'INSERT' then
    new.rights_status := lower(trim(coalesce(new.rights_status, 'owned')));
  elsif new.rights_status is distinct from old.rights_status then
    if not v_rights_rpc then
      raise exception 'Use authorize_mezmur_lyrics to update rights status' using errcode = '42501';
    end if;
    new.rights_status := lower(trim(coalesce(new.rights_status, 'owned')));
  else
    new.rights_status := lower(trim(coalesce(new.rights_status, old.rights_status, 'owned')));
  end if;

  if new.rights_status not in (
    'owned', 'licensed', 'authorized_contributor', 'public_domain',
    'display_only', 'external_only', 'restricted', 'unknown'
  ) then
    raise exception 'Invalid rights_status: %', new.rights_status using errcode = '23514';
  end if;

  -- 3. Publication criteria
  if lower(trim(coalesce(new.status, ''))) = 'published' then
    if nullif(trim(coalesce(new.title, '')), '') is null
       or nullif(trim(coalesce(new.slug, '')), '') is null then
      raise exception 'Title and slug are required to publish' using errcode = '23514';
    end if;

    if new.rights_status in ('external_only', 'restricted')
       and nullif(trim(coalesce(new.youtube_url, '')), '') is null
       and nullif(trim(coalesce(new.source_url, '')), '') is null then
      raise exception 'Add a YouTube or authorized source link before publishing a restricted-lyrics Mezmur'
        using errcode = '23514';
    end if;
  end if;

  return new;
end;
$$;

revoke all on function public.guard_mezmur_import_publication() from public, anon, authenticated;
drop trigger if exists mezmur_data_import_publication_guard on public.mezmur_data_import;
create trigger mezmur_data_import_publication_guard
before insert or update on public.mezmur_data_import
for each row execute function public.guard_mezmur_import_publication();

-- ---------------------------------------------------------------------------
-- 3. Administrative RPCs: Audited Rights Authorization
-- ---------------------------------------------------------------------------
create or replace function public.authorize_mezmur_lyrics(
  p_slug text,
  p_rights_status text default 'owned',
  p_notes text default null
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_row public.mezmur_data_import%rowtype;
  v_row_tid tid;
  v_status text := lower(trim(coalesce(p_rights_status, 'owned')));
begin
  if v_actor is null then
    if current_user not in ('postgres', 'supabase_admin', 'service_role') then
      raise exception 'Authentication required' using errcode = '42501';
    end if;
    v_role := 'super_admin';
  else
    select role into v_role from public.profiles where id = v_actor;
    if v_role not in ('editor', 'admin', 'super_admin') then
      raise exception 'Staff permissions required' using errcode = '42501';
    end if;
  end if;

  if nullif(trim(coalesce(p_slug, '')), '') is null then
    raise exception 'Slug required' using errcode = '23514';
  end if;

  if v_status not in (
    'owned', 'licensed', 'authorized_contributor', 'public_domain',
    'display_only', 'external_only', 'restricted'
  ) then
    raise exception 'Invalid rights_status: %', p_rights_status using errcode = '23514';
  end if;

  select ctid, * into v_row_tid, v_row
  from public.mezmur_data_import
  where slug = trim(p_slug)
    and deleted_at is null
  for update;

  if not found then
    raise exception 'Mezmur not found' using errcode = 'P0002';
  end if;

  perform set_config('tewahedo.rights_via_rpc', 'on', true);
  update public.mezmur_data_import
  set rights_status = v_status,
      source_notes = coalesce(p_notes, source_notes),
      updated_at = clock_timestamp()::text
  where ctid = v_row_tid;
  perform set_config('tewahedo.rights_via_rpc', 'off', true);

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  values
    (v_row.slug, 'rights_authorized', v_row.status, v_row.status, v_row.review_status, v_status, v_actor, v_role);

  return jsonb_build_object(
    'slug', v_row.slug,
    'status', v_row.status,
    'rights_status', v_status,
    'lyrics_display', v_status not in ('external_only', 'restricted')
  );
end;
$$;

revoke all on function public.authorize_mezmur_lyrics(text, text, text) from public, anon;
grant execute on function public.authorize_mezmur_lyrics(text, text, text) to authenticated;

create or replace function public.set_mezmur_rights_authorization(
  p_slug text,
  p_rights_status text default 'owned',
  p_notes text default null
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
begin
  return public.authorize_mezmur_lyrics(p_slug, p_rights_status, p_notes);
end;
$$;

revoke all on function public.set_mezmur_rights_authorization(text, text, text) from public, anon;
grant execute on function public.set_mezmur_rights_authorization(text, text, text) to authenticated;

-- ---------------------------------------------------------------------------
-- 4. Backfill: Update unverified rights_status to 'owned' per Owner Confirmation
--    Preserves any explicit 'restricted' or 'external_only' flags.
-- ---------------------------------------------------------------------------
do $$
begin
  perform set_config('tewahedo.rights_via_rpc', 'on', true);
  update public.mezmur_data_import
  set rights_status = 'owned'
  where rights_status is null
     or lower(trim(rights_status)) = 'unknown';
  perform set_config('tewahedo.rights_via_rpc', 'off', true);
end $$;

-- ---------------------------------------------------------------------------
-- 5. Rebuild public.mezmur_public View
--    Exposes saved lyrics to public visitors. Redacts ONLY if explicitly restricted.
-- ---------------------------------------------------------------------------
create or replace view public.mezmur_public
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
  case when lower(trim(coalesce(rights_status, 'owned'))) in ('external_only', 'restricted')
       then null else lyrics_amharic end as lyrics_amharic,
  case when lower(trim(coalesce(rights_status, 'owned'))) in ('external_only', 'restricted')
       then null else lyrics_transliteration end as lyrics_transliteration,
  case when lower(trim(coalesce(rights_status, 'owned'))) in ('external_only', 'restricted')
       then null else lyrics_english end as lyrics_english,
  case when lower(trim(coalesce(rights_status, 'owned'))) in ('external_only', 'restricted')
       then null else lyrics_geez end as lyrics_geez,
  case when lower(trim(coalesce(rights_status, 'owned'))) in ('external_only', 'restricted')
       then null else lyrics_oromo end as lyrics_oromo,
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
  coalesce(rights_status, 'owned') as rights_status,
  (
    nullif(trim(coalesce(lyrics_amharic, '')), '') is not null
    or nullif(trim(coalesce(lyrics_geez, '')), '') is not null
    or nullif(trim(coalesce(lyrics_english, '')), '') is not null
    or nullif(trim(coalesce(lyrics_oromo, '')), '') is not null
    or nullif(trim(coalesce(lyrics_transliteration, '')), '') is not null
  ) as has_stored_lyrics
from public.mezmur_data_import
where deleted_at is null
  and lower(trim(coalesce(status, ''))) = 'published'
  and nullif(trim(coalesce(title, '')), '') is not null
  and nullif(trim(coalesce(slug, '')), '') is not null;

revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;

-- ---------------------------------------------------------------------------
-- 6. Publish RPC: Clean publication function without obsolete approval timestamps
-- ---------------------------------------------------------------------------
create or replace function public.publish_mezmur_import(
  p_slug text,
  p_expected_updated_at text default null
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_row public.mezmur_data_import%rowtype;
  v_row_tid tid;
  v_is_restricted boolean;
begin
  if v_actor is null then
    if current_user not in ('postgres', 'supabase_admin', 'service_role') then
      raise exception 'Authentication required' using errcode = '42501';
    end if;
    v_role := 'super_admin';
  else
    select role into v_role from public.profiles where id = v_actor;
    if v_role not in ('editor', 'admin', 'super_admin') then
      raise exception 'Staff permissions required' using errcode = '42501';
    end if;
  end if;

  if nullif(trim(coalesce(p_slug, '')), '') is null then
    raise exception 'Slug required' using errcode = '23514';
  end if;

  select ctid, * into v_row_tid, v_row
  from public.mezmur_data_import
  where slug = trim(p_slug)
    and deleted_at is null
  for update;

  if not found then
    raise exception 'Mezmur not found' using errcode = 'P0002';
  end if;

  if p_expected_updated_at is not null
     and nullif(trim(v_row.updated_at), '') is not null
     and v_row.updated_at is distinct from p_expected_updated_at then
    raise exception 'Conflict: this mezmur was modified by another editor' using errcode = '40001';
  end if;

  if nullif(trim(coalesce(v_row.title, '')), '') is null
     or nullif(trim(coalesce(v_row.slug, '')), '') is null then
    raise exception 'Title and slug are required to publish' using errcode = '23514';
  end if;

  v_is_restricted := coalesce(v_row.rights_status, 'owned') in ('external_only', 'restricted');
  if v_is_restricted
     and nullif(trim(coalesce(v_row.youtube_url, '')), '') is null
     and nullif(trim(coalesce(v_row.source_url, '')), '') is null then
    raise exception 'Add a YouTube or authorized source link before publishing a restricted-lyrics Mezmur'
      using errcode = '23514';
  end if;

  perform set_config('tewahedo.publication_via_rpc', 'on', true);
  update public.mezmur_data_import
  set status = 'published',
      rights_status = coalesce(nullif(trim(rights_status), ''), 'owned'),
      updated_at = clock_timestamp()::text
  where ctid = v_row_tid;
  perform set_config('tewahedo.publication_via_rpc', 'off', true);

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  values
    (v_row.slug, 'published', v_row.status, 'published', v_row.review_status, coalesce(v_row.rights_status, 'owned'), v_actor, v_role);

  return jsonb_build_object(
    'slug', v_row.slug,
    'status', 'published',
    'lyrics_display', not v_is_restricted,
    'media_only', v_is_restricted
  );
end;
$$;

revoke all on function public.publish_mezmur_import(text, text) from public, anon;
grant execute on function public.publish_mezmur_import(text, text) to authenticated;

-- ---------------------------------------------------------------------------
-- 7. Public Lyrics RPC: get_public_mezmur_lyrics(p_slug text)
--    Direct Security Definer lookup that reads exclusively from mezmur_public.
--    Guarantees Drafts and deleted hymns can never be accessed.
-- ---------------------------------------------------------------------------
create or replace function public.get_public_mezmur_lyrics(p_slug text)
returns table (
  mezmur_id uuid,
  slug text,
  title text,
  title_amharic text,
  title_english text,
  lyrics_amharic text,
  lyrics_transliteration text,
  lyrics_english text,
  lyrics_geez text,
  lyrics_oromo text,
  primary_language text,
  rights_status text,
  has_stored_lyrics boolean
)
language plpgsql
security definer
set search_path = ''
as $$
begin
  return query
  select
    m.mezmur_id,
    m.slug,
    m.title,
    m.title_amharic,
    m.title_english,
    m.lyrics_amharic,
    m.lyrics_transliteration,
    m.lyrics_english,
    m.lyrics_geez,
    m.lyrics_oromo,
    m.primary_language,
    m.rights_status,
    m.has_stored_lyrics
  from public.mezmur_public m
  where m.slug = trim(p_slug)
  limit 1;
end;
$$;

revoke all on function public.get_public_mezmur_lyrics(text) from public;
grant execute on function public.get_public_mezmur_lyrics(text) to anon, authenticated;

commit;

-- ============================================================================
-- VERIFICATION QUERIES (Run these in Supabase SQL Editor after applying)
-- ============================================================================
-- 1. Check absera-gebriel:
--    SELECT slug, title, status, rights_status,
--           length(lyrics_amharic) AS amharic_len,
--           length(lyrics_transliteration) AS translit_len,
--           has_stored_lyrics
--    FROM public.mezmur_public
--    WHERE slug = 'absera-gebriel';
--    -- Expected: amharic_len = 235, translit_len = 371, rights_status = 'owned', has_stored_lyrics = true
--
-- 2. Check published Mezmurs now expose lyrics:
--    SELECT count(*) AS published_total,
--           count(lyrics_amharic) AS published_with_amharic_lyrics,
--           count(*) FILTER (WHERE has_stored_lyrics) AS with_stored_lyrics
--    FROM public.mezmur_public;
--
-- 3. Verify draft hymns are NOT visible in public view:
--    SELECT count(*) FROM public.mezmur_public WHERE status = 'draft'; -- Must be 0
--
-- 4. Verify soft-deleted hymns are NOT visible:
--    SELECT count(*) FROM public.mezmur_public WHERE slug IN (
--      SELECT slug FROM public.mezmur_data_import WHERE deleted_at IS NOT NULL
--    ); -- Must be 0
--
-- 5. Test public RPC retrieval as anonymous client:
--    SELECT * FROM public.get_public_mezmur_lyrics('absera-gebriel');
-- ============================================================================
