-- Allow linked Calendar Cards to omit invented Ethiopian month/day.
-- Movable observances and monthly commemorations must not be forced to Meskerem 1.

begin;

alter table public.calendar_cards
  drop constraint if exists calendar_cards_ethiopian_month_number_check;

alter table public.calendar_cards
  drop constraint if exists calendar_cards_ethiopian_day_check;

alter table public.calendar_cards
  alter column ethiopian_month_number drop not null;

alter table public.calendar_cards
  alter column ethiopian_day drop not null;

alter table public.calendar_cards
  add constraint calendar_cards_ethiopian_month_number_check
  check (
    ethiopian_month_number is null
    or ethiopian_month_number between 1 and 13
  );

alter table public.calendar_cards
  add constraint calendar_cards_ethiopian_day_check
  check (
    ethiopian_day is null
    or ethiopian_day between 1 and 30
  );

-- Manual cards still need an explicit date.
alter table public.calendar_cards
  drop constraint if exists calendar_cards_manual_date_required;

alter table public.calendar_cards
  add constraint calendar_cards_manual_date_required
  check (
    coalesce(source_type, 'manual') = 'manual'
      and ethiopian_month_number is not null
      and ethiopian_day is not null
    or coalesce(source_type, 'manual') <> 'manual'
  );

comment on column public.calendar_cards.ethiopian_month_number is
  'Optional presentation hint. Linked cards inherit the authoritative date rule from the structured source; do not invent Meskerem 1.';

comment on column public.calendar_cards.ethiopian_day is
  'Optional presentation hint. For monthly sources store the recurring day; movable sources may leave null.';

commit;
