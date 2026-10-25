-- Guarded publication workflow for the active Mezmur source.
-- Source-only: do not apply to production without explicit operator approval.
-- This migration does not approve, publish, unpublish, or rewrite any Mezmur.

begin;

alter table public.mezmur_data_import
  add column if not exists rights_status text not null default 'unknown',
  add column if not exists publication_approved_at timestamptz,
  add column if not exists publication_approved_by uuid references auth.users(id) on delete set null;

do $$ begin
  alter table public.mezmur_data_import
    add constraint mezmur_data_import_rights_status_check
    check (rights_status in (
      'owned', 'licensed', 'authorized_contributor', 'public_domain',
      'display_only', 'external_only', 'unknown'
    ));
exception when duplicate_object then null; end $$;

create table if not exists public.mezmur_publication_events (
  id bigint generated always as identity primary key,
  mezmur_slug text not null,
  event_type text not null check (event_type in ('approved', 'published')),
  previous_status text,
  next_status text,
  review_status text,
  rights_status text,
  actor_id uuid references auth.users(id) on delete set null,
  actor_role text,
  created_at timestamptz not null default clock_timestamp()
);

alter table public.mezmur_publication_events enable row level security;
revoke all on public.mezmur_publication_events from public, anon, authenticated;
grant select on public.mezmur_publication_events to authenticated;
drop policy if exists mezmur_publication_events_staff_read on public.mezmur_publication_events;
create policy mezmur_publication_events_staff_read
  on public.mezmur_publication_events for select to authenticated
  using (coalesce(public.is_staff(), false));

create or replace function public.guard_mezmur_import_publication()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if new.status = 'published'
     and (tg_op = 'INSERT' or old.status is distinct from 'published')
     and coalesce(current_setting('tewahedo.publication_via_rpc', true), '') <> 'on' then
    raise exception 'Use publish_mezmur_import for publication transitions' using errcode = '42501';
  end if;

  if (
    tg_op = 'INSERT'
    and (
      lower(trim(coalesce(new.review_status, ''))) = 'approved'
      or new.publication_approved_at is not null
      or new.publication_approved_by is not null
    )
  ) or (
    tg_op = 'UPDATE'
    and (
      new.review_status is distinct from old.review_status
      or new.rights_status is distinct from old.rights_status
      or new.publication_approved_at is distinct from old.publication_approved_at
      or new.publication_approved_by is distinct from old.publication_approved_by
    )
    and coalesce(current_setting('tewahedo.approval_via_rpc', true), '') <> 'on'
  ) then
    raise exception 'Use approve_mezmur_import for editorial approval and publication rights' using errcode = '42501';
  end if;
  return new;
end;
$$;

revoke all on function public.guard_mezmur_import_publication() from public, anon, authenticated;
drop trigger if exists mezmur_data_import_publication_guard on public.mezmur_data_import;
create trigger mezmur_data_import_publication_guard
before insert or update on public.mezmur_data_import
for each row execute function public.guard_mezmur_import_publication();

create or replace function public.approve_mezmur_import(
  p_slug text,
  p_rights_status text,
  p_review_notes text default null
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_count integer;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('admin', 'super_admin') then
    raise exception 'Admin approval is required' using errcode = '42501';
  end if;
  if p_rights_status not in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only') then
    raise exception 'Verified lyrics publication rights are required' using errcode = '22023';
  end if;
  select count(*) into v_count
  from public.mezmur_data_import
  where lower(trim(slug)) = lower(trim(p_slug));
  if v_count <> 1 then
    raise exception 'Expected one Mezmur for slug %, found %', p_slug, v_count using errcode = 'P0002';
  end if;

  perform set_config('tewahedo.approval_via_rpc', 'on', true);
  update public.mezmur_data_import
  set review_status = 'approved',
      review_notes = coalesce(p_review_notes, review_notes),
      rights_status = p_rights_status,
      publication_approved_at = clock_timestamp(),
      publication_approved_by = v_actor,
      updated_at = clock_timestamp()::text
  where lower(trim(slug)) = lower(trim(p_slug));

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  select slug, 'approved', status, status, review_status, rights_status, v_actor, v_role
  from public.mezmur_data_import where lower(trim(slug)) = lower(trim(p_slug));
  return jsonb_build_object('slug', trim(p_slug), 'review_status', 'approved', 'rights_status', p_rights_status);
end;
$$;

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
  v_count integer;
begin
  select role::text into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('editor', 'admin', 'super_admin') then
    raise exception 'An editor, admin, or super admin role is required' using errcode = '42501';
  end if;
  select count(*) into v_count
  from public.mezmur_data_import where lower(trim(slug)) = lower(trim(p_slug));
  if v_count <> 1 then
    raise exception 'Expected one Mezmur for slug %, found %', p_slug, v_count using errcode = 'P0002';
  end if;
  select * into v_row from public.mezmur_data_import
  where lower(trim(slug)) = lower(trim(p_slug)) for update;

  if p_expected_updated_at is not null and v_row.updated_at is distinct from p_expected_updated_at then
    raise exception 'This Mezmur changed after it was saved. Reload before publishing.' using errcode = '40001';
  end if;
  if lower(trim(coalesce(v_row.review_status, ''))) <> 'approved' then
    raise exception 'Editorial approval is required (review_status must be approved)' using errcode = '23514';
  end if;
  if v_row.rights_status not in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
     or v_row.publication_approved_at is null or v_row.publication_approved_by is null then
    raise exception 'Verified lyrics publication rights and recorded approval are required' using errcode = '23514';
  end if;
  if nullif(trim(v_row.title), '') is null or nullif(trim(v_row.slug), '') is null
     or nullif(trim(v_row.lyrics_amharic), '') is null then
    raise exception 'Title, slug, and Amharic lyrics are required' using errcode = '23514';
  end if;

  perform set_config('tewahedo.publication_via_rpc', 'on', true);
  update public.mezmur_data_import
  set status = 'published', updated_at = clock_timestamp()::text
  where lower(trim(slug)) = lower(trim(p_slug));

  insert into public.mezmur_publication_events
    (mezmur_slug, event_type, previous_status, next_status, review_status, rights_status, actor_id, actor_role)
  values (v_row.slug, 'published', v_row.status, 'published', v_row.review_status, v_row.rights_status, v_actor, v_role);
  return jsonb_build_object('slug', v_row.slug, 'status', 'published');
end;
$$;

revoke all on function public.approve_mezmur_import(text, text, text) from public, anon;
revoke all on function public.publish_mezmur_import(text, text) from public, anon;
grant execute on function public.approve_mezmur_import(text, text, text) to authenticated;
grant execute on function public.publish_mezmur_import(text, text) to authenticated;

notify pgrst, 'reload schema';
commit;
