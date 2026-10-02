-- Allow top-center crop anchor for calendar card images (faces / halos / crosses).

do $$
declare
  constraint_name text;
begin
  select con.conname
  into constraint_name
  from pg_constraint con
  join pg_class rel on rel.oid = con.conrelid
  join pg_namespace nsp on nsp.oid = rel.relnamespace
  where nsp.nspname = 'public'
    and rel.relname = 'calendar_cards'
    and con.contype = 'c'
    and pg_get_constraintdef(con.oid) ilike '%image_position%';
  limit 1;

  if constraint_name is not null then
    execute format('alter table public.calendar_cards drop constraint %I', constraint_name);
  end if;
end $$;

alter table public.calendar_cards
  drop constraint if exists calendar_cards_image_position_check;

alter table public.calendar_cards
  add constraint calendar_cards_image_position_check
  check (
    image_position in ('center', 'top', 'bottom', 'left', 'right', 'top-center')
  );
