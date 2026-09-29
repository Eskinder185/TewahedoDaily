-- Repair: browser CMS login was getting HTTP 403 on public.profiles because
-- table privileges / policies were incomplete on the live project.
-- Also restores anon SELECT grants expected by public content RLS.
-- Re-runnable. Does not delete data.

begin;

-- Own-profile reads must succeed for every signed-in Auth user (CMS or not).
grant usage on schema public to anon, authenticated;
grant select on public.profiles to authenticated;
grant update (display_name, avatar_url) on public.profiles to authenticated;

-- Keep current_role SECURITY DEFINER so policy checks do not recurse on profiles.
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

-- Public catalog tables: anon must have SELECT; RLS still hides drafts.
do $$
declare
  t text;
begin
  foreach t in array array['mezmur', 'saints', 'feasts', 'prayers', 'articles', 'categories', 'singers', 'tags', 'mezmur_tags'] loop
    if to_regclass(format('public.%I', t)) is not null then
      execute format('grant select on public.%I to anon', t);
      execute format('grant select on public.%I to authenticated', t);
    end if;
  end loop;
end $$;

-- Trusted bootstrap: first CMS member when none exist yet.
-- Call from SQL editor as a privileged role after creating the Auth user:
--   select public.bootstrap_first_super_admin('13e51015-0143-4661-b4ba-fc764530b7f3');
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
-- Executable only by service_role / postgres (SQL editor), not the browser.

commit;
