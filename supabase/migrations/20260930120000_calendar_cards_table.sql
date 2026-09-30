-- Dedicated curated Calendar Cards (visual strip), separate from Synaxarium.
-- Does NOT alter or delete synaxarium_days / synaxarium_commemorations.

begin;

-- ---------------------------------------------------------------------------
-- Table
-- ---------------------------------------------------------------------------
create table if not exists public.calendar_cards (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique
    check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  title text not null check (length(trim(title)) > 0),
  title_amharic text,
  card_type text not null default 'other'
    check (card_type in (
      'angel', 'mary', 'saint', 'feast', 'fast', 'apostle', 'prophet', 'martyr', 'other'
    )),
  description text,
  image_path text,
  image_alt text,
  image_position text not null default 'center'
    check (image_position in ('center', 'top', 'bottom', 'left', 'right')),
  ethiopian_month_number integer not null
    check (ethiopian_month_number between 1 and 13),
  ethiopian_day integer not null
    check (ethiopian_day between 1 and 30),
  is_monthly boolean not null default false,
  synaxarium_day_id uuid
    references public.synaxarium_days(id) on delete set null,
  synaxarium_day_slug text,
  featured boolean not null default true,
  sort_order integer not null default 0,
  status public.content_status not null default 'published',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.calendar_cards is
  'Curated visual cards for the public Calendar strip. Not the full Synaxarium.';
comment on column public.calendar_cards.synaxarium_day_id is
  'Optional link to the Synaxarium day opened via “Open date”.';
comment on column public.calendar_cards.is_monthly is
  'When true, the public strip projects the next occurrence of ethiopian_day each month.';

-- ---------------------------------------------------------------------------
-- Indexes
-- ---------------------------------------------------------------------------
create index if not exists calendar_cards_status_idx
  on public.calendar_cards (status);
create index if not exists calendar_cards_featured_idx
  on public.calendar_cards (featured);
create index if not exists calendar_cards_sort_order_idx
  on public.calendar_cards (sort_order);
create index if not exists calendar_cards_eth_date_idx
  on public.calendar_cards (ethiopian_month_number, ethiopian_day);
create index if not exists calendar_cards_synaxarium_day_id_idx
  on public.calendar_cards (synaxarium_day_id);
create index if not exists calendar_cards_public_strip_idx
  on public.calendar_cards (featured, status, sort_order)
  where featured = true and status = 'published';

-- ---------------------------------------------------------------------------
-- updated_at
-- ---------------------------------------------------------------------------
drop trigger if exists calendar_cards_updated on public.calendar_cards;
create trigger calendar_cards_updated
  before update on public.calendar_cards
  for each row execute function public.set_updated_at();

-- ---------------------------------------------------------------------------
-- RLS
-- ---------------------------------------------------------------------------
alter table public.calendar_cards enable row level security;

grant select on public.calendar_cards to anon, authenticated;
grant insert, update, delete on public.calendar_cards to authenticated;
grant all on public.calendar_cards to service_role;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'calendar_cards'
      and policyname = 'calendar_cards_public_read'
  ) then
    create policy calendar_cards_public_read
      on public.calendar_cards for select to anon, authenticated
      using (
        status = 'published'
        or cms_private.current_role() in ('editor', 'admin', 'super_admin')
      );
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'calendar_cards'
      and policyname = 'calendar_cards_staff_write'
  ) then
    create policy calendar_cards_staff_write
      on public.calendar_cards for all to authenticated
      using (cms_private.current_role() in ('editor', 'admin', 'super_admin'))
      with check (cms_private.current_role() in ('editor', 'admin', 'super_admin'));
  end if;
end $$;

-- ---------------------------------------------------------------------------
-- Seed ONLY the known curated visual cards (not every Synaxarium row).
-- Prefer copying from existing featured monthly commemorations when present.
-- ---------------------------------------------------------------------------
insert into public.calendar_cards (
  slug, title, title_amharic, card_type, description,
  image_path, image_alt, image_position,
  ethiopian_month_number, ethiopian_day, is_monthly,
  synaxarium_day_id, synaxarium_day_slug,
  featured, sort_order, status, updated_at
)
select
  seed.slug,
  coalesce(c.title, seed.title),
  coalesce(c.title_amharic, seed.title_amharic),
  coalesce(
    case
      when c.commemoration_type in (
        'angel', 'mary', 'saint', 'feast', 'fast', 'apostle', 'prophet', 'martyr', 'other'
      ) then c.commemoration_type
      else null
    end,
    seed.card_type
  ),
  coalesce(c.summary, seed.description),
  c.image_path,
  c.image_alt,
  case
    when c.image_position in ('center', 'top', 'bottom', 'left', 'right') then c.image_position
    else 'top'
  end,
  coalesce(d.ethiopian_month_number, 1),
  coalesce(d.ethiopian_day, seed.eth_day),
  true,
  d.id,
  d.slug,
  true,
  seed.sort_order,
  'published'::public.content_status,
  now()
from (
  values
    (
      'saint-gabriel-monthly-19',
      'Saint Gabriel Monthly Commemoration',
      'ቅዱስ ገብርኤል',
      'angel',
      'Monthly commemoration of Archangel Gabriel.',
      19,
      10
    ),
    (
      'saint-mary-monthly-21',
      'Saint Mary Monthly Commemoration',
      'ቅድስት ማርያም',
      'mary',
      'Monthly remembrance of Saint Mary on the 21st of each Ethiopian month.',
      21,
      20
    ),
    (
      'saint-uriel-monthly-22',
      'Kidus Uriel Monthly Commemoration',
      'ቅዱስ ኡራኤል',
      'angel',
      'Monthly commemoration of Archangel Uriel on the 22nd of each Ethiopian month.',
      22,
      30
    ),
    (
      'saint-georgios-monthly-23',
      'Saint Georgios Monthly Commemoration',
      'ቅዱስ ጊዮርጊስ',
      'martyr',
      'Monthly commemoration of Saint Georgios on the 23rd of each Ethiopian month.',
      23,
      40
    )
) as seed(slug, title, title_amharic, card_type, description, eth_day, sort_order)
left join public.synaxarium_commemorations c
  on c.slug = seed.slug
left join public.synaxarium_days d
  on d.id = c.day_id
  or (
    c.day_id is null
    and d.ethiopian_month_number = 1
    and d.ethiopian_day = seed.eth_day
  )
where not exists (
  select 1 from public.calendar_cards existing where existing.slug = seed.slug
);

-- If day join missed (commemoration absent), still ensure synaxarium day link by eth date.
update public.calendar_cards card
set
  synaxarium_day_id = d.id,
  synaxarium_day_slug = d.slug,
  updated_at = now()
from public.synaxarium_days d
where card.synaxarium_day_id is null
  and d.ethiopian_month_number = card.ethiopian_month_number
  and d.ethiopian_day = card.ethiopian_day
  and card.slug in (
    'saint-gabriel-monthly-19',
    'saint-mary-monthly-21',
    'saint-uriel-monthly-22',
    'saint-georgios-monthly-23'
  );

commit;
