-- Forward-only migration: Expose authorized lyrics in public.mezmur_public
--
-- Restores lyrics display for published Mezmurs when TewahedoDaily has reproduction
-- permissions ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only').
--
-- Removes the obsolete legacy requirement for publication_approved_at/by audit timestamps.
-- Preserves privacy for restricted Mezmurs ('external_only', 'restricted', 'unknown').
-- Ensures Draft Mezmurs remain completely invisible in public views.
-- Updates guard triggers and publish RPC to allow staff to record rights_status.
-- Exposes stored lyrics availability (has_stored_lyrics) so public UI distinguishes
-- between genuinely missing transcriptions and restricted/unknown permission records.
-- DOES NOT automatically fabricate approval or convert unknown rights.

begin;

-- ---------------------------------------------------------------------------
-- 1. Validate exact 30-column contract on public.mezmur_public before replacing
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
    -- Allow replacing if either matching 30 base columns or 31 columns with has_stored_lyrics
    if v_columns is distinct from v_expected and v_columns is distinct from (v_expected || 'has_stored_lyrics') then
      raise exception 'Refusing to replace public.mezmur_public: unexpected column contract %', v_columns
        using errcode = '55000',
              hint = 'Review the current view definition and dependent objects before applying this migration.';
    end if;
  end if;
end $$;

-- ---------------------------------------------------------------------------
-- 2. Update publication trigger to allow staff rights_status updates
-- ---------------------------------------------------------------------------
create or replace function public.guard_mezmur_import_publication()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  v_publication_rpc boolean :=
    coalesce(current_setting('tewahedo.publication_via_rpc', true), '') = 'on';
  v_lyrics_allowed boolean;
  v_has_external_destination boolean;
begin
  new.status := lower(trim(coalesce(new.status, 'draft')));

  if new.status not in ('draft', 'published')
     and (tg_op = 'INSERT' or new.status is distinct from old.status) then
    raise exception 'Mezmur status must be draft or published' using errcode = '23514';
  end if;

  if new.status = 'published'
     and (tg_op = 'INSERT' or old.status is distinct from 'published')
     and not v_publication_rpc then
    raise exception 'Use publish_mezmur_import for publication transitions' using errcode = '42501';
  end if;

  -- Validate rights_status values
  new.rights_status := lower(trim(coalesce(new.rights_status, 'unknown')));
  if new.rights_status not in (
    'owned', 'licensed', 'authorized_contributor', 'public_domain',
    'display_only', 'external_only', 'restricted', 'unknown'
  ) then
    raise exception 'Invalid rights_status: %', new.rights_status using errcode = '23514';
  end if;

  if new.status = 'published' then
    if nullif(trim(coalesce(new.title, '')), '') is null
       or nullif(trim(coalesce(new.slug, '')), '') is null then
      raise exception 'Title and slug are required to publish' using errcode = '23514';
    end if;

    v_lyrics_allowed :=
      new.rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only');
    v_has_external_destination :=
      nullif(trim(coalesce(new.youtube_url, '')), '') is not null
      or nullif(trim(coalesce(new.source_url, '')), '') is not null;

    if not v_lyrics_allowed and not v_has_external_destination then
      raise exception 'Add a YouTube or authorized source link before publishing; unverified lyrics cannot be displayed'
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
-- 3. Update publish_mezmur_import RPC removing obsolete approval gate
-- ---------------------------------------------------------------------------
drop function if exists public.publish_mezmur_import(text, text);

create function public.publish_mezmur_import(
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
  v_lyrics_allowed boolean;
  v_has_external_destination boolean;
begin
  if v_actor is null then
    raise exception 'Authentication required' using errcode = '42501';
  end if;

  select role into v_role from public.profiles where id = v_actor;
  if v_role not in ('editor', 'admin', 'super_admin') then
    raise exception 'Staff permissions required' using errcode = '42501';
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

  v_lyrics_allowed :=
    v_row.rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only');
  v_has_external_destination :=
    nullif(trim(coalesce(v_row.youtube_url, '')), '') is not null
    or nullif(trim(coalesce(v_row.source_url, '')), '') is not null;

  if not v_lyrics_allowed and not v_has_external_destination then
    raise exception 'Add a YouTube or authorized source link before publishing; unverified lyrics cannot be displayed'
      using errcode = '23514';
  end if;

  perform set_config('tewahedo.publication_via_rpc', 'on', true);
  update public.mezmur_data_import
  set status = 'published',
      updated_at = clock_timestamp()::text
  where ctid = v_row_tid;
  perform set_config('tewahedo.publication_via_rpc', 'off', true);

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  values
    (v_row.slug, 'published', v_row.status, 'published', v_row.review_status, v_row.rights_status, v_actor, v_role);

  return jsonb_build_object(
    'slug', v_row.slug,
    'status', 'published',
    'lyrics_display', v_lyrics_allowed,
    'media_only', not v_lyrics_allowed
  );
end;
$$;

revoke all on function public.publish_mezmur_import(text, text) from public, anon;
grant execute on function public.publish_mezmur_import(text, text) to authenticated;

-- ---------------------------------------------------------------------------
-- 4. Rebuild public.mezmur_public exposing authorized lyrics & stored availability
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
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
       then lyrics_amharic else null end as lyrics_amharic,
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
       then lyrics_transliteration else null end as lyrics_transliteration,
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
       then lyrics_english else null end as lyrics_english,
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
       then lyrics_geez else null end as lyrics_geez,
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
       then lyrics_oromo else null end as lyrics_oromo,
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
  rights_status,
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
  and nullif(trim(coalesce(slug, '')), '') is not null
  and (
    nullif(trim(coalesce(lyrics_amharic, '')), '') is not null
    or nullif(trim(coalesce(lyrics_geez, '')), '') is not null
    or nullif(trim(coalesce(lyrics_english, '')), '') is not null
    or nullif(trim(coalesce(lyrics_oromo, '')), '') is not null
    or nullif(trim(coalesce(lyrics_transliteration, '')), '') is not null
    or nullif(trim(coalesce(youtube_url, '')), '') is not null
    or nullif(trim(coalesce(source_url, '')), '') is not null
  )
  and (
    rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
    or nullif(trim(coalesce(youtube_url, '')), '') is not null
    or nullif(trim(coalesce(source_url, '')), '') is not null
  );

revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;

commit;
