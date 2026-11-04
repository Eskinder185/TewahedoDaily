-- OBSOLETE - DO NOT APPLY. FOUR-STATE (draft/approved/rejected/published) PROPOSAL.
-- Contradicts verified live evidence: live play_content_items already uses six statuses
-- (draft, review, approved, rejected, published, archived). Applying this CHECK would fail
-- on, or hide, existing review/archived rows. Use 20261102_faith_challenges_live_reconciliation.sql.
-- Kept only as history. The guard below aborts any accidental execution before data changes.
do $$ begin raise exception 'OBSOLETE four-state Faith Challenges proposal; use live_reconciliation.sql'; end $$;

-- REVIEW ONLY. Do not apply without reviewing the live catalog snapshot.
-- Reconciles the existing four-state Faith Challenges workflow:
-- draft -> approved/rejected -> published, with return to draft for edits.
--
-- UNVERIFIED DEPENDENCY: public.is_staff() is the existing authorization
-- boundary. Its implementation and role mapping are not available in this
-- repository, so this migration deliberately preserves that boundary rather
-- than assuming a profiles.role contract.
--
-- The transaction is the rollback boundary. Any failed preflight or statement
-- rolls back all changes. A post-commit rollback is UNVERIFIED because the
-- prior policy expressions and function body are not reproducibly available.
begin;

select pg_advisory_xact_lock(hashtext('faith-challenges-authorization-v3'));

do $$
begin
  if to_regclass('public.play_content_items') is null then
    raise exception 'Required table public.play_content_items is missing';
  end if;
  if to_regprocedure('public.is_staff()') is null then
    raise exception 'Required authorization function public.is_staff() is missing';
  end if;
  if to_regprocedure('public.review_play_content(uuid,text,text)') is null then
    raise exception 'Required function public.review_play_content(uuid,text,text) is missing';
  end if;
  if exists (
    select 1
    from (values
      ('id'), ('question_id'), ('stable_id'), ('game_type'), ('category'),
      ('difficulty'), ('payload'), ('source_references'), ('status'),
      ('review_notes'), ('created_by'), ('reviewed_by'), ('published_by'),
      ('reviewed_at'), ('published_at'), ('updated_at')
    ) required(column_name)
    where not exists (
      select 1
      from pg_attribute a
      where a.attrelid = 'public.play_content_items'::regclass
        and a.attname = required.column_name
        and not a.attisdropped
    )
  ) then
    raise exception 'Required play_content_items column is missing';
  end if;
  if exists (
    select 1
    from public.play_content_items
    where status not in ('draft', 'approved', 'rejected', 'published')
       or status is null
       or (question_id is distinct from stable_id)
       or payload->>'id' is distinct from stable_id
       or (status = 'published' and (
         published_at is null
         or jsonb_typeof(source_references) is distinct from 'array'
         or jsonb_array_length(source_references) = 0
       ))
  ) then
    raise exception 'Existing rows are incompatible with the four-state editorial workflow';
  end if;
end $$;

-- Only known status-domain constraints are replaced. An unrecognized status
-- CHECK aborts the transaction instead of being silently weakened.
alter table public.play_content_items
  drop constraint if exists play_content_items_status_check,
  drop constraint if exists play_content_status_compat,
  drop constraint if exists play_content_status_v2;

do $$
begin
  if exists (
    select 1
    from pg_constraint c
    where c.conrelid = 'public.play_content_items'::regclass
      and c.contype = 'c'
      and pg_get_constraintdef(c.oid) ilike '%status%'
  ) then
    raise exception 'Unrecognized play_content_items status CHECK remains; inspect the catalog snapshot';
  end if;
end $$;

alter table public.play_content_items
  add constraint play_content_status_editorial
  check (status in ('draft', 'approved', 'rejected', 'published')) not valid;
alter table public.play_content_items
  validate constraint play_content_status_editorial;

-- This preserves the existing publication invariant as a named, validated
-- constraint instead of relying only on the review RPC.
alter table public.play_content_items
  drop constraint if exists play_content_published_check,
  drop constraint if exists play_content_published_metadata_compat;
alter table public.play_content_items
  add constraint play_content_published_metadata
  check (
    status <> 'published'
    or (
      published_at is not null
      and jsonb_typeof(source_references) = 'array'
      and jsonb_array_length(source_references) > 0
    )
  ) not valid;
alter table public.play_content_items
  validate constraint play_content_published_metadata;

create or replace function public.guard_play_content_editorial()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
  if tg_op = 'INSERT' then
    if new.status is distinct from 'draft'
       or new.question_id is distinct from new.stable_id
       or new.payload->>'id' is distinct from new.stable_id then
      raise exception 'New questions must be drafts with matching IDs' using errcode = '23514';
    end if;
    new.created_by := auth.uid();
    new.reviewed_by := null;
    new.reviewed_at := null;
    new.published_by := null;
    new.published_at := null;
  else
    if old.question_id is distinct from new.question_id
       or old.stable_id is distinct from new.stable_id
       or new.payload->>'id' is distinct from new.stable_id then
      raise exception 'Question identifiers are immutable' using errcode = '23514';
    end if;
    if old.status is distinct from new.status
       and coalesce(current_setting('tewahedo.play_review_rpc', true), '') <> 'on' then
      raise exception 'Use review_play_content for editorial transitions' using errcode = '42501';
    end if;
    if old.status in ('approved', 'published')
       and (
         old.payload is distinct from new.payload
         or old.game_type is distinct from new.game_type
         or old.category is distinct from new.category
         or old.difficulty is distinct from new.difficulty
         or old.source_references is distinct from new.source_references
       ) then
      raise exception 'Return to draft before editing reviewed content' using errcode = '23514';
    end if;
    if coalesce(current_setting('tewahedo.play_review_rpc', true), '') <> 'on'
       and (
         old.created_by is distinct from new.created_by
         or old.review_notes is distinct from new.review_notes
         or old.reviewed_by is distinct from new.reviewed_by
         or old.reviewed_at is distinct from new.reviewed_at
         or old.published_by is distinct from new.published_by
         or old.published_at is distinct from new.published_at
       ) then
      raise exception 'Editorial audit fields are managed by review_play_content' using errcode = '42501';
    end if;
  end if;
  new.updated_at := now();
  return new;
end
$$;

revoke all on function public.guard_play_content_editorial() from public, anon, authenticated;
drop trigger if exists play_content_editorial_guard on public.play_content_items;
create trigger play_content_editorial_guard
before insert or update on public.play_content_items
for each row execute function public.guard_play_content_editorial();

-- SECURITY INVOKER intentionally keeps table grants and RLS in force.
create or replace function public.review_play_content(
  p_id uuid,
  p_status text,
  p_notes text default null
)
returns public.play_content_items
language plpgsql
security invoker
set search_path = ''
as $$
declare
  current_row public.play_content_items;
  saved public.play_content_items;
begin
  if not coalesce(public.is_staff(), false) then
    raise exception 'Staff role required' using errcode = '42501';
  end if;

  select *
    into current_row
    from public.play_content_items
   where id = p_id
   for update;
  if current_row.id is null then
    raise exception 'Question not found' using errcode = 'P0002';
  end if;

  if not (
    (current_row.status = 'draft' and p_status in ('approved', 'rejected'))
    or (current_row.status = 'approved' and p_status in ('published', 'draft', 'rejected'))
    or (current_row.status = 'rejected' and p_status = 'draft')
    or (current_row.status = 'published' and p_status = 'draft')
  ) then
    raise exception 'Invalid editorial transition' using errcode = '22023';
  end if;

  if p_status = 'published' then
    if current_row.game_type in ('who-am-i', 'match') then
      raise exception 'This game does not yet read published CMS cards' using errcode = '23514';
    end if;
    if jsonb_typeof(current_row.payload) is distinct from 'object'
       or current_row.payload->>'id' is distinct from current_row.stable_id
       or jsonb_typeof(current_row.source_references) is distinct from 'array'
       or jsonb_array_length(current_row.source_references) = 0 then
      raise exception 'A valid sourced question is required for publication' using errcode = '23514';
    end if;
  end if;

  perform set_config('tewahedo.play_review_rpc', 'on', true);
  update public.play_content_items
     set status = p_status,
         review_notes = p_notes,
         reviewed_by = case when p_status in ('approved', 'rejected') then auth.uid() else reviewed_by end,
         reviewed_at = case when p_status in ('approved', 'rejected') then now() else reviewed_at end,
         published_by = case when p_status = 'published' then auth.uid() else published_by end,
         published_at = case when p_status = 'published' then now() else null end
   where id = p_id
   returning * into saved;
  perform set_config('tewahedo.play_review_rpc', 'off', true);
  return saved;
end
$$;

revoke all on function public.review_play_content(uuid, text, text) from public, anon;
grant execute on function public.review_play_content(uuid, text, text) to authenticated;

-- Policies are permissive and therefore OR together. Replacing every existing
-- policy is required to prevent an old broad policy from bypassing this model.
alter table public.play_content_items enable row level security;
revoke all on public.play_content_items from public, anon, authenticated;
grant select on public.play_content_items to anon, authenticated;
grant insert, update on public.play_content_items to authenticated;

do $$
declare policy_row record;
begin
  for policy_row in
    select policyname
      from pg_policies
     where schemaname = 'public'
       and tablename = 'play_content_items'
  loop
    execute format('drop policy %I on public.play_content_items', policy_row.policyname);
  end loop;
end
$$;

create policy play_content_public_read
on public.play_content_items
for select to anon, authenticated
using (status = 'published' and published_at is not null);

create policy play_content_staff_insert
on public.play_content_items
for insert to authenticated
with check (coalesce(public.is_staff(), false) and status = 'draft' and question_id = stable_id);

create policy play_content_staff_update
on public.play_content_items
for update to authenticated
using (coalesce(public.is_staff(), false))
with check (coalesce(public.is_staff(), false));

notify pgrst, 'reload schema';
commit;
