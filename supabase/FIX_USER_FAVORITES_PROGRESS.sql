-- Unified user favorites + reading progress (optional login persistence).
-- Safe to re-run: uses IF NOT EXISTS / DROP POLICY IF EXISTS.

create extension if not exists pgcrypto;

-- ---------------------------------------------------------------------------
-- user_favorites
-- ---------------------------------------------------------------------------
create table if not exists public.user_favorites (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  content_type text not null
    check (content_type in (
      'prayer', 'psalm', 'liturgy', 'mezmur', 'calendar_card', 'synaxarium',
      'collection', 'saint', 'feast', 'bible'
    )),
  content_id uuid,
  content_slug text,
  collection_slug text,
  title text,
  route text,
  created_at timestamptz not null default now(),
  constraint user_favorites_identity_check check (
    content_id is not null or nullif(trim(content_slug), '') is not null
  )
);

create unique index if not exists user_favorites_unique_content_id
  on public.user_favorites (user_id, content_type, content_id)
  where content_id is not null;

create unique index if not exists user_favorites_unique_slug
  on public.user_favorites (
    user_id,
    content_type,
    content_slug,
    coalesce(collection_slug, '')
  )
  where content_id is null and content_slug is not null;

create index if not exists user_favorites_user_created_idx
  on public.user_favorites (user_id, created_at desc);

alter table public.user_favorites enable row level security;
revoke all on public.user_favorites from public, anon, authenticated;
grant select, insert, delete on public.user_favorites to authenticated;

drop policy if exists user_favorites_select on public.user_favorites;
drop policy if exists user_favorites_insert on public.user_favorites;
drop policy if exists user_favorites_delete on public.user_favorites;

create policy user_favorites_select on public.user_favorites
  for select to authenticated
  using (user_id = auth.uid());

create policy user_favorites_insert on public.user_favorites
  for insert to authenticated
  with check (user_id = auth.uid());

create policy user_favorites_delete on public.user_favorites
  for delete to authenticated
  using (user_id = auth.uid());

-- ---------------------------------------------------------------------------
-- user_reading_progress
-- ---------------------------------------------------------------------------
create table if not exists public.user_reading_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  content_type text not null
    check (content_type in (
      'prayer', 'psalm', 'liturgy', 'mezmur', 'collection', 'synaxarium',
      'saint', 'feast', 'bible'
    )),
  content_id uuid,
  content_slug text,
  collection_slug text,
  section_slug text,
  title text,
  route text,
  position_percent numeric,
  scroll_offset integer,
  updated_at timestamptz not null default now(),
  constraint user_reading_progress_identity_check check (
    content_id is not null or nullif(trim(content_slug), '') is not null or nullif(trim(route), '') is not null
  )
);

create unique index if not exists user_reading_progress_unique_content_id
  on public.user_reading_progress (user_id, content_type, content_id)
  where content_id is not null;

create unique index if not exists user_reading_progress_unique_route
  on public.user_reading_progress (user_id, content_type, coalesce(route, ''), coalesce(content_slug, ''), coalesce(collection_slug, ''))
  where content_id is null;

create index if not exists user_reading_progress_user_updated_idx
  on public.user_reading_progress (user_id, updated_at desc);

alter table public.user_reading_progress enable row level security;
revoke all on public.user_reading_progress from public, anon, authenticated;
grant select, insert, update, delete on public.user_reading_progress to authenticated;

drop policy if exists user_reading_progress_select on public.user_reading_progress;
drop policy if exists user_reading_progress_insert on public.user_reading_progress;
drop policy if exists user_reading_progress_update on public.user_reading_progress;
drop policy if exists user_reading_progress_delete on public.user_reading_progress;

create policy user_reading_progress_select on public.user_reading_progress
  for select to authenticated
  using (user_id = auth.uid());

create policy user_reading_progress_insert on public.user_reading_progress
  for insert to authenticated
  with check (user_id = auth.uid());

create policy user_reading_progress_update on public.user_reading_progress
  for update to authenticated
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy user_reading_progress_delete on public.user_reading_progress
  for delete to authenticated
  using (user_id = auth.uid());

-- ---------------------------------------------------------------------------
-- Ensure legacy mezmur_favorites exists (FavoriteButton / public_favorites)
-- ---------------------------------------------------------------------------
create table if not exists public.mezmur_favorites (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  mezmur_id uuid not null references public.mezmur(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (user_id, mezmur_id)
);

alter table public.mezmur_favorites enable row level security;
revoke all on public.mezmur_favorites from public, anon;
grant select, insert, delete on public.mezmur_favorites to authenticated;

drop policy if exists favorites_read on public.mezmur_favorites;
drop policy if exists favorites_insert on public.mezmur_favorites;
drop policy if exists favorites_delete on public.mezmur_favorites;

create policy favorites_read on public.mezmur_favorites
  for select to authenticated
  using (user_id = auth.uid());

create policy favorites_insert on public.mezmur_favorites
  for insert to authenticated
  with check (
    user_id = auth.uid()
    and exists (
      select 1 from public.mezmur m
      where m.id = mezmur_id and m.status = 'published'
    )
  );

create policy favorites_delete on public.mezmur_favorites
  for delete to authenticated
  using (user_id = auth.uid());

-- Recreate public_favorites RPC if missing (mezmur Saved page)
create or replace function public.public_favorites(page_number integer default 1)
returns jsonb
language sql
stable
security invoker
set search_path = ''
as $$
  with visible as (
    select
      m.id,
      m.slug,
      m.title,
      m.title_amharic,
      m.description,
      m.thumbnail_url,
      m.audio_url,
      m.featured,
      m.published_at,
      s.name as singer_name,
      c.name as category_name,
      cms_private.mezmur_languages(m) as languages,
      '[]'::jsonb as tags,
      f.created_at as saved_at
    from public.mezmur_favorites f
    join public.mezmur m on m.id = f.mezmur_id
    left join public.singers s on s.id = m.singer_id
    left join public.categories c on c.id = m.category_id
    where f.user_id = auth.uid() and m.status = 'published'
  ),
  page as (
    select * from visible
    order by saved_at desc, id
    limit 24
    offset (least(greatest(page_number, 1), 10000) - 1) * 24
  )
  select jsonb_build_object(
    'items', coalesce((select jsonb_agg(to_jsonb(page)) from page), '[]'::jsonb),
    'total', (select count(*) from visible)
  );
$$;

revoke all on function public.public_favorites(integer) from public, anon;
grant execute on function public.public_favorites(integer) to authenticated;

notify pgrst, 'reload schema';
