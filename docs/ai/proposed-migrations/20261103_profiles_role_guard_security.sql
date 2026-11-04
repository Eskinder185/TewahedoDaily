-- UNAPPLIED PROPOSAL. Review live enum, trigger/function definitions and effective
-- profile policies before approval. No rows are rewritten. SECURITY DEFINER is
-- retained for the existing trigger's privileged role lookup.
begin;
-- Table and column grants compose: revoke both the broad and sensitive-column
-- paths, then restore only ordinary profile editing. set_cms_member is DEFINER
-- and retains its existing authorization/advisory-lock boundary.
revoke insert,update,delete on public.profiles from public,anon,authenticated;
revoke update (id,email,role) on public.profiles from public,anon,authenticated;
grant update (display_name,avatar_url) on public.profiles to authenticated;
create or replace function public.profiles_guard_role_change()
returns trigger language plpgsql security definer set search_path='' as $$
declare actor_role text;
begin
  if new.id is distinct from old.id then
    raise exception 'Profile identity is immutable' using errcode='42501';
  end if;
  if new.role is distinct from old.role then
    -- Same lock as set_cms_member; concurrent last-super-admin changes serialize.
    perform pg_advisory_xact_lock(724601);
    actor_role:=public.current_user_role()::text;
    if actor_role='super_admin' then
      if old.role::text='super_admin' and
         (select count(*) from public.profiles where role::text='super_admin')<=1 then
        raise exception 'Cannot remove the last super admin' using errcode='42501';
      end if;
      return new;
    end if;
    if actor_role='admin' and old.id<>auth.uid() and
       coalesce(old.role::text,'user') in ('user','contributor','editor') and
       coalesce(new.role::text,'user') in ('user','contributor','editor') then return new; end if;
    raise exception 'Role change is not authorized' using errcode='42501';
  end if;
  return new;
end $$;
revoke all on function public.profiles_guard_role_change() from public,anon,authenticated;
drop trigger if exists profiles_guard_role on public.profiles;
create trigger profiles_guard_role before update on public.profiles
  for each row execute function public.profiles_guard_role_change();
-- Do not grant INSERT or role UPDATE to clients. Signup and ensure_user_profile
-- already insert role=user without trusting raw_user_meta_data.role.
-- Test editor self-promotion, admin self-promotion, admin -> super_admin, and
-- cross-user IDOR with real JWT sessions in staging; all must fail.
-- Roll back before commit with ROLLBACK; post-commit restore the saved original
-- function definition only after a separate risk review.
commit;
