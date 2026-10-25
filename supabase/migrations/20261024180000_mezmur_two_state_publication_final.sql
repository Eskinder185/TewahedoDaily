-- Final two-state Mezmur publication workflow: Draft / Published.
--
-- Forward-only and safe to apply after the older approval-gated workflow.
-- This migration does not update, publish, unpublish, or delete any Mezmur row.
-- It does not infer or change rights_status, publication_approved_at, or
-- publication_approved_by. Unknown/unverified lyrics remain private.

begin;

-- Direct writes may save drafts, but only the protected RPC may transition a
-- record to Published. Legacy review metadata is retained as history and is not
-- part of publication eligibility.
create or replace function public.guard_mezmur_import_publication()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  v_publication_rpc boolean :=
    coalesce(current_setting('tewahedo.publication_via_rpc', true), '') = 'on';
  v_rights_rpc boolean :=
    coalesce(current_setting('tewahedo.approval_via_rpc', true), '') = 'on';
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

  -- Ordinary Save must never fabricate a rights basis or overwrite the retained
  -- rights/review audit fields. Existing dedicated rights tooling may continue
  -- to use tewahedo.approval_via_rpc.
  if not v_rights_rpc then
    if tg_op = 'INSERT' then
      new.rights_status := coalesce(nullif(trim(new.rights_status), ''), 'unknown');
      if new.rights_status not in ('unknown', 'external_only')
         or new.publication_approved_at is not null
         or new.publication_approved_by is not null then
        raise exception 'Lyrics rights metadata can only be changed through the protected rights-verification workflow'
          using errcode = '42501';
      end if;
    elsif new.review_status is distinct from old.review_status
       or new.rights_status is distinct from old.rights_status
       or new.publication_approved_at is distinct from old.publication_approved_at
       or new.publication_approved_by is distinct from old.publication_approved_by then
      raise exception 'Review history and lyrics rights metadata cannot be changed through ordinary Save'
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

-- Remove every historical overload so PostgREST resolves exactly this function.
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
  v_row_tid tid;
  v_count integer;
  v_lyrics_allowed boolean;
  v_has_external_destination boolean;
begin
  select role::text into v_role
  from public.profiles
  where id = v_actor;

  if v_actor is null or v_role is null or v_role not in ('editor', 'admin', 'super_admin') then
    raise exception 'An editor, admin, or super admin role is required' using errcode = '42501';
  end if;

  select count(*) into v_count
  from public.mezmur_data_import
  where lower(trim(slug)) = lower(trim(p_slug));
  if v_count <> 1 then
    raise exception 'Expected one Mezmur for slug %, found %', p_slug, v_count using errcode = 'P0002';
  end if;

  select m.ctid into v_row_tid
  from public.mezmur_data_import m
  where lower(trim(slug)) = lower(trim(p_slug))
  for update;

  select m.* into v_row
  from public.mezmur_data_import m
  where m.ctid = v_row_tid;

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

-- Public clients read this projection, never the import table. Validate the
-- existing view contract before rebuilding it: PostgreSQL cannot remove view
-- columns with CREATE OR REPLACE VIEW. The guarded DROP is RESTRICT (the
-- default), so an unexpected contract or dependent object aborts the entire
-- transaction without changing production data.
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
    if v_columns is distinct from v_expected then
      raise exception 'Refusing to replace public.mezmur_public: unexpected column contract %', v_columns
        using errcode = '55000',
              hint = 'Review the current view definition and dependent objects before applying this migration.';
    end if;
    if exists (
      select 1
      from pg_attribute v
      join pg_attribute b
        on b.attrelid = 'public.mezmur_data_import'::regclass
       and b.attname = v.attname and b.attnum > 0 and not b.attisdropped
      where v.attrelid = 'public.mezmur_public'::regclass
        and v.attnum > 0 and not v.attisdropped
        and (v.atttypid, v.atttypmod) is distinct from (b.atttypid, b.atttypmod)
    ) then
      raise exception 'Refusing to replace public.mezmur_public: retained column types differ from mezmur_data_import'
        using errcode = '55000',
              hint = 'Review the current view column types before applying this migration.';
    end if;
  end if;
end $$;

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
  rights_status
from public.mezmur_data_import
where deleted_at is null
  and lower(trim(coalesce(status, ''))) = 'published'
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
  );

revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;

-- Close the historical unrestricted base-table SELECT policy. Staff retain
-- access for administration; anonymous and ordinary authenticated users use the
-- public projection and cannot read drafts or protected lyrics.
alter table public.mezmur_data_import enable row level security;
revoke all on public.mezmur_data_import from anon;
grant select, insert, update on public.mezmur_data_import to authenticated;

drop policy if exists mezmur_data_import_public_read on public.mezmur_data_import;
drop policy if exists mezmur_data_import_staff_read on public.mezmur_data_import;
create policy mezmur_data_import_staff_read
  on public.mezmur_data_import for select to authenticated
  using (coalesce(public.is_staff(), false));

drop policy if exists mezmur_data_import_staff_insert on public.mezmur_data_import;
create policy mezmur_data_import_staff_insert
  on public.mezmur_data_import for insert to authenticated
  with check (coalesce(public.is_staff(), false));

drop policy if exists mezmur_data_import_staff_update on public.mezmur_data_import;
create policy mezmur_data_import_staff_update
  on public.mezmur_data_import for update to authenticated
  using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

notify pgrst, 'reload schema';
commit;
