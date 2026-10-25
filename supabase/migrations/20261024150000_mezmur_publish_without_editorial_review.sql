-- Mezmur CMS: two user-facing statuses (draft / published) without a separate
-- editorial-review step.
--
-- Forward-only. Supersedes the publication rules in:
--   20261024120000_mezmur_import_publication_workflow.sql  (review_status = 'approved' gate)
--   20261024130000_zemari_import_validation_and_safe_public_mezmur.sql (approval-based public view)
--
-- This is the only forward migration for the simplified workflow.
-- This migration does NOT update, publish, unpublish, or delete any Mezmur row,
-- does NOT change review_status / rights_status on existing rows, and does NOT
-- disable RLS. Do not apply to production without explicit operator approval.
--
-- What changes:
--   * publish_mezmur_import() no longer requires review_status = 'approved' or a
--     prior approve_mezmur_import() call.
--   * Publishing still requires: authenticated editor/admin/super_admin, non-empty
--     title + slug + Amharic lyrics, and a VERIFIED lyrics rights basis.
--   * Rights remain internal protected metadata. The normal Publish action cannot
--     change or fabricate them. 'unknown' is never treated as verified and
--     'external_only' can never be published for on-site display.

begin;

-- ---------------------------------------------------------------------------
-- 1. Guard trigger: only draft/published; publication + rights changes only via RPC.
-- ---------------------------------------------------------------------------
create or replace function public.guard_mezmur_import_publication()
returns trigger
language plpgsql
set search_path = ''
as $$
declare
  v_via_rpc boolean :=
    coalesce(current_setting('tewahedo.publication_via_rpc', true), '') = 'on'
    or coalesce(current_setting('tewahedo.approval_via_rpc', true), '') = 'on';
begin
  new.status := lower(trim(coalesce(new.status, 'draft')));

  -- Existing rows may still carry legacy statuses (e.g. pending_review). They are
  -- left untouched by this migration; any new write must use draft or published.
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

  return new;
end;
$$;

revoke all on function public.guard_mezmur_import_publication() from public, anon, authenticated;
drop trigger if exists mezmur_data_import_publication_guard on public.mezmur_data_import;
create trigger mezmur_data_import_publication_guard
before insert or update on public.mezmur_data_import
for each row execute function public.guard_mezmur_import_publication();

-- ---------------------------------------------------------------------------
-- 2. Publication RPC without the editorial review_status requirement.
--    Replaces the 2-argument version so PostgREST has exactly one candidate.
-- ---------------------------------------------------------------------------
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

  if coalesce(v_row.rights_status, 'unknown') = 'external_only' then
    raise exception 'Lyrics marked external_only cannot be published for on-site display' using errcode = '23514';
  end if;

  if coalesce(v_row.rights_status, 'unknown') not in
     ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only') then
    raise exception 'Publication rights are unresolved; this Mezmur is not eligible for public lyrics display'
      using errcode = '23514';
  end if;

  if v_row.publication_approved_at is null or v_row.publication_approved_by is null then
    raise exception 'Publication rights verification is not recorded for this Mezmur'
      using errcode = '23514';
  end if;

  perform set_config('tewahedo.publication_via_rpc', 'on', true);
  update public.mezmur_data_import
  set status = 'published',
      updated_at = clock_timestamp()::text
  where mezmur_id = v_row.mezmur_id;
  perform set_config('tewahedo.publication_via_rpc', 'off', true);

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  values
    (v_row.slug, 'published', v_row.status, 'published', v_row.review_status, v_row.rights_status, v_actor, v_role);

  return jsonb_build_object('slug', v_row.slug, 'status', 'published', 'rights_status', v_row.rights_status);
end;
$$;

revoke all on function public.publish_mezmur_import(text, text) from public, anon;
grant execute on function public.publish_mezmur_import(text, text) to authenticated;

-- ---------------------------------------------------------------------------
-- 3. Public projection: published + complete + verified rights basis.
--    No longer requires review_status = 'approved'.
-- ---------------------------------------------------------------------------
-- create or replace (not drop) so any dependent policies remain valid; the column
-- list is identical to the view created in 20261024130000.
create or replace view public.mezmur_public
with (security_barrier = true)
as
select
  mezmur_id, slug, title, title_amharic, title_english, description, description_amharic,
  lyrics_amharic, lyrics_transliteration, lyrics_english, lyrics_geez, lyrics_oromo,
  primary_language, form, singer_id, singer_slug, singer_name, zemari_id,
  youtube_url, audio_url, image_path, image_alt, legacy_thumbnail_url, search_keywords,
  status, review_status, source_url, created_at, updated_at, structured_lyrics, lyrics_language,
  source_info, rights_status, external_lyrics_url, last_verified_at, related_content
from public.mezmur_data_import
where lower(trim(coalesce(status, ''))) = 'published'
  and nullif(trim(coalesce(title, '')), '') is not null
  and nullif(trim(coalesce(slug, '')), '') is not null
  and nullif(trim(coalesce(lyrics_amharic, '')), '') is not null
  and rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
  and publication_approved_at is not null
  and publication_approved_by is not null;

revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;

-- ---------------------------------------------------------------------------
-- 4. RLS stays enabled. Staff (is_staff()) may read/insert/update; anon may not
--    touch the base table at all.
-- ---------------------------------------------------------------------------
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
