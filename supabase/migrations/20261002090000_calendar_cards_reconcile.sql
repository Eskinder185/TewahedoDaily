-- Calendar Cards: allow linked cards to inherit title from structured sources.
-- Manual cards still require a non-empty title.

begin;

-- Drop the old non-empty title check if present (name may vary).
do $$
declare
  constraint_name text;
begin
  for constraint_name in
    select con.conname
    from pg_constraint con
    join pg_class rel on rel.oid = con.conrelid
    join pg_namespace nsp on nsp.oid = rel.relnamespace
    where nsp.nspname = 'public'
      and rel.relname = 'calendar_cards'
      and con.contype = 'c'
      and pg_get_constraintdef(con.oid) ilike '%title%'
      and pg_get_constraintdef(con.oid) ilike '%length%trim%'
  loop
    execute format('alter table public.calendar_cards drop constraint %I', constraint_name);
  end loop;
end $$;

alter table public.calendar_cards
  alter column title drop not null;

alter table public.calendar_cards
  drop constraint if exists calendar_cards_title_manual_required;

alter table public.calendar_cards
  add constraint calendar_cards_title_manual_required
  check (
    coalesce(source_type, 'manual') = 'manual'
      and title is not null
      and length(trim(title)) > 0
    or coalesce(source_type, 'manual') <> 'manual'
  );

comment on column public.calendar_cards.title is
  'Presentation override. Linked cards may leave title null/blank to inherit from the structured source.';

-- Normalize common legacy source_type variants.
update public.calendar_cards
set source_type = 'monthly_commemoration',
    updated_at = now()
where lower(trim(coalesce(source_type, ''))) in (
  'monthly',
  'monthly-commemoration',
  'monthly_commemorations',
  'monthlycommemoration'
);

update public.calendar_cards
set source_type = 'observance',
    updated_at = now()
where lower(trim(coalesce(source_type, ''))) in ('observances', 'orthodox_observance', 'orthodox_observances');

update public.calendar_cards
set source_type = 'fast',
    updated_at = now()
where lower(trim(coalesce(source_type, ''))) in ('fasts', 'liturgical_fast', 'liturgical_fasts');

update public.calendar_cards
set source_type = 'season',
    updated_at = now()
where lower(trim(coalesce(source_type, ''))) in ('seasons', 'liturgical_season', 'liturgical_seasons');

-- Lookup helper (uniqueness enforced by reconciliation, not hard unique yet —
-- existing duplicates must be merged first).
create index if not exists calendar_cards_source_type_id_lookup_idx
  on public.calendar_cards (source_type, source_id)
  where source_id is not null;

commit;
