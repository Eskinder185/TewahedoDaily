-- Calendar cards: optional link to structured calendar sources.
-- Polymorphic source_id (no single FK) — validated in app / Content Health.

alter table public.calendar_cards
  add column if not exists source_type text,
  add column if not exists source_id uuid,
  add column if not exists source_slug text;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'calendar_cards_source_type_check'
  ) then
    alter table public.calendar_cards
      add constraint calendar_cards_source_type_check
      check (
        source_type is null
        or source_type in (
          'manual',
          'observance',
          'fast',
          'season',
          'monthly_commemoration',
          'synaxarium_day',
          'synaxarium_commemoration'
        )
      );
  end if;
end $$;

create index if not exists calendar_cards_source_type_id_idx
  on public.calendar_cards (source_type, source_id)
  where source_id is not null;

create index if not exists calendar_cards_source_type_slug_idx
  on public.calendar_cards (source_type, source_slug)
  where source_slug is not null;

comment on column public.calendar_cards.source_type is
  'Linked structured source: observance|fast|season|monthly_commemoration|synaxarium_day|synaxarium_commemoration|manual';
comment on column public.calendar_cards.source_id is
  'UUID of the linked structured record (table depends on source_type).';
comment on column public.calendar_cards.source_slug is
  'Stable slug of the linked structured record for imports and display.';

notify pgrst, 'reload schema';
