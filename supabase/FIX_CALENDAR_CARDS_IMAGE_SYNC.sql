-- FIX: Calendar Card image sync architecture
-- Run in Supabase SQL editor AFTER prior calendar_cards FIX scripts
-- (RECONCILE + DATE_RULES + SOURCE_LINK + HOMEPAGE).
--
-- Goals:
-- 1) Ensure one published presentation card per linked structured source
-- 2) Merge duplicate cards without losing images
-- 3) Unique (source_type, source_id) for linked cards
-- 4) Seed missing cards so Admin image saves can reach Calendar/Homepage
-- 5) Attach known Annunciation media to Bisrate Gabriel when present

begin;

-- ---------------------------------------------------------------------------
-- Schema: nullable title / eth dates (idempotent)
-- ---------------------------------------------------------------------------
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

-- Ensure source link columns exist
alter table public.calendar_cards
  add column if not exists source_type text not null default 'manual';

alter table public.calendar_cards
  add column if not exists source_id text;

alter table public.calendar_cards
  add column if not exists source_slug text;

-- ---------------------------------------------------------------------------
-- Duplicate reconciliation: pick survivor, merge images, archive losers
-- ---------------------------------------------------------------------------
do $$
declare
  r record;
  survivor_id uuid;
  loser_id uuid;
begin
  for r in
    select
      source_type,
      source_id,
      array_agg(id order by
        case when nullif(trim(image_path), '') is not null then 0 else 1 end,
        coalesce(updated_at, created_at) desc nulls last,
        id
      ) as ids
    from public.calendar_cards
    where source_id is not null
      and coalesce(source_type, 'manual') <> 'manual'
      and lower(coalesce(status, '')) <> 'archived'
    group by source_type, source_id
    having count(*) > 1
  loop
    survivor_id := r.ids[1];
    foreach loser_id in array r.ids[2:]
    loop
      update public.calendar_cards s
      set
        image_path = coalesce(nullif(trim(s.image_path), ''), l.image_path),
        image_alt = coalesce(nullif(trim(s.image_alt), ''), l.image_alt),
        image_position = coalesce(nullif(trim(s.image_position), ''), l.image_position, 'center'),
        show_on_home = coalesce(s.show_on_home, false) or coalesce(l.show_on_home, false),
        home_featured = coalesce(s.home_featured, false) or coalesce(l.home_featured, false),
        home_sort_order = coalesce(s.home_sort_order, l.home_sort_order),
        source_slug = coalesce(nullif(trim(s.source_slug), ''), l.source_slug),
        updated_at = now()
      from public.calendar_cards l
      where s.id = survivor_id
        and l.id = loser_id;

      update public.calendar_cards
      set
        status = 'archived',
        featured = false,
        show_on_home = false,
        home_featured = false,
        updated_at = now()
      where id = loser_id;
    end loop;
  end loop;
end $$;

-- Unique: one linked presentation card per source_id
drop index if exists calendar_cards_unique_linked_source_id_idx;
create unique index calendar_cards_unique_linked_source_id_idx
  on public.calendar_cards (source_type, source_id)
  where source_id is not null
    and coalesce(source_type, 'manual') <> 'manual'
    and lower(coalesce(status, '')) <> 'archived';

create index if not exists calendar_cards_source_type_slug_lookup_idx
  on public.calendar_cards (source_type, source_slug)
  where source_slug is not null;

-- ---------------------------------------------------------------------------
-- Seed missing published presentation cards from structured sources
-- ---------------------------------------------------------------------------
insert into public.calendar_cards (
  slug, title, title_amharic, category, card_type,
  ethiopian_month_number, ethiopian_day, is_monthly,
  source_type, source_id, source_slug,
  image_path, image_alt, image_position,
  featured, show_on_home, home_featured, status, sort_order, updated_at
)
select
  left(regexp_replace(lower(coalesce(m.slug, m.id::text)), '[^a-z0-9]+', '-', 'g'), 80),
  null,
  null,
  m.category,
  case
    when m.category ilike '%angel%' then 'angel'
    when m.category ilike '%mary%' or m.category ilike '%virgin%' then 'mary'
    else 'saint'
  end,
  null,
  m.ethiopian_day,
  true,
  'monthly_commemoration',
  m.id::text,
  m.slug,
  null,
  null,
  'center',
  true,
  false,
  false,
  'published',
  coalesce(m.sort_order, 0),
  now()
from public.monthly_commemorations m
where lower(coalesce(m.status, '')) = 'published'
  and not exists (
    select 1 from public.calendar_cards c
    where c.source_type = 'monthly_commemoration'
      and c.source_id = m.id::text
      and lower(coalesce(c.status, '')) <> 'archived'
  )
  and not exists (
    select 1 from public.calendar_cards c2
    where c2.slug = left(regexp_replace(lower(coalesce(m.slug, m.id::text)), '[^a-z0-9]+', '-', 'g'), 80)
  );

insert into public.calendar_cards (
  slug, title, title_amharic, category, card_type,
  ethiopian_month_number, ethiopian_day, is_monthly,
  source_type, source_id, source_slug,
  image_path, image_alt, image_position,
  featured, show_on_home, home_featured, status, sort_order, updated_at
)
select
  left(regexp_replace(lower(coalesce(o.slug, o.id::text)), '[^a-z0-9]+', '-', 'g'), 80),
  null,
  null,
  o.category,
  case
    when o.observance_type ilike '%fast%' then 'fast'
    when o.category ilike '%mary%' then 'mary'
    when o.category ilike '%angel%' then 'angel'
    when o.category ilike '%cross%' then 'feast'
    else 'feast'
  end,
  case when coalesce(o.is_movable, false) then null else o.ethiopian_month_number end,
  case when coalesce(o.is_movable, false) then null else o.ethiopian_day end,
  false,
  'observance',
  o.id::text,
  o.slug,
  null,
  null,
  'center',
  true,
  false,
  false,
  'published',
  coalesce(o.sort_order, 0),
  now()
from public.orthodox_observances o
where lower(coalesce(o.status, '')) = 'published'
  and not exists (
    select 1 from public.calendar_cards c
    where c.source_type = 'observance'
      and c.source_id = o.id::text
      and lower(coalesce(c.status, '')) <> 'archived'
  )
  and not exists (
    select 1 from public.calendar_cards c2
    where c2.slug = left(regexp_replace(lower(coalesce(o.slug, o.id::text)), '[^a-z0-9]+', '-', 'g'), 80)
  );

insert into public.calendar_cards (
  slug, title, category, card_type,
  ethiopian_month_number, ethiopian_day, is_monthly,
  source_type, source_id, source_slug,
  featured, show_on_home, status, sort_order, updated_at
)
select
  left(regexp_replace(lower(coalesce(f.slug, f.id::text)), '[^a-z0-9]+', '-', 'g'), 80),
  null,
  coalesce(f.fast_type, 'fast'),
  'fast',
  case when coalesce(f.is_movable, false) then null else f.ethiopian_month_number end,
  case when coalesce(f.is_movable, false) then null else f.ethiopian_day end,
  false,
  'fast',
  f.id::text,
  f.slug,
  true,
  false,
  'published',
  coalesce(f.sort_order, 0),
  now()
from public.liturgical_fasts f
where lower(coalesce(f.status, '')) = 'published'
  and not exists (
    select 1 from public.calendar_cards c
    where c.source_type = 'fast'
      and c.source_id = f.id::text
      and lower(coalesce(c.status, '')) <> 'archived'
  )
  and not exists (
    select 1 from public.calendar_cards c2
    where c2.slug = left(regexp_replace(lower(coalesce(f.slug, f.id::text)), '[^a-z0-9]+', '-', 'g'), 80)
  );

insert into public.calendar_cards (
  slug, title, category, card_type,
  ethiopian_month_number, ethiopian_day, is_monthly,
  source_type, source_id, source_slug,
  featured, show_on_home, status, sort_order, updated_at
)
select
  left(regexp_replace(lower(coalesce(s.slug, s.id::text)), '[^a-z0-9]+', '-', 'g'), 80),
  null,
  'season',
  'other',
  case when coalesce(s.is_movable, false) then null else s.ethiopian_month_number end,
  case when coalesce(s.is_movable, false) then null else s.ethiopian_day end,
  false,
  'season',
  s.id::text,
  s.slug,
  true,
  false,
  'published',
  coalesce(s.sort_order, 0),
  now()
from public.liturgical_seasons s
where lower(coalesce(s.status, '')) = 'published'
  and not exists (
    select 1 from public.calendar_cards c
    where c.source_type = 'season'
      and c.source_id = s.id::text
      and lower(coalesce(c.status, '')) <> 'archived'
  )
  and not exists (
    select 1 from public.calendar_cards c2
    where c2.slug = left(regexp_replace(lower(coalesce(s.slug, s.id::text)), '[^a-z0-9]+', '-', 'g'), 80)
  );

-- Attach known uploaded Annunciation image to Bisrate Gabriel if card has no image yet.
-- Never borrow Demera / Meskel cross artwork for Bisrate.
update public.calendar_cards c
set
  image_path = 'calendar/mary/annunciation.webp',
  image_alt = coalesce(nullif(trim(c.image_alt), ''), 'Annunciation / Bisrate Gabriel'),
  updated_at = now()
where c.source_type = 'monthly_commemoration'
  and (
    c.source_slug = 'annunciation-monthly'
    or c.source_id in (
      select id::text from public.monthly_commemorations where slug = 'annunciation-monthly'
    )
  )
  and nullif(trim(c.image_path), '') is null
  and exists (
    select 1 from storage.objects o
    where o.bucket_id = 'content-media'
      and o.name = 'calendar/mary/annunciation.webp'
  );

-- Keep Demera's uploaded artwork on Demera only (do not copy to Bisrate).
-- Prefer the latest explicit upload path when Demera's card image is still empty.
update public.calendar_cards c
set
  image_path = 'calendar/cross/demera-1790953956789.webp',
  image_alt = coalesce(nullif(trim(c.image_alt), ''), 'Demera / Eve of Meskel'),
  updated_at = now()
where c.source_type = 'observance'
  and (
    c.source_slug = 'demera'
    or c.source_id in (
      select id::text from public.orthodox_observances where slug = 'demera'
    )
  )
  and nullif(trim(c.image_path), '') is null
  and exists (
    select 1 from storage.objects o
    where o.bucket_id = 'content-media'
      and o.name = 'calendar/cross/demera-1790953956789.webp'
  );

-- Fallback Demera path if the timestamped upload is absent
update public.calendar_cards c
set
  image_path = 'calendar/cross/demera.webp',
  image_alt = coalesce(nullif(trim(c.image_alt), ''), 'Demera / Eve of Meskel'),
  updated_at = now()
where c.source_type = 'observance'
  and (
    c.source_slug = 'demera'
    or c.source_id in (
      select id::text from public.orthodox_observances where slug = 'demera'
    )
  )
  and nullif(trim(c.image_path), '') is null
  and exists (
    select 1 from storage.objects o
    where o.bucket_id = 'content-media'
      and o.name = 'calendar/cross/demera.webp'
  );

-- Uriel image if present and monthly Uriel card empty
update public.calendar_cards c
set
  image_path = 'calendar/general/uriel.webp',
  image_alt = coalesce(nullif(trim(c.image_alt), ''), 'Archangel Uriel'),
  updated_at = now()
where c.source_type = 'monthly_commemoration'
  and (
    c.source_slug ilike '%uriel%'
    or c.slug ilike '%uriel%'
  )
  and nullif(trim(c.image_path), '') is null
  and exists (
    select 1 from storage.objects o
    where o.bucket_id = 'content-media'
      and o.name = 'calendar/general/uriel.webp'
  );

commit;

-- Audit: linked sources with >1 active card (should be empty after this)
-- select source_type, source_id, source_slug, count(*)
-- from public.calendar_cards
-- where source_id is not null and coalesce(source_type,'manual') <> 'manual'
--   and lower(coalesce(status,'')) <> 'archived'
-- group by 1,2,3 having count(*) > 1;
