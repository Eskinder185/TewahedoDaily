-- Calendar Cards: optional fields + seed featured monthly commemorations.
-- Synaxarium remains the source of truth (no separate calendar_cards table).

begin;

alter table public.synaxarium_commemorations
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists featured boolean not null default false,
  add column if not exists is_monthly boolean not null default false,
  add column if not exists image_position text;

comment on column public.synaxarium_commemorations.featured is
  'Eligible for the public Calendar page card strip when published.';
comment on column public.synaxarium_commemorations.is_monthly is
  'When true, the card recurs every Ethiopian month on ethiopian_day from the linked day.';
comment on column public.synaxarium_commemorations.image_position is
  'Focal hint for object-position: center|top|bottom|left|right.';

create index if not exists synaxarium_commemorations_featured_published_idx
  on public.synaxarium_commemorations (featured, status, sort_order)
  where featured = true and status = 'published';

-- Ensure Meskerem day rows exist for the four monthly commemorations (canonical home days).
insert into public.synaxarium_days (
  slug, ethiopian_month, ethiopian_month_number, ethiopian_day,
  display_date_english, display_date_amharic, summary, status, updated_at
)
select v.slug, v.ethiopian_month, v.ethiopian_month_number, v.ethiopian_day,
       v.display_date_english, null, v.summary, 'published'::public.content_status, now()
from (
  values
    ('meskerem-19', 'Meskerem', 1, 19, 'Meskerem 19', 'Monthly commemorations of Archangel Gabriel.'),
    ('meskerem-21', 'Meskerem', 1, 21, 'Meskerem 21', 'Monthly commemorations of Saint Mary.'),
    ('meskerem-22', 'Meskerem', 1, 22, 'Meskerem 22', 'Monthly commemorations of Archangel Uriel.'),
    ('meskerem-23', 'Meskerem', 1, 23, 'Meskerem 23', 'Monthly commemorations of Saint Georgios.')
) as v(slug, ethiopian_month, ethiopian_month_number, ethiopian_day, display_date_english, summary)
where not exists (
  select 1 from public.synaxarium_days d
  where d.ethiopian_month_number = v.ethiopian_month_number
    and d.ethiopian_day = v.ethiopian_day
);

-- Upsert the four monthly Calendar Cards as featured published commemorations.
with targets as (
  select * from (values
    (
      'saint-gabriel-monthly-19',
      'Saint Gabriel Monthly Commemoration',
      'ቅዱስ ገብርኤል',
      'angel',
      'Monthly commemoration of Archangel Gabriel, messenger of divine glad tidings.',
      19,
      10,
      array['Saint Gabriel','Gabriel','Gebriel','monthly','angel']::text[]
    ),
    (
      'saint-mary-monthly-21',
      'Saint Mary Monthly Commemoration',
      'ቅድስት ማርያም',
      'mary',
      'Monthly remembrance of Saint Mary, the Mother of God, on the 21st of each Ethiopian month.',
      21,
      20,
      array['Saint Mary','Mary','Mariyam','monthly','marian']::text[]
    ),
    (
      'saint-uriel-monthly-22',
      'Kidus Uriel Monthly Commemoration',
      'ቅዱስ ኡራኤል',
      'angel',
      'Monthly commemoration of Archangel Uriel on the 22nd of each Ethiopian month.',
      22,
      30,
      array['Uriel','Kidus Uriel','monthly','angel']::text[]
    ),
    (
      'saint-georgios-monthly-23',
      'Saint Georgios Monthly Commemoration',
      'ቅዱስ ጊዮርጊስ',
      'martyr',
      'Monthly commemoration of Saint Georgios (George) on the 23rd of each Ethiopian month.',
      23,
      40,
      array['Georgios','George','Giyorgis','monthly','martyr']::text[]
    )
  ) as t(slug, title, title_amharic, commemoration_type, summary, eth_day, sort_order, keywords)
),
days as (
  select d.id, d.slug as day_slug, d.ethiopian_day
  from public.synaxarium_days d
  where d.ethiopian_month_number = 1
    and d.ethiopian_day in (19, 21, 22, 23)
)
insert into public.synaxarium_commemorations (
  day_id, day_slug, slug, title, title_amharic, commemoration_type, summary,
  keywords, sort_order, status, featured, is_monthly, image_position, updated_at
)
select
  days.id,
  days.day_slug,
  targets.slug,
  targets.title,
  targets.title_amharic,
  targets.commemoration_type,
  targets.summary,
  targets.keywords,
  targets.sort_order,
  'published'::public.content_status,
  true,
  true,
  'top',
  now()
from targets
join days on days.ethiopian_day = targets.eth_day
where not exists (
  select 1 from public.synaxarium_commemorations c where c.slug = targets.slug
);

-- If rows already exist (e.g. imported earlier), promote them for the Calendar strip.
update public.synaxarium_commemorations c
set
  featured = true,
  is_monthly = true,
  status = 'published',
  image_position = coalesce(nullif(c.image_position, ''), 'top'),
  updated_at = now()
where c.slug in (
  'saint-gabriel-monthly-19',
  'saint-mary-monthly-21',
  'saint-uriel-monthly-22',
  'saint-georgios-monthly-23'
);

commit;
