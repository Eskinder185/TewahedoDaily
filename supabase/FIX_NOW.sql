-- PASTE THIS ENTIRE SCRIPT into Supabase Dashboard → SQL Editor → Run
-- Project: tgvhpibzzkqxkcumrivh
-- Fixes:
--   1) profiles HTTP 403 after CMS login
--   2) missing public.submit_community_submission (404 / schema cache)
-- Then bootstraps your first super_admin if needed.
-- Safe to re-run. Does not delete content.

begin;

-- ---------------------------------------------------------------------------
-- A) Profiles access (CMS login)
-- ---------------------------------------------------------------------------
grant usage on schema public to anon, authenticated;
grant select on public.profiles to authenticated;
grant update (display_name, avatar_url) on public.profiles to authenticated;

create or replace function cms_private.current_role()
returns public.cms_role
language sql
stable
security definer
set search_path = ''
as $$
  select role from public.profiles where id = auth.uid()
$$;
revoke all on function cms_private.current_role() from public;
grant execute on function cms_private.current_role() to anon, authenticated;

drop policy if exists profiles_read on public.profiles;
create policy profiles_read on public.profiles
for select to authenticated
using (
  id = auth.uid()
  or cms_private.current_role() = 'super_admin'
  or (
    cms_private.current_role() = 'admin'
    and (role is null or role in ('contributor', 'editor'))
  )
);

drop policy if exists profiles_edit on public.profiles;
create policy profiles_edit on public.profiles
for update to authenticated
using (
  id = auth.uid()
  or cms_private.current_role() = 'super_admin'
  or (
    cms_private.current_role() = 'admin'
    and (role is null or role in ('contributor', 'editor'))
  )
)
with check (
  id = auth.uid()
  or cms_private.current_role() = 'super_admin'
  or (
    cms_private.current_role() = 'admin'
    and (role is null or role in ('contributor', 'editor'))
  )
);

do $$
declare t text;
begin
  foreach t in array array['mezmur','saints','feasts','prayers','articles','categories','singers','tags','mezmur_tags'] loop
    if to_regclass(format('public.%I', t)) is not null then
      execute format('grant select on public.%I to anon', t);
      execute format('grant select on public.%I to authenticated', t);
    end if;
  end loop;
end $$;

create or replace function public.bootstrap_first_super_admin(target_user_id uuid)
returns void
language plpgsql
security definer
set search_path = ''
as $$
begin
  if exists (select 1 from public.profiles where role is not null) then
    raise exception 'CMS members already exist. Use set_cms_member instead.' using errcode = '42501';
  end if;
  if not exists (select 1 from auth.users where id = target_user_id) then
    raise exception 'Auth user not found' using errcode = '22023';
  end if;
  insert into public.profiles (id, email, role, display_name)
  select u.id, u.email, 'super_admin'::public.cms_role, coalesce(u.raw_user_meta_data->>'full_name', '')
  from auth.users u
  where u.id = target_user_id
  on conflict (id) do update
    set role = 'super_admin',
        email = excluded.email,
        updated_at = clock_timestamp();
end;
$$;
revoke all on function public.bootstrap_first_super_admin(uuid) from public, anon, authenticated;

-- ---------------------------------------------------------------------------
-- B) Browser community submissions RPC
-- ---------------------------------------------------------------------------
-- Table already exists on this project; only the RPC was missing.
create or replace function public.submit_community_submission(payload jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  saved public.community_submissions;
  submission_kind public.submission_type;
  tags text[];
begin
  if nullif(trim(coalesce(payload->>'website', '')), '') is not null then
    return jsonb_build_object('reference', 'TD-' || extract(year from now())::text || '-00000');
  end if;

  submission_kind := (payload->>'submission_type')::public.submission_type;
  if submission_kind is distinct from 'mezmur' and submission_kind is distinct from 'correction' then
    raise exception 'This form accepts Mezmur and correction submissions.' using errcode = '22023';
  end if;

  tags := coalesce(
    array(select jsonb_array_elements_text(coalesce(payload->'suggested_tags', '[]'::jsonb))),
    '{}'::text[]
  );

  insert into public.community_submissions (
    submission_type, title, title_amharic, singer_name, youtube_url,
    lyrics_amharic, lyrics_english, lyrics_oromo, transliteration,
    suggested_category, suggested_tags, contributor_name, contributor_email,
    credit_requested, source_notes, source_reference, related_content_id,
    related_legacy_key, related_content_title, current_page_url,
    correction_type, suggested_correction, explanation, status
  ) values (
    submission_kind,
    payload->>'title',
    coalesce(payload->>'title_amharic', ''),
    coalesce(payload->>'singer_name', ''),
    coalesce(payload->>'youtube_url', ''),
    coalesce(payload->>'lyrics_amharic', ''),
    coalesce(payload->>'lyrics_english', ''),
    coalesce(payload->>'lyrics_oromo', ''),
    coalesce(payload->>'transliteration', ''),
    coalesce(payload->>'suggested_category', ''),
    tags,
    payload->>'contributor_name',
    coalesce(payload->>'contributor_email', ''),
    coalesce((payload->>'credit_requested')::boolean, false),
    coalesce(payload->>'source_notes', ''),
    coalesce(payload->>'source_reference', ''),
    nullif(payload->>'related_content_id', '')::uuid,
    nullif(payload->>'related_legacy_key', ''),
    nullif(payload->>'related_content_title', ''),
    nullif(payload->>'current_page_url', ''),
    nullif(payload->>'correction_type', ''),
    coalesce(payload->>'suggested_correction', ''),
    coalesce(payload->>'explanation', ''),
    'submitted'
  )
  returning * into saved;

  return jsonb_build_object('reference', saved.public_reference);
exception
  when check_violation then
    raise exception 'Please check your submission and try again.' using errcode = '23514';
  when foreign_key_violation then
    raise exception 'Related content was not found. Open the form from a Mezmur page.' using errcode = '23503';
  when invalid_text_representation then
    raise exception 'Invalid submission data.' using errcode = '22P02';
end;
$$;

revoke all on function public.submit_community_submission(jsonb) from public;
grant execute on function public.submit_community_submission(jsonb) to anon, authenticated;

-- Keep staff read path intact if policy is missing.
do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public'
      and tablename = 'community_submissions'
      and policyname = 'staff_read_submissions'
  ) then
    create policy staff_read_submissions on public.community_submissions
      for select to authenticated
      using (cms_private.current_role() in ('editor', 'admin', 'super_admin'));
  end if;
end $$;

grant select on public.community_submissions to authenticated;

commit;

-- Reload PostgREST schema cache so the new RPC appears immediately.
notify pgrst, 'reload schema';

-- ---------------------------------------------------------------------------
-- C) Make your signed-in user the first super_admin (from the 403 URL)
-- If this errors with "CMS members already exist", you already have staff —
-- then instead: update public.profiles set role = 'super_admin' where id = '...';
-- ---------------------------------------------------------------------------
select public.bootstrap_first_super_admin('13e51015-0143-4661-b4ba-fc764530b7f3');
