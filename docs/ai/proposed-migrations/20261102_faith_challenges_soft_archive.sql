-- SUPERSEDED by 20261102_faith_challenges_live_reconciliation.sql. The verified
-- live status CHECK already supports 'archived'; no archived_at column is needed.
-- PROPOSAL ONLY. Do not apply before inspecting the live table, triggers, policies,
-- grants, and review_play_content function. Requires the compatibility migration's
-- editorial guard or equivalent staff-only status enforcement.
begin;

alter table public.play_content_items
  add column if not exists archived_at timestamptz,
  add column if not exists archived_by uuid references auth.users(id) on delete set null;

create index if not exists play_content_staff_archive_idx
  on public.play_content_items(archived_at, updated_at);

-- Archived rows must remain drafts even if another editorial RPC is called later.
create or replace function public.guard_archived_play_content()
returns trigger language plpgsql set search_path='' as $$
begin
  if new.archived_at is not null and new.status <> 'draft' then
    raise exception 'Restore an archived question before review' using errcode='23514';
  end if;
  return new;
end $$;
revoke all on function public.guard_archived_play_content() from public, anon, authenticated;
drop trigger if exists play_content_archive_guard on public.play_content_items;
create trigger play_content_archive_guard before insert or update on public.play_content_items
  for each row execute function public.guard_archived_play_content();

create or replace function public.set_play_content_archived(p_id uuid, p_archive boolean)
returns public.play_content_items language plpgsql security invoker set search_path='' as $$
declare current_row public.play_content_items; saved public.play_content_items;
begin
  if not coalesce(public.is_staff(), false) then
    raise exception 'Staff role required' using errcode='42501';
  end if;
  if p_archive is null then raise exception 'Archive choice is required' using errcode='22023'; end if;
  select * into current_row from public.play_content_items where id=p_id for update;
  if current_row.id is null then raise exception 'Question not found' using errcode='P0002'; end if;
  perform set_config('tewahedo.play_review_rpc', 'on', true);
  update public.play_content_items
    set status='draft', published_at=null,
        archived_at=case when p_archive then coalesce(archived_at, now()) else null end,
        archived_by=case when p_archive then coalesce(archived_by, auth.uid()) else null end
    where id=p_id returning * into saved;
  perform set_config('tewahedo.play_review_rpc', 'off', true);
  return saved;
end $$;
revoke all on function public.set_play_content_archived(uuid,boolean) from public, anon;
grant execute on function public.set_play_content_archived(uuid,boolean) to authenticated;

-- Preserve staff visibility while excluding archived rows from public reads.
drop policy if exists play_content_public_read on public.play_content_items;
create policy play_content_public_read on public.play_content_items for select to anon, authenticated
  using ((status='published' and archived_at is null) or coalesce(public.is_staff(), false));

notify pgrst, 'reload schema';
commit;
