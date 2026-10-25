-- Final forward-only repair for Hymns Trash / Restore / Permanent Delete.
-- Safe when the metadata columns already exist and when the older Trash
-- migrations were skipped. This migration does not move or delete content.

begin;

-- Production already has these columns. IF NOT EXISTS only covers projects
-- where the older Trash migration was skipped.
alter table public.mezmur_data_import
  add column if not exists deleted_at timestamptz,
  add column if not exists deleted_by uuid references auth.users(id) on delete set null,
  add column if not exists deleted_from_status text;
alter table public.zemaris
  add column if not exists deleted_at timestamptz,
  add column if not exists deleted_by uuid references auth.users(id) on delete set null,
  add column if not exists deleted_from_status text;
alter table public.mezmur_collections_import
  add column if not exists deleted_at timestamptz,
  add column if not exists deleted_by uuid references auth.users(id) on delete set null,
  add column if not exists deleted_from_status text;
alter table public.mezmur_sections_import
  add column if not exists deleted_at timestamptz,
  add column if not exists deleted_by uuid references auth.users(id) on delete set null,
  add column if not exists deleted_from_status text;

-- The legacy import tables have nullable/non-unique text identifiers and no
-- primary key in the production-shaped schema. Install one internal UUID key
-- consistently. PostgreSQL evaluates this volatile default once per existing
-- row while adding a missing column; it does not issue a row-level UPDATE and
-- therefore does not invoke content publication triggers.
alter table public.mezmur_data_import
  add column if not exists import_id uuid default gen_random_uuid();
alter table public.mezmur_collections_import
  add column if not exists import_id uuid default gen_random_uuid();
alter table public.mezmur_sections_import
  add column if not exists import_id uuid default gen_random_uuid();

-- Fail clearly if an unrelated column with this name exists with the wrong
-- type. Do this before any data update.
do $$
declare v_table text;
begin
  foreach v_table in array array[
    'mezmur_data_import', 'mezmur_collections_import', 'mezmur_sections_import'
  ] loop
    if not exists (
      select 1 from information_schema.columns
      where table_schema = 'public' and table_name = v_table
        and column_name = 'import_id' and data_type = 'uuid'
    ) then
      raise exception 'public.%.import_id exists with an incompatible type; expected uuid', v_table
        using errcode = '55000';
    end if;
  end loop;
end $$;

-- The currently deployed publication guard revalidates every UPDATE to an
-- already-published row. That makes unrelated metadata maintenance fail for
-- historical rows which predate today's publication requirements. Preserve
-- all publication and rights protections, but run eligibility validation only
-- for INSERT, a transition into Published, or a publication-relevant edit.
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
  v_validate_publication boolean;
begin
  -- Do not normalize or otherwise rewrite a historical status during an
  -- unrelated metadata update. Normalize only a new/changed status value.
  if tg_op = 'INSERT' or new.status is distinct from old.status then
    new.status := lower(trim(coalesce(new.status, 'draft')));
    if new.status not in ('draft', 'published') then
      raise exception 'Mezmur status must be draft or published' using errcode = '23514';
    end if;
  end if;

  if lower(trim(coalesce(new.status, ''))) = 'published'
     and (tg_op = 'INSERT' or lower(trim(coalesce(old.status, ''))) is distinct from 'published')
     and not v_publication_rpc then
    raise exception 'Use publish_mezmur_import for publication transitions' using errcode = '42501';
  end if;

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

  v_validate_publication := lower(trim(coalesce(new.status, ''))) = 'published' and (
    tg_op = 'INSERT'
    or lower(trim(coalesce(old.status, ''))) is distinct from 'published'
    or new.title is distinct from old.title
    or new.slug is distinct from old.slug
    or new.lyrics_amharic is distinct from old.lyrics_amharic
    or new.rights_status is distinct from old.rights_status
    or new.publication_approved_at is distinct from old.publication_approved_at
    or new.publication_approved_by is distinct from old.publication_approved_by
    or new.youtube_url is distinct from old.youtube_url
    or new.source_url is distinct from old.source_url
  );

  if v_validate_publication then
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

lock table public.mezmur_data_import in share row exclusive mode;
lock table public.mezmur_collections_import in share row exclusive mode;
lock table public.mezmur_sections_import in share row exclusive mode;

-- Recovery path for a partially installed UUID column. The narrowed guard
-- intentionally ignores import_id-only changes while continuing to validate
-- publication transitions and relevant content/rights edits.
update public.mezmur_data_import
set import_id = gen_random_uuid()
where import_id is null;
update public.mezmur_collections_import
set import_id = gen_random_uuid()
where import_id is null;
update public.mezmur_sections_import
set import_id = gen_random_uuid()
where import_id is null;

alter table public.mezmur_data_import
  alter column import_id set default gen_random_uuid(),
  alter column import_id set not null;
alter table public.mezmur_collections_import
  alter column import_id set default gen_random_uuid(),
  alter column import_id set not null;
alter table public.mezmur_sections_import
  alter column import_id set default gen_random_uuid(),
  alter column import_id set not null;

create index if not exists mezmur_data_import_deleted_at_idx
  on public.mezmur_data_import (deleted_at) where deleted_at is not null;
create index if not exists zemaris_deleted_at_idx
  on public.zemaris (deleted_at) where deleted_at is not null;
create index if not exists mezmur_collections_import_deleted_at_idx
  on public.mezmur_collections_import (deleted_at) where deleted_at is not null;
create index if not exists mezmur_sections_import_deleted_at_idx
  on public.mezmur_sections_import (deleted_at) where deleted_at is not null;
create unique index if not exists mezmur_data_import_import_id_uidx
  on public.mezmur_data_import (import_id);
create unique index if not exists mezmur_collections_import_import_id_uidx
  on public.mezmur_collections_import (import_id);
create unique index if not exists mezmur_sections_import_import_id_uidx
  on public.mezmur_sections_import (import_id);
create index if not exists mezmur_section_links_import_mezmur_slug_idx
  on public.mezmur_section_links_import (mezmur_slug);
create index if not exists mezmur_section_links_import_section_slug_idx
  on public.mezmur_section_links_import (section_slug);
create index if not exists mezmur_category_links_import_mezmur_slug_idx
  on public.mezmur_category_links_import (mezmur_slug);
create index if not exists mezmur_occasion_links_import_mezmur_slug_idx
  on public.mezmur_occasion_links_import (mezmur_slug);

create table if not exists public.content_deletion_events (
  id bigint generated by default as identity primary key,
  content_type text not null,
  content_key text not null,
  content_title text,
  action text not null,
  actor_id uuid references auth.users(id) on delete set null,
  actor_role text not null,
  previous_status text,
  relationship_changes jsonb not null default '{}'::jsonb,
  details jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
alter table public.content_deletion_events
  add column if not exists previous_status text,
  add column if not exists relationship_changes jsonb not null default '{}'::jsonb,
  add column if not exists details jsonb not null default '{}'::jsonb,
  add column if not exists created_at timestamptz not null default now();

do $$
begin
  if not exists (select 1 from pg_constraint where conname = 'content_deletion_events_content_type_check'
    and conrelid = 'public.content_deletion_events'::regclass) then
    alter table public.content_deletion_events add constraint content_deletion_events_content_type_check
      check (content_type in ('mezmur', 'zemari', 'collection', 'section'));
  end if;
  if not exists (select 1 from pg_constraint where conname = 'content_deletion_events_action_check'
    and conrelid = 'public.content_deletion_events'::regclass) then
    alter table public.content_deletion_events add constraint content_deletion_events_action_check
      check (action in ('trashed', 'restored', 'permanently_deleted', 'reassigned_and_deleted'));
  end if;
end $$;
create index if not exists content_deletion_events_content_created_idx
  on public.content_deletion_events (content_type, content_key, created_at desc);

create or replace function public.trash_hymn_content(p_content_type text, p_content_key text)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_type text := lower(trim(coalesce(p_content_type, '')));
  v_key text := trim(coalesce(p_content_key, ''));
  v_import_id uuid;
  v_zemari_id uuid;
  v_title text;
  v_previous text;
  v_changed integer := 0;
  v_matches integer := 0;
begin
  select p.role::text into v_role from public.profiles p where p.id = v_actor;
  if v_actor is null or v_role not in ('admin', 'super_admin') then
    raise exception 'An admin or super admin role is required to move content to Trash'
      using errcode = '42501';
  end if;
  if v_key = '' then raise exception 'A stable content identifier is required' using errcode = '22023'; end if;
  if v_type not in ('mezmur', 'zemari', 'collection', 'section') then
    raise exception 'Unsupported Hymns content type: %', v_type using errcode = '22023';
  end if;
  perform pg_advisory_xact_lock(hashtextextended('hymn-trash:' || v_type || ':' || v_key, 0));

  begin
    if v_type = 'zemari' then v_zemari_id := v_key::uuid; else v_import_id := v_key::uuid; end if;
  exception when invalid_text_representation then
    raise exception 'The % Trash action requires its UUID stable identifier, not a slug', v_type
      using errcode = '22023';
  end;

  if v_type = 'mezmur' then
    select count(*) into v_matches from public.mezmur_data_import where import_id = v_import_id;
    if v_matches <> 1 then raise exception 'Expected exactly one Mezmur for import_id %, found %', v_key, v_matches using errcode = 'P0002'; end if;
    select title, coalesce(deleted_from_status, status) into v_title, v_previous
      from public.mezmur_data_import where import_id = v_import_id for update;
    update public.mezmur_data_import set
      deleted_at = clock_timestamp(), deleted_by = v_actor,
      deleted_from_status = coalesce(deleted_from_status, status), status = 'draft',
      updated_at = clock_timestamp()::text
      where import_id = v_import_id and deleted_at is null;
  elsif v_type = 'zemari' then
    select count(*) into v_matches from public.zemaris where id = v_zemari_id;
    if v_matches <> 1 then raise exception 'Expected exactly one Zemari for id %, found %', v_key, v_matches using errcode = 'P0002'; end if;
    select name, coalesce(deleted_from_status, status) into v_title, v_previous
      from public.zemaris where id = v_zemari_id for update;
    update public.zemaris set
      deleted_at = clock_timestamp(), deleted_by = v_actor,
      deleted_from_status = coalesce(deleted_from_status, status), status = 'draft'
      where id = v_zemari_id and deleted_at is null;
  elsif v_type = 'collection' then
    select count(*) into v_matches from public.mezmur_collections_import where import_id = v_import_id;
    if v_matches <> 1 then raise exception 'Expected exactly one collection for import_id %, found %', v_key, v_matches using errcode = 'P0002'; end if;
    select title, coalesce(deleted_from_status, status) into v_title, v_previous
      from public.mezmur_collections_import where import_id = v_import_id for update;
    update public.mezmur_collections_import set
      deleted_at = clock_timestamp(), deleted_by = v_actor,
      deleted_from_status = coalesce(deleted_from_status, status), status = 'draft'
      where import_id = v_import_id and deleted_at is null;
  else
    select count(*) into v_matches from public.mezmur_sections_import where import_id = v_import_id;
    if v_matches <> 1 then raise exception 'Expected exactly one section for import_id %, found %', v_key, v_matches using errcode = 'P0002'; end if;
    select title, coalesce(deleted_from_status, status) into v_title, v_previous
      from public.mezmur_sections_import where import_id = v_import_id for update;
    update public.mezmur_sections_import set
      deleted_at = clock_timestamp(), deleted_by = v_actor,
      deleted_from_status = coalesce(deleted_from_status, status), status = 'draft'
      where import_id = v_import_id and deleted_at is null;
  end if;

  get diagnostics v_changed = row_count;
  if v_changed = 1 then
    insert into public.content_deletion_events
      (content_type, content_key, content_title, action, actor_id, actor_role,
       previous_status, relationship_changes, details)
    values (v_type, v_key, v_title, 'trashed', v_actor, v_role, v_previous,
      jsonb_build_object('relationships_preserved', true),
      jsonb_build_object('previous_status', v_previous));
  end if;
  return jsonb_build_object('content_type', v_type, 'content_key', v_key,
    'action', 'trashed', 'changed', v_changed = 1, 'previous_status', v_previous);
end;
$$;

create or replace function public.restore_hymn_content(p_content_type text, p_content_key text)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_type text := lower(trim(coalesce(p_content_type, '')));
  v_key text := trim(coalesce(p_content_key, ''));
  v_import_id uuid;
  v_zemari_id uuid;
  v_title text;
  v_previous text;
  v_matches integer := 0;
  v_changed integer := 0;
begin
  select p.role::text into v_role from public.profiles p where p.id = v_actor;
  if v_actor is null or v_role not in ('admin', 'super_admin') then
    raise exception 'An admin or super admin role is required to restore content' using errcode = '42501';
  end if;
  if v_key = '' then raise exception 'A stable content identifier is required' using errcode = '22023'; end if;
  if v_type not in ('mezmur', 'zemari', 'collection', 'section') then
    raise exception 'Unsupported Hymns content type: %', v_type using errcode = '22023';
  end if;
  perform pg_advisory_xact_lock(hashtextextended('hymn-trash:' || v_type || ':' || v_key, 0));
  begin
    if v_type = 'zemari' then v_zemari_id := v_key::uuid; else v_import_id := v_key::uuid; end if;
  exception when invalid_text_representation then
    raise exception 'The % restore action requires its UUID stable identifier, not a slug', v_type using errcode = '22023';
  end;

  if v_type = 'mezmur' then
    select count(*) into v_matches from public.mezmur_data_import where import_id = v_import_id and deleted_at is not null;
    if v_matches <> 1 then raise exception 'Expected exactly one trashed Mezmur for import_id %, found %', v_key, v_matches using errcode = 'P0002'; end if;
    select title, deleted_from_status into v_title, v_previous from public.mezmur_data_import where import_id = v_import_id for update;
    update public.mezmur_data_import set deleted_at = null, deleted_by = null,
      deleted_from_status = null, status = 'draft', updated_at = clock_timestamp()::text
      where import_id = v_import_id and deleted_at is not null;
  elsif v_type = 'zemari' then
    select count(*) into v_matches from public.zemaris where id = v_zemari_id and deleted_at is not null;
    if v_matches <> 1 then raise exception 'Expected exactly one trashed Zemari for id %, found %', v_key, v_matches using errcode = 'P0002'; end if;
    select name, deleted_from_status into v_title, v_previous from public.zemaris where id = v_zemari_id for update;
    update public.zemaris set deleted_at = null, deleted_by = null,
      deleted_from_status = null, status = 'draft'
      where id = v_zemari_id and deleted_at is not null;
  elsif v_type = 'collection' then
    select count(*) into v_matches from public.mezmur_collections_import where import_id = v_import_id and deleted_at is not null;
    if v_matches <> 1 then raise exception 'Expected exactly one trashed collection for import_id %, found %', v_key, v_matches using errcode = 'P0002'; end if;
    select title, deleted_from_status into v_title, v_previous from public.mezmur_collections_import where import_id = v_import_id for update;
    update public.mezmur_collections_import set deleted_at = null, deleted_by = null,
      deleted_from_status = null, status = 'draft'
      where import_id = v_import_id and deleted_at is not null;
  else
    select count(*) into v_matches from public.mezmur_sections_import where import_id = v_import_id and deleted_at is not null;
    if v_matches <> 1 then raise exception 'Expected exactly one trashed section for import_id %, found %', v_key, v_matches using errcode = 'P0002'; end if;
    select title, deleted_from_status into v_title, v_previous from public.mezmur_sections_import where import_id = v_import_id for update;
    update public.mezmur_sections_import set deleted_at = null, deleted_by = null,
      deleted_from_status = null, status = 'draft'
      where import_id = v_import_id and deleted_at is not null;
  end if;
  get diagnostics v_changed = row_count;
  if v_changed <> 1 then raise exception 'The trashed % changed concurrently; reload Trash', v_type using errcode = '40001'; end if;

  insert into public.content_deletion_events
    (content_type, content_key, content_title, action, actor_id, actor_role,
     previous_status, relationship_changes, details)
  values (v_type, v_key, v_title, 'restored', v_actor, v_role, v_previous,
    jsonb_build_object('relationships_preserved', true),
    jsonb_build_object('previous_status', v_previous, 'restored_status', 'draft'));
  return jsonb_build_object('content_type', v_type, 'content_key', v_key,
    'action', 'restored', 'status', 'draft', 'previous_status', v_previous);
end;
$$;

create or replace function public.permanently_delete_hymn_content(p_content_type text, p_content_key text)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_type text := lower(trim(coalesce(p_content_type, '')));
  v_key text := trim(coalesce(p_content_key, ''));
  v_import_id uuid;
  v_zemari_id uuid;
  v_slug text;
  v_title text;
  v_previous text;
  v_matches integer := 0;
  v_blocking integer := 0;
  v_removed_sections integer := 0;
  v_removed_categories integer := 0;
  v_removed_occasions integer := 0;
begin
  select p.role::text into v_role from public.profiles p where p.id = v_actor;
  if v_actor is null or v_role is distinct from 'super_admin' then
    raise exception 'Only a super admin can permanently delete Hymns content' using errcode = '42501';
  end if;
  if v_key = '' then raise exception 'A stable content identifier is required' using errcode = '22023'; end if;
  if v_type not in ('mezmur', 'zemari', 'collection', 'section') then
    raise exception 'Unsupported Hymns content type: %', v_type using errcode = '22023';
  end if;
  perform pg_advisory_xact_lock(hashtextextended('hymn-trash:' || v_type || ':' || v_key, 0));
  begin
    if v_type = 'zemari' then v_zemari_id := v_key::uuid; else v_import_id := v_key::uuid; end if;
  exception when invalid_text_representation then
    raise exception 'The % permanent-delete action requires its UUID stable identifier, not a slug', v_type using errcode = '22023';
  end;

  if v_type = 'mezmur' then
    select count(*) into v_matches from public.mezmur_data_import where import_id = v_import_id and deleted_at is not null;
    if v_matches <> 1 then raise exception 'Expected exactly one trashed Mezmur for import_id %, found %', v_key, v_matches using errcode = '23514'; end if;
    select slug, title, deleted_from_status into v_slug, v_title, v_previous
      from public.mezmur_data_import where import_id = v_import_id for update;
    if nullif(trim(coalesce(v_slug, '')), '') is null then
      raise exception 'This Mezmur has no slug; relationship ownership cannot be verified' using errcode = '23503';
    end if;
    select count(*) into v_blocking from public.mezmur_data_import
      where slug = v_slug and import_id is distinct from v_import_id;
    if v_blocking > 0 then
      raise exception 'Slug % belongs to more than one Mezmur; refusing to remove shared relationships', v_slug using errcode = '21000';
    end if;
    delete from public.mezmur_section_links_import where mezmur_slug = v_slug;
    get diagnostics v_removed_sections = row_count;
    delete from public.mezmur_category_links_import where mezmur_slug = v_slug;
    get diagnostics v_removed_categories = row_count;
    delete from public.mezmur_occasion_links_import where mezmur_slug = v_slug;
    get diagnostics v_removed_occasions = row_count;
    delete from public.mezmur_data_import where import_id = v_import_id and deleted_at is not null;
    if not found then raise exception 'The Mezmur changed concurrently; reload Trash' using errcode = '40001'; end if;
  elsif v_type = 'zemari' then
    select count(*) into v_matches from public.zemaris where id = v_zemari_id and deleted_at is not null;
    if v_matches <> 1 then raise exception 'Expected exactly one trashed Zemari for id %, found %', v_key, v_matches using errcode = '23514'; end if;
    select name, deleted_from_status into v_title, v_previous from public.zemaris where id = v_zemari_id for update;
    perform 1 from public.mezmur_data_import where zemari_id = v_zemari_id for update;
    select count(*) into v_blocking from public.mezmur_data_import where zemari_id = v_zemari_id;
    if v_blocking > 0 then
      raise exception 'This Zemari is associated with % Mezmurs. Reassign them before permanent deletion.', v_blocking using errcode = '23503';
    end if;
    delete from public.zemaris where id = v_zemari_id and deleted_at is not null;
    if not found then raise exception 'The Zemari changed concurrently; reload Trash' using errcode = '40001'; end if;
  elsif v_type = 'collection' then
    select count(*) into v_matches from public.mezmur_collections_import where import_id = v_import_id and deleted_at is not null;
    if v_matches <> 1 then raise exception 'Expected exactly one trashed collection for import_id %, found %', v_key, v_matches using errcode = '23514'; end if;
    select collection_slug, title, deleted_from_status into v_slug, v_title, v_previous
      from public.mezmur_collections_import where import_id = v_import_id for update;
    if nullif(trim(coalesce(v_slug, '')), '') is null then
      raise exception 'This collection has no slug; section ownership cannot be verified' using errcode = '23503';
    end if;
    select count(*) into v_blocking from public.mezmur_collections_import
      where collection_slug = v_slug and import_id is distinct from v_import_id;
    if v_blocking > 0 then raise exception 'Collection slug % is ambiguous', v_slug using errcode = '21000'; end if;
    perform 1 from public.mezmur_sections_import where collection_slug = v_slug for update;
    select count(*) into v_blocking from public.mezmur_sections_import where collection_slug = v_slug;
    if v_blocking > 0 then
      raise exception 'This collection still contains % sections. Move or remove those sections first.', v_blocking using errcode = '23503';
    end if;
    delete from public.mezmur_collections_import where import_id = v_import_id and deleted_at is not null;
    if not found then raise exception 'The collection changed concurrently; reload Trash' using errcode = '40001'; end if;
  else
    select count(*) into v_matches from public.mezmur_sections_import where import_id = v_import_id and deleted_at is not null;
    if v_matches <> 1 then raise exception 'Expected exactly one trashed section for import_id %, found %', v_key, v_matches using errcode = '23514'; end if;
    select section_slug, title, deleted_from_status into v_slug, v_title, v_previous
      from public.mezmur_sections_import where import_id = v_import_id for update;
    if nullif(trim(coalesce(v_slug, '')), '') is null then
      raise exception 'This section has no slug; link ownership cannot be verified' using errcode = '23503';
    end if;
    select count(*) into v_blocking from public.mezmur_sections_import
      where section_slug = v_slug and import_id is distinct from v_import_id;
    if v_blocking > 0 then
      raise exception 'Section slug % is ambiguous; refusing to remove shared links', v_slug using errcode = '21000';
    end if;
    delete from public.mezmur_section_links_import where section_slug = v_slug;
    get diagnostics v_removed_sections = row_count;
    delete from public.mezmur_sections_import where import_id = v_import_id and deleted_at is not null;
    if not found then raise exception 'The section changed concurrently; reload Trash' using errcode = '40001'; end if;
  end if;

  insert into public.content_deletion_events
    (content_type, content_key, content_title, action, actor_id, actor_role,
     previous_status, relationship_changes, details)
  values (v_type, v_key, v_title, 'permanently_deleted', v_actor, v_role, v_previous,
    jsonb_build_object(
      'section_links_removed', v_removed_sections,
      'category_links_removed', v_removed_categories,
      'occasion_links_removed', v_removed_occasions
    ),
    jsonb_build_object('previous_status', v_previous, 'blocking_reference_count', v_blocking));
  return jsonb_build_object('content_type', v_type, 'content_key', v_key,
    'action', 'permanently_deleted', 'relationship_changes', jsonb_build_object(
      'section_links_removed', v_removed_sections,
      'category_links_removed', v_removed_categories,
      'occasion_links_removed', v_removed_occasions));
end;
$$;

create or replace function public.reassign_and_delete_zemari(p_zemari_id uuid, p_target_zemari_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_source public.zemaris%rowtype;
  v_target public.zemaris%rowtype;
  v_count integer := 0;
begin
  select p.role::text into v_role from public.profiles p where p.id = v_actor;
  if v_actor is null or v_role is distinct from 'super_admin' then
    raise exception 'Only a super admin can reassign and permanently delete a Zemari' using errcode = '42501';
  end if;
  if p_zemari_id is null or p_target_zemari_id is null or p_zemari_id = p_target_zemari_id then
    raise exception 'Choose a different target Zemari' using errcode = '22023';
  end if;
  perform pg_advisory_xact_lock(hashtextextended('hymn-trash:zemari:' || p_zemari_id::text, 0));
  select * into strict v_source from public.zemaris
    where id = p_zemari_id and deleted_at is not null for update;
  select * into strict v_target from public.zemaris
    where id = p_target_zemari_id and deleted_at is null for update;
  perform 1 from public.mezmur_data_import where zemari_id = p_zemari_id for update;

  update public.mezmur_data_import set
    zemari_id = v_target.id,
    singer_id = v_target.id::text,
    singer_slug = v_target.slug,
    singer_name = v_target.name,
    updated_at = clock_timestamp()::text
    where zemari_id = v_source.id;
  get diagnostics v_count = row_count;
  delete from public.zemaris where id = v_source.id and deleted_at is not null;
  if not found then raise exception 'The source Zemari changed concurrently; reload Trash' using errcode = '40001'; end if;

  insert into public.content_deletion_events
    (content_type, content_key, content_title, action, actor_id, actor_role,
     previous_status, relationship_changes, details)
  values ('zemari', v_source.id::text, v_source.name, 'reassigned_and_deleted',
    v_actor, v_role, v_source.deleted_from_status,
    jsonb_build_object('replacement_zemari_id', v_target.id, 'reassigned_mezmur_count', v_count),
    jsonb_build_object('replacement_zemari_id', v_target.id, 'reassigned_mezmur_count', v_count));
  return jsonb_build_object('content_type', 'zemari', 'content_key', v_source.id,
    'action', 'reassigned_and_deleted', 'replacement_zemari_id', v_target.id,
    'reassigned_mezmur_count', v_count);
exception
  when no_data_found then
    raise exception 'The source must be in Trash and the replacement Zemari must be active'
      using errcode = '23514';
  when too_many_rows then
    raise exception 'A Zemari identifier resolved to multiple records' using errcode = '21000';
end;
$$;

-- Direct content edits cannot forge Trash metadata. The controlled RPCs and
-- this trigger are created by the same database owner; direct authenticated
-- writes execute as authenticated and are rejected. Service-role maintenance
-- remains possible without a user-settable bypass flag.
create or replace function public.guard_hymn_trash_metadata()
returns trigger
language plpgsql
security invoker
set search_path = ''
as $$
declare
  v_rpc_owner name;
begin
  select pg_get_userbyid(p.proowner) into v_rpc_owner
  from pg_proc p where p.oid = 'public.trash_hymn_content(text,text)'::regprocedure;
  if (
    old.deleted_at is distinct from new.deleted_at
    or old.deleted_by is distinct from new.deleted_by
    or old.deleted_from_status is distinct from new.deleted_from_status
  ) and current_user <> v_rpc_owner
    and coalesce(auth.role(), '') <> 'service_role' then
    raise exception 'Trash metadata can only be changed through the Hymns Trash actions'
      using errcode = '42501';
  end if;
  return new;
end;
$$;

drop trigger if exists guard_mezmur_data_import_trash_metadata on public.mezmur_data_import;
create trigger guard_mezmur_data_import_trash_metadata
before update of deleted_at, deleted_by, deleted_from_status on public.mezmur_data_import
for each row execute function public.guard_hymn_trash_metadata();
drop trigger if exists guard_zemaris_trash_metadata on public.zemaris;
create trigger guard_zemaris_trash_metadata
before update of deleted_at, deleted_by, deleted_from_status on public.zemaris
for each row execute function public.guard_hymn_trash_metadata();
drop trigger if exists guard_mezmur_collections_import_trash_metadata on public.mezmur_collections_import;
create trigger guard_mezmur_collections_import_trash_metadata
before update of deleted_at, deleted_by, deleted_from_status on public.mezmur_collections_import
for each row execute function public.guard_hymn_trash_metadata();
drop trigger if exists guard_mezmur_sections_import_trash_metadata on public.mezmur_sections_import;
create trigger guard_mezmur_sections_import_trash_metadata
before update of deleted_at, deleted_by, deleted_from_status on public.mezmur_sections_import
for each row execute function public.guard_hymn_trash_metadata();

-- Preserve the established public view contract. If production has a
-- different contract, abort the transaction instead of dropping columns or
-- breaking dependent API consumers.
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
    select array_agg(a.attname order by a.attnum) into v_columns
    from pg_attribute a
    where a.attrelid = 'public.mezmur_public'::regclass
      and a.attnum > 0 and not a.attisdropped;
    if v_columns is distinct from v_expected then
      raise exception 'Refusing to replace public.mezmur_public: unexpected column contract %', v_columns
        using errcode = '55000',
              hint = 'Inspect pg_get_viewdef(public.mezmur_public) before applying this repair.';
    end if;
  end if;
end $$;

create or replace view public.mezmur_public
with (security_barrier = true)
as
select
  mezmur_id, slug, title, title_amharic, title_english, description, description_amharic,
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
  primary_language, form, singer_id, singer_slug, singer_name, zemari_id,
  youtube_url, audio_url, image_path, image_alt, legacy_thumbnail_url,
  search_keywords, status, review_status, source_url, created_at, updated_at,
  rights_status
from public.mezmur_data_import
where deleted_at is null
  and lower(trim(coalesce(status, ''))) = 'published'
  and nullif(trim(coalesce(title, '')), '') is not null
  and nullif(trim(coalesce(slug, '')), '') is not null
  and nullif(trim(coalesce(lyrics_amharic, '')), '') is not null
  and (
    (rights_status in ('owned', 'licensed', 'authorized_contributor', 'public_domain', 'display_only')
      and publication_approved_at is not null and publication_approved_by is not null)
    or nullif(trim(coalesce(youtube_url, '')), '') is not null
    or nullif(trim(coalesce(source_url, '')), '') is not null
  );
revoke all on public.mezmur_public from public;
grant select on public.mezmur_public to anon, authenticated;

create or replace function public.is_public_mezmur_import_slug(p_slug text)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.mezmur_public m where m.slug = trim(coalesce(p_slug, ''))
  );
$$;

-- Replace only policies owned by this repair. Do not erase unrelated/custom
-- production policies. The obsolete direct public Mezmur-table read policy is
-- intentionally removed because public access belongs behind mezmur_public;
-- table privileges below also prevent anonymous draft reads.
drop policy if exists mezmur_data_import_public_read on public.mezmur_data_import;
drop policy if exists mezmur_data_import_staff_read on public.mezmur_data_import;
drop policy if exists mezmur_data_import_staff_insert on public.mezmur_data_import;
drop policy if exists mezmur_data_import_staff_update on public.mezmur_data_import;
drop policy if exists zemaris_public_read on public.zemaris;
drop policy if exists zemaris_staff_insert on public.zemaris;
drop policy if exists zemaris_staff_update on public.zemaris;
drop policy if exists mezmur_collections_import_public_read on public.mezmur_collections_import;
drop policy if exists mezmur_collections_import_staff_insert on public.mezmur_collections_import;
drop policy if exists mezmur_collections_import_staff_update on public.mezmur_collections_import;
drop policy if exists mezmur_sections_import_public_read on public.mezmur_sections_import;
drop policy if exists mezmur_sections_import_staff_insert on public.mezmur_sections_import;
drop policy if exists mezmur_sections_import_staff_update on public.mezmur_sections_import;
drop policy if exists mezmur_section_links_import_public_read on public.mezmur_section_links_import;
drop policy if exists mezmur_section_links_import_staff_write on public.mezmur_section_links_import;
drop policy if exists mezmur_category_links_import_public_read on public.mezmur_category_links_import;
drop policy if exists mezmur_category_links_import_staff_write on public.mezmur_category_links_import;
drop policy if exists mezmur_occasion_links_import_public_read on public.mezmur_occasion_links_import;
drop policy if exists mezmur_occasion_links_import_staff_write on public.mezmur_occasion_links_import;
drop policy if exists content_deletion_events_staff_read on public.content_deletion_events;

alter table public.mezmur_data_import enable row level security;
alter table public.zemaris enable row level security;
alter table public.mezmur_collections_import enable row level security;
alter table public.mezmur_sections_import enable row level security;
alter table public.mezmur_section_links_import enable row level security;
alter table public.mezmur_category_links_import enable row level security;
alter table public.mezmur_occasion_links_import enable row level security;
alter table public.content_deletion_events enable row level security;

revoke all on public.mezmur_data_import from anon;
grant select, insert, update on public.mezmur_data_import to authenticated;
revoke delete on public.mezmur_data_import from authenticated;
create policy mezmur_data_import_staff_read on public.mezmur_data_import
  for select to authenticated using (coalesce(public.is_staff(), false));
create policy mezmur_data_import_staff_insert on public.mezmur_data_import
  for insert to authenticated with check (coalesce(public.is_staff(), false));
create policy mezmur_data_import_staff_update on public.mezmur_data_import
  for update to authenticated using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

grant select on public.zemaris to anon, authenticated;
grant insert, update on public.zemaris to authenticated;
revoke insert, update, delete on public.zemaris from anon;
revoke delete on public.zemaris from authenticated;
create policy zemaris_public_read on public.zemaris
  for select to anon, authenticated
  using ((deleted_at is null and status = 'published') or coalesce(public.is_staff(), false));
create policy zemaris_staff_insert on public.zemaris
  for insert to authenticated with check (coalesce(public.is_staff(), false));
create policy zemaris_staff_update on public.zemaris
  for update to authenticated using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

grant select on public.mezmur_collections_import to anon, authenticated;
grant insert, update on public.mezmur_collections_import to authenticated;
revoke insert, update, delete on public.mezmur_collections_import from anon;
revoke delete on public.mezmur_collections_import from authenticated;
create policy mezmur_collections_import_public_read on public.mezmur_collections_import
  for select to anon, authenticated
  using ((deleted_at is null and lower(trim(coalesce(status, ''))) = 'published')
    or coalesce(public.is_staff(), false));
create policy mezmur_collections_import_staff_insert on public.mezmur_collections_import
  for insert to authenticated with check (coalesce(public.is_staff(), false));
create policy mezmur_collections_import_staff_update on public.mezmur_collections_import
  for update to authenticated using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

grant select on public.mezmur_sections_import to anon, authenticated;
grant insert, update on public.mezmur_sections_import to authenticated;
revoke insert, update, delete on public.mezmur_sections_import from anon;
revoke delete on public.mezmur_sections_import from authenticated;
create policy mezmur_sections_import_public_read on public.mezmur_sections_import
  for select to anon, authenticated
  using ((deleted_at is null and lower(trim(coalesce(status, ''))) = 'published')
    or coalesce(public.is_staff(), false));
create policy mezmur_sections_import_staff_insert on public.mezmur_sections_import
  for insert to authenticated with check (coalesce(public.is_staff(), false));
create policy mezmur_sections_import_staff_update on public.mezmur_sections_import
  for update to authenticated using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

grant select on public.mezmur_section_links_import to anon, authenticated;
grant insert, update, delete on public.mezmur_section_links_import to authenticated;
revoke insert, update, delete on public.mezmur_section_links_import from anon;
create policy mezmur_section_links_import_public_read on public.mezmur_section_links_import
  for select to anon, authenticated using (
    coalesce(public.is_staff(), false) or (
      public.is_public_mezmur_import_slug(mezmur_slug) and exists (
        select 1 from public.mezmur_sections_import s
        where s.section_slug = mezmur_section_links_import.section_slug
          and s.deleted_at is null and lower(trim(coalesce(s.status, ''))) = 'published'
      )
    )
  );
create policy mezmur_section_links_import_staff_write on public.mezmur_section_links_import
  for all to authenticated using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

grant select on public.mezmur_category_links_import to anon, authenticated;
grant insert, delete on public.mezmur_category_links_import to authenticated;
revoke insert, update, delete on public.mezmur_category_links_import from anon;
create policy mezmur_category_links_import_public_read on public.mezmur_category_links_import
  for select to anon, authenticated
  using (coalesce(public.is_staff(), false) or public.is_public_mezmur_import_slug(mezmur_slug));
create policy mezmur_category_links_import_staff_write on public.mezmur_category_links_import
  for all to authenticated using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

grant select on public.mezmur_occasion_links_import to anon, authenticated;
grant insert, delete on public.mezmur_occasion_links_import to authenticated;
revoke insert, update, delete on public.mezmur_occasion_links_import from anon;
create policy mezmur_occasion_links_import_public_read on public.mezmur_occasion_links_import
  for select to anon, authenticated
  using (coalesce(public.is_staff(), false) or public.is_public_mezmur_import_slug(mezmur_slug));
create policy mezmur_occasion_links_import_staff_write on public.mezmur_occasion_links_import
  for all to authenticated using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

revoke all on public.content_deletion_events from public, anon, authenticated;
grant select on public.content_deletion_events to authenticated;
create policy content_deletion_events_staff_read on public.content_deletion_events
  for select to authenticated using (coalesce(public.is_staff(), false));

-- Production's established contract has 17 columns. Preserve its first 17
-- names, positions, and types exactly, then append Trash metadata. Accept the
-- already-repaired 20-column form so rerunning this migration remains safe.
do $$
declare
  v_names text[];
  v_types text[];
  v_expected_prefix text[] := array[
    'id','slug','name','name_amharic','bio','bio_amharic','image_path','image_alt',
    'youtube_url','website_url','sort_order','is_featured','status','created_at','updated_at',
    'mezmur_count','published_mezmur_count'
  ];
begin
  if to_regclass('public.zemaris_with_counts') is null then
    raise exception 'public.zemaris_with_counts is missing; stop and inspect its production contract'
      using errcode = '55000';
  end if;

  select array_agg(a.attname order by a.attnum),
         array_agg(format_type(a.atttypid, a.atttypmod) order by a.attnum)
    into v_names, v_types
  from pg_attribute a
  where a.attrelid = 'public.zemaris_with_counts'::regclass
    and a.attnum > 0 and not a.attisdropped;

  if cardinality(v_names) not in (17, 20)
     or v_names[1:17] is distinct from v_expected_prefix then
    raise exception 'Refusing to replace public.zemaris_with_counts: unexpected column contract %', v_names
      using errcode = '55000';
  end if;
  if v_types[16] is distinct from 'bigint' or v_types[17] is distinct from 'bigint' then
    raise exception 'Refusing to replace public.zemaris_with_counts: count types must remain bigint, found % and %',
      v_types[16], v_types[17] using errcode = '55000';
  end if;
  if cardinality(v_names) = 20 and (
    v_names[18:20] is distinct from array['deleted_at','deleted_by','deleted_from_status']::text[]
    or v_types[18] is distinct from 'timestamp with time zone'
    or v_types[19] is distinct from 'uuid'
    or v_types[20] is distinct from 'text'
  ) then
    raise exception 'Refusing to replace public.zemaris_with_counts: unexpected appended Trash contract % (%)',
      v_names[18:20], v_types[18:20] using errcode = '55000';
  end if;
end $$;

-- Staff need deleted metadata in the counts view; anonymous callers are still
-- constrained by the security-invoker base-table policies.
create or replace view public.zemaris_with_counts
with (security_invoker = true)
as
select
  z.id, z.slug, z.name, z.name_amharic, z.bio, z.bio_amharic,
  z.image_path, z.image_alt, z.youtube_url, z.website_url,
  z.sort_order, z.is_featured, z.status, z.created_at, z.updated_at,
  case when coalesce(public.is_staff(), false) then
    (select count(*) from public.mezmur_data_import m
      where m.zemari_id = z.id and m.deleted_at is null)
  else
    (select count(*) from public.mezmur_public m where m.zemari_id = z.id)
  end as mezmur_count,
  (select count(*) from public.mezmur_public m where m.zemari_id = z.id) as published_mezmur_count,
  z.deleted_at, z.deleted_by, z.deleted_from_status
from public.zemaris z;
grant select on public.zemaris_with_counts to anon, authenticated;

revoke all on function public.guard_hymn_trash_metadata() from public, anon, authenticated;
revoke all on function public.trash_hymn_content(text, text) from public, anon, authenticated;
revoke all on function public.restore_hymn_content(text, text) from public, anon, authenticated;
revoke all on function public.permanently_delete_hymn_content(text, text) from public, anon, authenticated;
revoke all on function public.reassign_and_delete_zemari(uuid, uuid) from public, anon, authenticated;
revoke all on function public.is_public_mezmur_import_slug(text) from public;
grant execute on function public.trash_hymn_content(text, text) to authenticated;
grant execute on function public.restore_hymn_content(text, text) to authenticated;
grant execute on function public.permanently_delete_hymn_content(text, text) to authenticated;
grant execute on function public.reassign_and_delete_zemari(uuid, uuid) to authenticated;
grant execute on function public.is_public_mezmur_import_slug(text) to anon, authenticated;

notify pgrst, 'reload schema';
commit;
