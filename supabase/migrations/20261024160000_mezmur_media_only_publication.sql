-- Mezmur CMS: allow a safe media/source-only public record when lyrics rights
-- are unresolved, without republishing protected lyrics.
--
-- Forward-only and idempotent. This migration does not update any content row,
-- alter a stored status, change rights metadata, or disable RLS.

begin;

create or replace function public.guard_mezmur_import_publication()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  v_via_rpc boolean :=
    coalesce(current_setting('tewahedo.publication_via_rpc', true), '') = 'on'
    or coalesce(current_setting('tewahedo.approval_via_rpc', true), '') = 'on';
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
     and coalesce(current_setting('tewahedo.publication_via_rpc', true), '') <> 'on' then
    raise exception 'Use publish_mezmur_import for publication transitions' using errcode = '42501';
  end if;

  if not v_via_rpc then
    if tg_op = 'INSERT' then
      new.rights_status := coalesce(nullif(trim(new.rights_status), ''), 'unknown');
      if new.rights_status not in ('unknown', 'external_only')
         or new.publication_approved_at is not null
         or new.publication_approved_by is not null then
        raise exception 'Lyrics rights metadata can only be changed through the protected rights-verification workflow'
          using errcode = '42501';
      end if;
    elsif new.rights_status is distinct from old.rights_status
       or new.publication_approved_at is distinct from old.publication_approved_at
       or new.publication_approved_by is distinct from old.publication_approved_by then
      raise exception 'Lyrics rights metadata can only be changed through the protected rights-verification workflow'
        using errcode = '42501';
    end if;
  end if;

  if new.status = 'published' then
    if nullif(trim(coalesce(new.title, '')), '') is null
       or nullif(trim(coalesce(new.slug, '')), '') is null
       or nullif(trim(coalesce(new.lyrics_amharic, '')), '') is null then
      raise exception 'Title, slug, and Amharic lyrics are required' using errcode = '23514';
    end if;

    v_lyrics_allowed :=
      new.rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
      and new.publication_approved_at is not null
      and new.publication_approved_by is not null;
    v_has_external_destination :=
      nullif(trim(coalesce(new.youtube_url, '')), '') is not null
      or nullif(trim(coalesce(new.external_lyrics_url, '')), '') is not null
      or nullif(trim(coalesce(new.source_url, '')), '') is not null;

    if not v_lyrics_allowed and not v_has_external_destination then
      raise exception 'Add a YouTube or authorized source link before publishing this media-only Mezmur'
        using errcode = '23514';
    end if;
  end if;

  return new;
end;
$$;

revoke all on function public.guard_mezmur_import_publication() from public, anon, authenticated;

drop function if exists public.publish_mezmur_import(text, text, text);
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
  v_count integer;
  v_lyrics_allowed boolean;
  v_has_external_destination boolean;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role is null or v_role not in ('editor', 'admin', 'super_admin') then
    raise exception 'An editor, admin, or super admin role is required' using errcode = '42501';
  end if;

  select count(*) into v_count
  from public.mezmur_data_import
  where lower(trim(slug)) = lower(trim(p_slug));
  if v_count <> 1 then
    raise exception 'Expected one Mezmur for slug %, found %', p_slug, v_count using errcode = 'P0002';
  end if;

  select * into v_row
  from public.mezmur_data_import
  where lower(trim(slug)) = lower(trim(p_slug))
  for update;

  if p_expected_updated_at is not null and v_row.updated_at is distinct from p_expected_updated_at then
    raise exception 'This Mezmur changed after it was saved. Reload before publishing.' using errcode = '40001';
  end if;

  if nullif(trim(coalesce(v_row.title, '')), '') is null
     or nullif(trim(coalesce(v_row.slug, '')), '') is null
     or nullif(trim(coalesce(v_row.lyrics_amharic, '')), '') is null then
    raise exception 'Title, slug, and Amharic lyrics are required' using errcode = '23514';
  end if;

  v_lyrics_allowed :=
    v_row.rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
    and v_row.publication_approved_at is not null
    and v_row.publication_approved_by is not null;
  v_has_external_destination :=
    nullif(trim(coalesce(v_row.youtube_url, '')), '') is not null
    or nullif(trim(coalesce(v_row.external_lyrics_url, '')), '') is not null
    or nullif(trim(coalesce(v_row.source_url, '')), '') is not null;

  if not v_lyrics_allowed and not v_has_external_destination then
    raise exception 'Add a YouTube or authorized source link before publishing this media-only Mezmur'
      using errcode = '23514';
  end if;

  perform set_config('tewahedo.publication_via_rpc', 'on', true);
  update public.mezmur_data_import
  set status = 'published', updated_at = clock_timestamp()::text
  where mezmur_id = v_row.mezmur_id;
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

-- The view is the public security boundary. Restricted/unverified lyrics remain
-- in the protected base table but are returned as NULL to public clients.
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
              and publication_approved_at is not null and publication_approved_by is not null
       then lyrics_amharic else null end as lyrics_amharic,
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
              and publication_approved_at is not null and publication_approved_by is not null
       then lyrics_transliteration else null end as lyrics_transliteration,
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
              and publication_approved_at is not null and publication_approved_by is not null
       then lyrics_english else null end as lyrics_english,
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
              and publication_approved_at is not null and publication_approved_by is not null
       then lyrics_geez else null end as lyrics_geez,
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
              and publication_approved_at is not null and publication_approved_by is not null
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
  case when rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
              and publication_approved_at is not null and publication_approved_by is not null
       then structured_lyrics else null end as structured_lyrics,
  lyrics_language,
  source_info,
  rights_status,
  external_lyrics_url,
  last_verified_at,
  related_content
from public.mezmur_data_import
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
    or nullif(trim(coalesce(external_lyrics_url, '')), '') is not null
    or nullif(trim(coalesce(source_url, '')), '') is not null
  );

revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;

notify pgrst, 'reload schema';
commit;
