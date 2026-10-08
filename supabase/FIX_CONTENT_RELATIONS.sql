-- Ensure editorial related_content + encyclopedia fields exist.
-- Additive / idempotent. Does NOT change RLS (existing content_* policies remain).
-- Run manually in Supabase SQL editor before relying on CMS RelatedPicker in production.

do $$
declare
  t text;
begin
  foreach t in array array['saints', 'feasts', 'prayers', 'articles'] loop
    execute format(
      'alter table public.%I add column if not exists body text',
      t
    );
    execute format(
      'alter table public.%I add column if not exists body_amharic text',
      t
    );
    execute format(
      'alter table public.%I add column if not exists body_oromo text',
      t
    );
    execute format(
      'alter table public.%I add column if not exists audio_url text',
      t
    );
    execute format(
      'alter table public.%I add column if not exists date_notes text',
      t
    );
    execute format(
      'alter table public.%I add column if not exists related_content jsonb not null default ''[]''::jsonb',
      t
    );
  end loop;
end $$;

-- Feast / article extras (safe if already present)
alter table public.feasts add column if not exists fasting_info text;
alter table public.feasts add column if not exists is_movable boolean default false;
alter table public.articles add column if not exists teaching_category text;
alter table public.articles add column if not exists description text;

-- related_content array shape (drop+recreate check only when needed)
do $$
declare
  t text;
  cname text;
begin
  foreach t in array array['saints', 'feasts', 'prayers', 'articles'] loop
    select con.conname into cname
    from pg_constraint con
    join pg_class rel on rel.oid = con.conrelid
    join pg_namespace nsp on nsp.oid = rel.relnamespace
    where nsp.nspname = 'public'
      and rel.relname = t
      and con.contype = 'c'
      and pg_get_constraintdef(con.oid) ilike '%related_content%';

    if cname is not null then
      execute format('alter table public.%I drop constraint %I', t, cname);
    end if;

    execute format(
      'alter table public.%I add constraint %I check (
         jsonb_typeof(related_content) = ''array''
         and jsonb_array_length(related_content) <= 30
       )',
      t,
      t || '_related_content_array_check'
    );
  end loop;
end $$;

-- teaching_category allowed values (matches frontend ENCYCLOPEDIA_CATEGORIES)
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
end $$;
