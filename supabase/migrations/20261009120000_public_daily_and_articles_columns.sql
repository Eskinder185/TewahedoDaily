-- Ensure production has public_daily_content RPC + articles description/teaching_category.
-- Safe / idempotent. Do not apply without ops approval.

-- articles columns (also covered by 20261007210000; re-assert for lagging projects)
alter table public.articles add column if not exists teaching_category text;
alter table public.articles add column if not exists description text;

do $$
declare
  cname text;
begin
  select con.conname into cname
  from pg_constraint con
  join pg_class rel on rel.oid = con.conrelid
  join pg_namespace nsp on nsp.oid = rel.relnamespace
  where nsp.nspname = 'public'
    and rel.relname = 'articles'
    and con.contype = 'c'
    and pg_get_constraintdef(con.oid) ilike '%teaching_category%';
  if cname is not null then
    execute format('alter table public.articles drop constraint %I', cname);
  end if;
  alter table public.articles
    add constraint articles_teaching_category_check
    check (
      teaching_category is null
      or teaching_category in (
        'Church teaching',
        'Saints',
        'Feasts',
        'Bible study',
        'Church history',
        'The Seven Mysteries'
      )
    );
exception
  when duplicate_object then null;
end $$;

-- public_daily_content: recreate to match live daily_content schema when present
do $$
begin
  if to_regclass('public.daily_content') is null then
    raise notice 'daily_content missing; skip public_daily_content';
    return;
  end if;

  -- Prefer content_date column (current app); fall back to day if that is what exists.
  if exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'daily_content' and column_name = 'content_date'
  ) then
    execute $fn$
      create or replace function public.public_daily_content(target_day date)
      returns jsonb
      language sql
      stable
      security invoker
      set search_path = ''
      as $body$
        select jsonb_build_object(
          'content_date', d.content_date,
          'announcement', d.announcement,
          'summary', d.summary,
          'mezmur', (
            select jsonb_build_object('title', m.title, 'slug', m.slug, 'thumbnail_url', m.thumbnail_url)
            from public.mezmur m where m.id = d.mezmur_id and m.status = 'published'
          ),
          'saint', (
            select jsonb_build_object('title', m.title, 'slug', m.slug, 'thumbnail_url', m.thumbnail_url)
            from public.saints m where m.id = d.saint_id and m.status = 'published'
          ),
          'feast', (
            select jsonb_build_object('title', m.title, 'slug', m.slug, 'thumbnail_url', m.thumbnail_url)
            from public.feasts m where m.id = d.feast_id and m.status = 'published'
          )
        )
        from public.daily_content d
        where d.content_date = target_day and d.published
      $body$;
    $fn$;
  elsif exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'daily_content' and column_name = 'day'
  ) then
    execute $fn$
      create or replace function public.public_daily_content(target_day date)
      returns jsonb
      language sql
      stable
      security invoker
      set search_path = ''
      as $body$
        select jsonb_build_object(
          'day', d.day,
          'bible_references', d.bible_references,
          'fasting_indicator', d.fasting_indicator,
          'fasting_notes', d.fasting_notes,
          'announcement', d.announcement,
          'mezmur', (
            select jsonb_build_object('title', m.title, 'slug', m.slug, 'thumbnail_url', m.thumbnail_url)
            from public.mezmur m where m.id = d.mezmur_id and m.status = 'published'
          ),
          'saint', (
            select jsonb_build_object('title', m.title, 'slug', m.slug, 'thumbnail_url', m.thumbnail_url)
            from public.saints m where m.id = d.saint_id and m.status = 'published'
          ),
          'feast', (
            select jsonb_build_object('title', m.title, 'slug', m.slug, 'thumbnail_url', m.thumbnail_url)
            from public.feasts m where m.id = d.feast_id and m.status = 'published'
          )
        )
        from public.daily_content d
        where d.day = target_day and d.published
      $body$;
    $fn$;
  end if;

  revoke all on function public.public_daily_content(date) from public;
  grant execute on function public.public_daily_content(date) to anon, authenticated;
end $$;
