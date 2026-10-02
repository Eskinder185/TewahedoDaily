-- PASTE into Supabase Dashboard → SQL Editor → Run
-- Adds homepage display columns to public.calendar_cards
-- Same body as supabase/migrations/20261001120000_calendar_cards_homepage_fields.sql

begin;

alter table public.calendar_cards
  add column if not exists show_on_home boolean not null default false;

alter table public.calendar_cards
  add column if not exists home_featured boolean not null default false;

alter table public.calendar_cards
  add column if not exists home_sort_order integer;

alter table public.calendar_cards
  add column if not exists home_start_date date;

alter table public.calendar_cards
  add column if not exists home_end_date date;

comment on column public.calendar_cards.show_on_home is
  'When true, eligible for the homepage Today in Church carousel (with published status).';
comment on column public.calendar_cards.home_featured is
  'Homepage priority boost after current-day matches.';
comment on column public.calendar_cards.home_sort_order is
  'Homepage carousel order (lower first). Falls back to sort_order when null.';
comment on column public.calendar_cards.home_start_date is
  'Optional Gregorian start of homepage visibility window (inclusive).';
comment on column public.calendar_cards.home_end_date is
  'Optional Gregorian end of homepage visibility window (inclusive).';

create index if not exists calendar_cards_home_idx
  on public.calendar_cards (show_on_home, status, home_sort_order, sort_order)
  where show_on_home = true;

create index if not exists calendar_cards_home_featured_idx
  on public.calendar_cards (home_featured, status)
  where home_featured = true;

notify pgrst, 'reload schema';

commit;
