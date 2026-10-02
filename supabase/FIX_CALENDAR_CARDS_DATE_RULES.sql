-- Standalone FIX: nullable eth dates on calendar_cards (no invented Meskerem 1).
-- Mirrors 20261002120000_calendar_cards_nullable_eth_dates.sql

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

-- Clear invented Meskerem 1 on movable/linked cards where source has no fixed month.
-- Safe: only null out month=1 day=1 when card is linked and not monthly with day 1.
update public.calendar_cards c
set
  ethiopian_month_number = null,
  ethiopian_day = null,
  updated_at = now()
where coalesce(c.source_type, 'manual') <> 'manual'
  and c.is_monthly is not true
  and c.ethiopian_month_number = 1
  and c.ethiopian_day = 1
  and exists (
    select 1
    from public.orthodox_observances o
    where c.source_type = 'observance'
      and (c.source_id = o.id or c.source_slug = o.slug)
      and (
        coalesce(o.is_movable, false) = true
        or o.ethiopian_month_number is null
        or o.ethiopian_day is null
      )
  );

-- Monthly cards: clear invented month=1; keep the recurring day.
update public.calendar_cards c
set
  ethiopian_month_number = null,
  updated_at = now()
where c.source_type = 'monthly_commemoration'
  and c.ethiopian_month_number = 1;

commit;
