-- Optional regular-user accounts: role=user, auto profile on signup.
-- Safe to re-run. Does not grant CMS/staff rights to regular users.

begin;

-- ---------------------------------------------------------------------------
-- Extend cms_role with 'user' (regular visitor account)
-- ---------------------------------------------------------------------------
do $$
begin
  if not exists (
    select 1
    from pg_enum e
    join pg_type t on t.oid = e.enumtypid
    join pg_namespace n on n.oid = t.typnamespace
    where n.nspname = 'public'
      and t.typname = 'cms_role'
      and e.enumlabel = 'user'
  ) then
    alter type public.cms_role add value 'user';
  end if;
end $$;

-- ---------------------------------------------------------------------------
-- Auto-create profile for every new auth user (role = user only)
-- ---------------------------------------------------------------------------
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  preferred_name text;
begin
  preferred_name := nullif(trim(coalesce(new.raw_user_meta_data->>'display_name', '')), '');
  if preferred_name is null then
    preferred_name := split_part(coalesce(new.email, 'friend'), '@', 1);
  end if;

  insert into public.profiles (id, email, display_name, role)
  values (new.id, new.email, preferred_name, 'user'::public.cms_role)
  on conflict (id) do update
    set email = excluded.email,
        display_name = case
          when nullif(trim(public.profiles.display_name), '') is null then excluded.display_name
          else public.profiles.display_name
        end;
        -- Never overwrite an existing staff/CMS role from signup metadata.
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

revoke all on function public.handle_new_user() from public, anon, authenticated;
grant execute on function public.handle_new_user() to service_role;

-- Idempotent ensure for users who signed up before the trigger existed.
create or replace function public.ensure_user_profile()
returns public.profiles
language plpgsql
security definer
set search_path = public
as $$
declare
  uid uuid := auth.uid();
  row public.profiles;
  preferred_name text;
begin
  if uid is null then
    raise exception 'Not authenticated' using errcode = '42501';
  end if;

  select * into row from public.profiles where id = uid;
  if found then
    return row;
  end if;

  select
    nullif(trim(coalesce(u.raw_user_meta_data->>'display_name', '')), ''),
    u.email
  into preferred_name
  from auth.users u
  where u.id = uid;

  if preferred_name is null then
    preferred_name := split_part(coalesce((select email from auth.users where id = uid), 'friend'), '@', 1);
  end if;

  insert into public.profiles (id, email, display_name, role)
  select u.id, u.email, preferred_name, 'user'::public.cms_role
  from auth.users u
  where u.id = uid
  on conflict (id) do update
    set email = excluded.email
  returning * into row;

  return row;
end;
$$;

revoke all on function public.ensure_user_profile() from public, anon;
grant execute on function public.ensure_user_profile() to authenticated;

-- Convenience role helper used by the app (mirrors cms_private.current_role).
create or replace function public.current_user_role()
returns public.cms_role
language sql
stable
security definer
set search_path = public
as $$
  select role from public.profiles where id = auth.uid()
$$;

revoke all on function public.current_user_role() from public;
grant execute on function public.current_user_role() to anon, authenticated;

-- Keep is_staff() staff-only (editor / admin / super_admin). 'user' is never staff.
create or replace function public.is_staff()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select coalesce(
    (select role in ('editor', 'admin', 'super_admin')
     from public.profiles
     where id = auth.uid()),
    false
  );
$$;

revoke all on function public.is_staff() from public;
grant execute on function public.is_staff() to authenticated, anon;

-- Profiles: authenticated users may always read/update their own row (including role=user).
drop policy if exists profiles_read on public.profiles;
create policy profiles_read on public.profiles
  for select to authenticated
  using (
    id = auth.uid()
    or cms_private.current_role() = 'super_admin'
    or (
      cms_private.current_role() = 'admin'
      and (role is null or role in ('user', 'contributor', 'editor'))
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
      and (role is null or role in ('user', 'contributor', 'editor'))
    )
  )
  with check (
    id = auth.uid()
    or cms_private.current_role() = 'super_admin'
    or (
      cms_private.current_role() = 'admin'
      and (role is null or role in ('user', 'contributor', 'editor'))
    )
  );

-- Prevent clients from elevating their own role via UPDATE.
create or replace function public.profiles_guard_role_change()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if new.role is distinct from old.role then
    if cms_private.current_role() is distinct from 'super_admin'
       and cms_private.current_role() is distinct from 'admin' then
      -- Regular users / contributors cannot change roles (including self).
      new.role := old.role;
    end if;
  end if;
  return new;
end;
$$;

drop trigger if exists profiles_guard_role on public.profiles;
create trigger profiles_guard_role
  before update on public.profiles
  for each row execute function public.profiles_guard_role_change();

-- Backfill: any auth user without a profile gets role=user.
insert into public.profiles (id, email, display_name, role)
select
  u.id,
  u.email,
  coalesce(
    nullif(trim(u.raw_user_meta_data->>'display_name'), ''),
    split_part(coalesce(u.email, 'friend'), '@', 1)
  ),
  'user'::public.cms_role
from auth.users u
where not exists (select 1 from public.profiles p where p.id = u.id)
on conflict (id) do nothing;

notify pgrst, 'reload schema';

commit;
