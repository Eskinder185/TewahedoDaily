-- Allow saint / feast / bible content_type values on favorites + progress.
-- Mirrors FIX_USER_FAVORITES_SAINT_FEAST.sql for fresh environments.

do $$
declare
  cname text;
begin
  select con.conname into cname
  from pg_constraint con
  join pg_class rel on rel.oid = con.conrelid
  join pg_namespace nsp on nsp.oid = rel.relnamespace
  where nsp.nspname = 'public'
    and rel.relname = 'user_favorites'
    and con.contype = 'c'
    and pg_get_constraintdef(con.oid) ilike '%content_type%';

  if cname is not null then
    execute format('alter table public.user_favorites drop constraint %I', cname);
  end if;

  alter table public.user_favorites
    add constraint user_favorites_content_type_check
    check (content_type in (
      'prayer', 'psalm', 'liturgy', 'mezmur', 'calendar_card', 'synaxarium',
      'collection', 'saint', 'feast', 'bible'
    ));
end $$;

do $$
declare
  cname text;
begin
  select con.conname into cname
  from pg_constraint con
  join pg_class rel on rel.oid = con.conrelid
  join pg_namespace nsp on nsp.oid = rel.relnamespace
  where nsp.nspname = 'public'
    and rel.relname = 'user_reading_progress'
    and con.contype = 'c'
    and pg_get_constraintdef(con.oid) ilike '%content_type%';

  if cname is not null then
    execute format('alter table public.user_reading_progress drop constraint %I', cname);
  end if;

  alter table public.user_reading_progress
    add constraint user_reading_progress_content_type_check
    check (content_type in (
      'prayer', 'psalm', 'liturgy', 'mezmur', 'collection', 'synaxarium',
      'saint', 'feast', 'bible'
    ));
end $$;
