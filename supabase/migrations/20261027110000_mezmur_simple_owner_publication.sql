-- Mezmur CMS: simple owner-authorized Draft / Published workflow.
--
-- This migration is forward-only and intentionally does not backfill, delete,
-- or rewrite Mezmur content. It keeps historical rights/review columns for
-- audit purposes, but ordinary Save and Publish do not require those fields.
-- Apply manually after reviewing the deployed schema; do not use unrestricted
-- `supabase db push`.

begin;

-- Ordinary edits may not fabricate or overwrite audit metadata. Publication is
-- still restricted to the protected RPC, and published rows must contain the
-- fields required by the public projection.
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
  new.status := lower(trim(coalesce(new.status, case when tg_op = 'UPDATE' then old.status else 'draft' end)));

  if new.status not in ('draft', 'published') then
    raise exception 'Mezmur status must be draft or published' using errcode = '23514';
  end if;

  if new.status = 'published'
     and (tg_op = 'INSERT' or old.status is distinct from 'published')
     and not v_publication_rpc then
    raise exception 'Use publish_mezmur_import for publication transitions' using errcode = '42501';
  end if;

  if tg_op = 'INSERT' then
    new.rights_status := lower(trim(coalesce(nullif(new.rights_status, ''), 'unknown')));
    if new.publication_approved_at is not null or new.publication_approved_by is not null then
      raise exception 'Publication approval metadata is retained for history and cannot be set by ordinary Save'
        using errcode = '42501';
    end if;
  elsif not v_rights_rpc and (
    new.review_status is distinct from old.review_status
    or new.review_notes is distinct from old.review_notes
    or new.rights_status is distinct from old.rights_status
    or new.publication_approved_at is distinct from old.publication_approved_at
    or new.publication_approved_by is distinct from old.publication_approved_by
  ) then
    raise exception 'Review and rights history are not editable through ordinary Save'
      using errcode = '42501';
  end if;

  if new.status = 'published' then
    if nullif(trim(coalesce(new.title, '')), '') is null
       or nullif(trim(coalesce(new.slug, '')), '') is null
       or nullif(trim(coalesce(new.lyrics_amharic, '')), '') is null then
      raise exception 'Title, slug, and Amharic lyrics are required to publish' using errcode = '23514';
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

-- Stable UUID publication identity. No slug lookup is used by the frontend
-- path, so duplicate legacy slugs cannot publish the wrong row.
drop function if exists public.publish_mezmur_import(uuid, text);
create function public.publish_mezmur_import(
  p_import_id uuid,
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
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('editor', 'admin', 'super_admin') then
    raise exception 'An editor, admin, or super admin role is required to publish' using errcode = '42501';
  end if;
  if p_import_id is null then
    raise exception 'Stable Mezmur import_id is required' using errcode = '22023';
  end if;

  select * into strict v_row
  from public.mezmur_data_import
  where import_id = p_import_id and deleted_at is null
  for update;

  if p_expected_updated_at is not null
     and nullif(trim(v_row.updated_at), '') is not null
     and v_row.updated_at is distinct from p_expected_updated_at then
    raise exception 'Conflict: this Mezmur was modified by another editor' using errcode = '40001';
  end if;
  if nullif(trim(coalesce(v_row.title, '')), '') is null
     or nullif(trim(coalesce(v_row.slug, '')), '') is null
     or nullif(trim(coalesce(v_row.lyrics_amharic, '')), '') is null then
    raise exception 'Title, slug, and Amharic lyrics are required to publish' using errcode = '23514';
  end if;

  perform set_config('tewahedo.publication_via_rpc', 'on', true);
  update public.mezmur_data_import
  set status = 'published', updated_at = clock_timestamp()::text
  where import_id = p_import_id;
  perform set_config('tewahedo.publication_via_rpc', 'off', true);

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  values
    (v_row.slug, 'published', v_row.status, 'published', v_row.review_status, v_row.rights_status, v_actor, v_role);

  return jsonb_build_object('import_id', p_import_id, 'slug', v_row.slug, 'status', 'published');
end;
$$;

revoke all on function public.publish_mezmur_import(uuid, text) from public, anon;
grant execute on function public.publish_mezmur_import(uuid, text) to authenticated;

-- Keep the legacy RPC callable for older clients, but make it duplicate-safe
-- and delegate to the same UUID implementation. It never chooses an arbitrary
-- row when a slug is ambiguous.
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
  v_import_id uuid;
  v_count integer;
begin
  select count(*), min(import_id) into v_count, v_import_id
  from public.mezmur_data_import
  where lower(trim(slug)) = lower(trim(p_slug)) and deleted_at is null;
  if v_count <> 1 then
    raise exception 'Expected one Mezmur for slug %, found %', p_slug, v_count using errcode = 'P0002';
  end if;
  return public.publish_mezmur_import(v_import_id, p_expected_updated_at);
end;
$$;

revoke all on function public.publish_mezmur_import(text, text) from public, anon;
grant execute on function public.publish_mezmur_import(text, text) to authenticated;

-- Keep the existing 31-column public view contract. Explicitly restricted
-- records remain media/source-only; unknown metadata is not rewritten and does
-- not block owner-authorized publication.
do $$
declare
  v_columns text[];
  v_expected text[] := array[
    'mezmur_id','slug','title','title_amharic','title_english','description','description_amharic',
    'lyrics_amharic','lyrics_transliteration','lyrics_english','lyrics_geez','lyrics_oromo',
    'primary_language','form','singer_id','singer_slug','singer_name','zemari_id',
    'youtube_url','audio_url','image_path','image_alt','legacy_thumbnail_url','search_keywords',
    'status','review_status','source_url','created_at','updated_at','rights_status','has_stored_lyrics'
  ];
begin
  select array_agg(a.attname order by a.attnum) into v_columns
  from pg_attribute a
  where a.attrelid = 'public.mezmur_public'::regclass
    and a.attnum > 0 and not a.attisdropped;
  if v_columns is distinct from v_expected then
    raise exception 'Refusing to replace mezmur_public: unexpected column contract %', v_columns
      using errcode = '55000';
  end if;
end $$;

create or replace view public.mezmur_public
with (security_barrier = true)
as
select
  mezmur_id, slug, title, title_amharic, title_english, description, description_amharic,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_amharic end as lyrics_amharic,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_transliteration end as lyrics_transliteration,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_english end as lyrics_english,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_geez end as lyrics_geez,
  case when lower(trim(coalesce(rights_status, 'unknown'))) in ('external_only', 'restricted') then null else lyrics_oromo end as lyrics_oromo,
  primary_language, form, singer_id, singer_slug, singer_name, zemari_id,
  youtube_url, audio_url, image_path, image_alt, legacy_thumbnail_url, search_keywords,
  status, review_status, source_url, created_at, updated_at, rights_status,
  (nullif(trim(coalesce(lyrics_amharic, '')), '') is not null
   or nullif(trim(coalesce(lyrics_geez, '')), '') is not null
   or nullif(trim(coalesce(lyrics_english, '')), '') is not null
   or nullif(trim(coalesce(lyrics_oromo, '')), '') is not null
   or nullif(trim(coalesce(lyrics_transliteration, '')), '') is not null) as has_stored_lyrics
from public.mezmur_data_import
where deleted_at is null
  and lower(trim(coalesce(status, ''))) = 'published'
  and nullif(trim(coalesce(title, '')), '') is not null
  and nullif(trim(coalesce(slug, '')), '') is not null;

revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;
notify pgrst, 'reload schema';
commit;
