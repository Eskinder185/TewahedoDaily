-- Hymns Practice browse taxonomy: occasions, category/singer presentation fields,
-- backfill from existing mezmur.category / mezmur.occasion text.
-- Safe to re-run in Supabase SQL editor.

begin;

-- ---------------------------------------------------------------------------
-- Categories: presentation fields for browse cards
-- ---------------------------------------------------------------------------
alter table public.categories
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists sort_order integer not null default 0,
  add column if not exists is_featured boolean not null default false,
  add column if not exists status text not null default 'published';

alter table public.categories
  drop constraint if exists categories_status_check;
alter table public.categories
  add constraint categories_status_check
  check (status in ('draft', 'published', 'archived'));

comment on column public.categories.image_path is
  'Relative content-media path for Hymns Practice browse cards.';

-- ---------------------------------------------------------------------------
-- Singers: slug + presentation fields
-- ---------------------------------------------------------------------------
alter table public.singers
  add column if not exists slug text,
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists bio text,
  add column if not exists youtube_channel_url text,
  add column if not exists sort_order integer not null default 0,
  add column if not exists is_featured boolean not null default false,
  add column if not exists status text not null default 'published';

alter table public.singers
  drop constraint if exists singers_status_check;
alter table public.singers
  add constraint singers_status_check
  check (status in ('draft', 'published', 'archived'));

update public.singers
set slug = regexp_replace(lower(trim(name)), '[^a-z0-9]+', '-', 'g')
where slug is null or trim(slug) = '';

-- Deduplicate slugs if needed
do $$
declare
  r record;
  n int;
begin
  for r in
    select slug, array_agg(id order by created_at) as ids
    from public.singers
    where slug is not null
    group by slug
    having count(*) > 1
  loop
    n := 1;
    foreach n in array (
      select generate_series(2, array_length(r.ids, 1))
    )
    loop
      update public.singers
      set slug = r.slug || '-' || n
      where id = r.ids[n];
    end loop;
  end loop;
end $$;

create unique index if not exists singers_slug_unique_idx
  on public.singers (slug)
  where slug is not null;

-- ---------------------------------------------------------------------------
-- Occasions (normalized liturgical / event browse groups)
-- ---------------------------------------------------------------------------
create table if not exists public.mezmur_occasions (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique
    check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  name text not null,
  name_amharic text,
  description text,
  description_amharic text,
  image_path text,
  image_alt text,
  sort_order integer not null default 0,
  is_featured boolean not null default false,
  status text not null default 'published'
    check (status in ('draft', 'published', 'archived')),
  search_keywords text[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.mezmur_occasion_links (
  mezmur_id uuid not null references public.mezmur(id) on delete cascade,
  occasion_id uuid not null references public.mezmur_occasions(id) on delete cascade,
  primary key (mezmur_id, occasion_id)
);

create index if not exists mezmur_occasion_links_occasion_idx
  on public.mezmur_occasion_links (occasion_id);

drop trigger if exists mezmur_occasions_updated on public.mezmur_occasions;
create trigger mezmur_occasions_updated
  before update on public.mezmur_occasions
  for each row execute function public.set_updated_at();

alter table public.mezmur_occasions enable row level security;
alter table public.mezmur_occasion_links enable row level security;

grant select on public.mezmur_occasions to anon, authenticated;
grant select on public.mezmur_occasion_links to anon, authenticated;
grant insert, update, delete on public.mezmur_occasions to authenticated;
grant insert, update, delete on public.mezmur_occasion_links to authenticated;
grant all on public.mezmur_occasions to service_role;
grant all on public.mezmur_occasion_links to service_role;

drop policy if exists mezmur_occasions_public_read on public.mezmur_occasions;
create policy mezmur_occasions_public_read
  on public.mezmur_occasions for select to anon, authenticated
  using (
    status = 'published'
    or cms_private.current_role() in ('editor', 'admin', 'super_admin')
  );

drop policy if exists mezmur_occasions_staff_write on public.mezmur_occasions;
create policy mezmur_occasions_staff_write
  on public.mezmur_occasions for all to authenticated
  using (cms_private.current_role() in ('editor', 'admin', 'super_admin'))
  with check (cms_private.current_role() in ('editor', 'admin', 'super_admin'));

drop policy if exists mezmur_occasion_links_public_read on public.mezmur_occasion_links;
create policy mezmur_occasion_links_public_read
  on public.mezmur_occasion_links for select to anon, authenticated
  using (true);

drop policy if exists mezmur_occasion_links_staff_write on public.mezmur_occasion_links;
create policy mezmur_occasion_links_staff_write
  on public.mezmur_occasion_links for all to authenticated
  using (cms_private.current_role() in ('editor', 'admin', 'super_admin'))
  with check (cms_private.current_role() in ('editor', 'admin', 'super_admin'));

-- ---------------------------------------------------------------------------
-- Seed canonical occasions (idempotent by slug)
-- ---------------------------------------------------------------------------
insert into public.mezmur_occasions (slug, name, name_amharic, sort_order, is_featured, search_keywords)
values
  ('gena', 'Christmas / Gena', 'ገና', 10, true, array['christmas','nativity','lidet','gena']),
  ('timket', 'Timkat / Epiphany', 'ጥምቀት', 20, true, array['timket','epiphany','baptism feast']),
  ('meskel', 'Meskel / Holy Cross', 'መስቀል', 30, true, array['meskel','holy cross','demera']),
  ('hosanna', 'Hosanna / Palm Sunday', 'ሆሣዕና', 40, true, array['hosanna','palm sunday']),
  ('siklet', 'Good Friday / Siklet', 'ስቅለት', 50, true, array['siklet','good friday','crucifixion']),
  ('tinsae', 'Resurrection / Tinsae', 'ትንሣኤ', 60, true, array['tinsae','fasika','easter','pascha','resurrection']),
  ('erget', 'Ascension / Erget', 'ዕርገት', 70, false, array['erget','ascension']),
  ('pentecost', 'Pentecost', 'ጰንጠቆስጤ', 80, false, array['pentecost']),
  ('debre-tabor', 'Transfiguration / Debre Tabor', 'ደብረ ታቦር', 90, false, array['debre tabor','transfiguration']),
  ('filseta', 'Filseta / Assumption', 'ፍልሰታ', 100, true, array['filseta','assumption']),
  ('kidane-mihret', 'Kidane Mihret', 'ኪዳነ ምሕረት', 110, false, array['kidane mihret','kidane mehret']),
  ('lideta-maryam', 'Lideta Maryam', 'ልደታ ማርያም', 120, false, array['lideta maryam','nativity of mary']),
  ('abiy-tsom', 'Abiy Tsom / Great Lent', 'ዐቢይ ጾም', 130, true, array['abiy tsom','great lent','hudadi']),
  ('tsome-nineveh', 'Nineveh Fast', 'ጾመ ነነዌ', 140, false, array['nineveh','tsome nineveh']),
  ('tsome-nebiyat', 'Fast of the Prophets', 'ጾመ ነቢያት', 150, false, array['tsome nebiyat']),
  ('tsome-hawariat', 'Apostles Fast', 'ጾመ ሐዋርያት', 160, false, array['tsome hawariat','apostles fast']),
  ('holy-week', 'Holy Week', 'ሕማማት', 170, true, array['holy week','himamat']),
  ('new-year', 'New Year / Enkutatash', 'እንቁጣጣሽ', 180, true, array['enkutatash','new year']),
  ('wedding', 'Wedding', 'ሰርግ', 190, true, array['wedding','marriage']),
  ('baptism', 'Baptism', 'ጥምቀት ሥርዓት', 200, false, array['baptism']),
  ('funeral', 'Funeral / Memorial', 'ቀብር / መታሰቢያ', 210, false, array['funeral','memorial']),
  ('communion', 'Communion', 'ቅዱስ ቁርባን', 220, false, array['communion','eucharist']),
  ('annual-saint-feast', 'Annual Saint Feast', 'ዓመታዊ የቅዱሳን በዓል', 230, false, array['annual saint feast']),
  ('general', 'General / Anytime', 'አጠቃላይ', 900, false, array['general','anytime','general worship']),
  ('short-hymns', 'Short Hymns', 'አጭር መዝሙራት', 15, true, array['short','short hymns']),
  ('sunday-school', 'Sunday School', 'ሰንበት ትምህርት ቤት', 25, true, array['sunday school','children']),
  ('repentance', 'Repentance', 'ንስሐ', 35, true, array['repentance','confession']),
  ('praise', 'Praise', 'ምስጋና', 45, true, array['praise','worship'])
on conflict (slug) do update set
  name = excluded.name,
  name_amharic = coalesce(public.mezmur_occasions.name_amharic, excluded.name_amharic),
  sort_order = excluded.sort_order,
  is_featured = excluded.is_featured,
  search_keywords = excluded.search_keywords,
  updated_at = now();

-- ---------------------------------------------------------------------------
-- Seed categories from distinct published mezmur.category text (skip NA)
-- ---------------------------------------------------------------------------
insert into public.categories (name, name_amharic, slug, description, type, sort_order, status, is_featured)
select
  m.category,
  null,
  left(regexp_replace(lower(trim(m.category)), '[^a-z0-9]+', '-', 'g'), 80),
  null,
  'mezmur',
  case
    when m.category = 'Jesus Christ' then 10
    when m.category = 'Virgin Mary' then 20
    when m.category = 'Praise / Worship' then 30
    when m.category = 'Cross' then 40
    when m.category = 'Angels' then 50
    when m.category = 'Saints' then 60
    when m.category = 'Repentance' then 70
    else 200
  end,
  'published',
  m.category in ('Jesus Christ', 'Virgin Mary', 'Praise / Worship', 'Cross', 'Angels', 'Saints', 'Repentance')
from (
  select distinct trim(category) as category
  from public.mezmur
  where status = 'published'
    and category is not null
    and trim(category) <> ''
    and lower(trim(category)) not in ('na', 'n/a', '-', '—')
) m
where not exists (
  select 1 from public.categories c
  where c.slug = left(regexp_replace(lower(trim(m.category)), '[^a-z0-9]+', '-', 'g'), 80)
)
on conflict (slug) do nothing;

-- Link category_id when missing
update public.mezmur m
set category_id = c.id
from public.categories c
where m.category_id is null
  and m.category is not null
  and c.slug = left(regexp_replace(lower(trim(m.category)), '[^a-z0-9]+', '-', 'g'), 80);

-- ---------------------------------------------------------------------------
-- Link mezmur → occasions from mezmur.occasion text (skip NA)
-- ---------------------------------------------------------------------------
insert into public.mezmur_occasion_links (mezmur_id, occasion_id)
select m.id, o.id
from public.mezmur m
join public.mezmur_occasions o
  on (
    lower(trim(m.occasion)) = lower(o.name)
    or lower(trim(m.occasion)) = any (
      select lower(unnest(o.search_keywords))
    )
    or (
      case lower(trim(m.occasion))
        when 'gena' then 'gena'
        when 'christmas' then 'gena'
        when 'nativity' then 'gena'
        when 'timket' then 'timket'
        when 'epiphany' then 'timket'
        when 'meskel' then 'meskel'
        when 'hosanna' then 'hosanna'
        when 'siklet' then 'siklet'
        when 'tinsae' then 'tinsae'
        when 'fasika' then 'tinsae'
        when 'fasika / tinsae' then 'tinsae'
        when 'easter' then 'tinsae'
        when 'erget' then 'erget'
        when 'ascension' then 'erget'
        when 'pentecost' then 'pentecost'
        when 'debre tabor' then 'debre-tabor'
        when 'filseta' then 'filseta'
        when 'kidane mihret' then 'kidane-mihret'
        when 'lideta maryam' then 'lideta-maryam'
        when 'abiy tsom' then 'abiy-tsom'
        when 'tsome nineveh' then 'tsome-nineveh'
        when 'tsome nebiyat' then 'tsome-nebiyat'
        when 'tsome hawariat' then 'tsome-hawariat'
        when 'holy week' then 'holy-week'
        when 'new year / enkutatash' then 'new-year'
        when 'wedding' then 'wedding'
        when 'baptism' then 'baptism'
        when 'funeral / memorial' then 'funeral'
        when 'communion' then 'communion'
        when 'annual saint feast' then 'annual-saint-feast'
        when 'general / anytime' then 'general'
        when 'repentance' then 'repentance'
        when 'praise / worship' then 'praise'
        else null
      end
    ) = o.slug
  )
where m.status = 'published'
  and m.occasion is not null
  and lower(trim(m.occasion)) not in ('na', 'n/a', '', '-', '—')
on conflict do nothing;

-- Also link by category text → repentance / praise occasions when useful
insert into public.mezmur_occasion_links (mezmur_id, occasion_id)
select m.id, o.id
from public.mezmur m
join public.mezmur_occasions o on o.slug = 'repentance'
where m.status = 'published'
  and lower(trim(coalesce(m.category, ''))) = 'repentance'
on conflict do nothing;

insert into public.mezmur_occasion_links (mezmur_id, occasion_id)
select m.id, o.id
from public.mezmur m
join public.mezmur_occasions o on o.slug = 'praise'
where m.status = 'published'
  and lower(trim(coalesce(m.category, ''))) in ('praise / worship', 'praise')
on conflict do nothing;

-- ---------------------------------------------------------------------------
-- Efficient public browse counts
-- ---------------------------------------------------------------------------
create or replace view public.hymn_browse_occasions as
select
  o.id,
  o.slug,
  o.name,
  o.name_amharic,
  o.description,
  o.image_path,
  o.image_alt,
  o.sort_order,
  o.is_featured,
  count(l.mezmur_id)::int as mezmur_count
from public.mezmur_occasions o
left join public.mezmur_occasion_links l on l.occasion_id = o.id
left join public.mezmur m on m.id = l.mezmur_id and m.status = 'published'
where o.status = 'published'
group by o.id;

create or replace view public.hymn_browse_categories as
select
  c.id,
  c.slug,
  c.name,
  c.name_amharic,
  c.description,
  c.image_path,
  c.image_alt,
  c.sort_order,
  c.is_featured,
  count(m.id)::int as mezmur_count
from public.categories c
left join public.mezmur m
  on m.status = 'published'
 and (
   m.category_id = c.id
   or (
     m.category is not null
     and left(regexp_replace(lower(trim(m.category)), '[^a-z0-9]+', '-', 'g'), 80) = c.slug
   )
 )
where coalesce(c.status, 'published') = 'published'
  and coalesce(c.is_archived, false) = false
  and coalesce(c.type, 'mezmur') = 'mezmur'
group by c.id;

create or replace view public.hymn_browse_singers as
select
  s.id,
  coalesce(s.slug, left(regexp_replace(lower(trim(s.name)), '[^a-z0-9]+', '-', 'g'), 80)) as slug,
  s.name,
  s.name_amharic,
  coalesce(s.image_path, s.image_url) as image_path,
  s.image_alt,
  s.sort_order,
  s.is_featured,
  count(m.id)::int as mezmur_count
from public.singers s
left join public.mezmur m on m.singer_id = s.id and m.status = 'published'
where coalesce(s.status, 'published') = 'published'
  and coalesce(s.is_archived, false) = false
group by s.id;

grant select on public.hymn_browse_occasions to anon, authenticated;
grant select on public.hymn_browse_categories to anon, authenticated;
grant select on public.hymn_browse_singers to anon, authenticated;

commit;
