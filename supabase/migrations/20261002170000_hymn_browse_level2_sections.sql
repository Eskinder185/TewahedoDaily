-- Hymns Practice Level-2 browse sections (hymn_browse_group_items).
-- Does NOT recreate major hymn_browse_groups.
-- Does NOT duplicate mezmur rows.
-- Resolves groups by slug; links to existing mezmur_occasions / categories when present.
-- Uniqueness is already (browse_group_id, item_type, item_slug) — same concept may appear
-- under multiple major groups (e.g. filseta under holidays-feasts AND virgin-mary).

begin;

-- ---------------------------------------------------------------------------
-- 1) Verify major collections exist (do not invent new major folders)
-- ---------------------------------------------------------------------------
do $$
declare
  missing text[];
begin
  select array_agg(x.slug order by x.slug)
  into missing
  from (
    values
      ('holidays-feasts'),
      ('angels-saints'),
      ('virgin-mary'),
      ('jesus-christ'),
      ('repentance-fasting'),
      ('english-mezmur'),
      ('sacraments-church-life'),
      ('praise-general'),
      ('zemari-singers')
  ) as x(slug)
  left join public.hymn_browse_groups g on g.slug = x.slug
  where g.id is null;

  if missing is not null then
    raise exception
      'Missing major hymn_browse_groups (create majors first): %',
      array_to_string(missing, ', ');
  end if;
end $$;

-- ---------------------------------------------------------------------------
-- 2) Ensure taxonomy entities exist (idempotent; no mezmur duplication)
-- ---------------------------------------------------------------------------

-- Occasions (canonical slugs used by public /practice/occasion/:slug routes)
insert into public.mezmur_occasions (slug, name, name_amharic, sort_order, is_featured, search_keywords, status)
values
  ('gena', 'Christmas / Gena', 'ገና', 10, true, array['christmas','nativity','lidet','gena'], 'published'),
  ('timket', 'Timkat / Epiphany', 'ጥምቀት', 20, true, array['timket','timkat','epiphany','baptism feast'], 'published'),
  ('meskel', 'Meskel / Holy Cross', 'መስቀል', 30, true, array['meskel','holy cross','demera'], 'published'),
  ('hosanna', 'Hosanna / Palm Sunday', 'ሆሣዕና', 40, true, array['hosanna','palm sunday'], 'published'),
  ('siklet', 'Good Friday / Siklet', 'ስቅለት', 50, true, array['siklet','good friday','crucifixion','passion'], 'published'),
  ('tinsae', 'Resurrection / Tinsae', 'ትንሣኤ', 60, true, array['tinsae','fasika','easter','pascha','resurrection'], 'published'),
  ('erget', 'Ascension / Erget', 'ዕርገት', 70, false, array['erget','ascension'], 'published'),
  ('pentecost', 'Pentecost', 'ጰንጠቆስጤ', 80, false, array['pentecost'], 'published'),
  ('debre-tabor', 'Transfiguration / Debre Tabor', 'ደብረ ታቦር', 90, false, array['debre tabor','transfiguration'], 'published'),
  ('filseta', 'Filseta / Assumption', 'ፍልሰታ', 100, true, array['filseta','assumption'], 'published'),
  ('lideta-maryam', 'Lideta Maryam', 'ልደታ ማርያም', 120, false, array['lideta maryam','nativity of mary'], 'published'),
  ('abiy-tsom', 'Abiy Tsom / Great Lent', 'ዐቢይ ጾም', 130, true, array['abiy tsom','great lent','hudadi'], 'published'),
  ('tsome-nineveh', 'Nineveh Fast', 'ጾመ ነነዌ', 140, false, array['nineveh','tsome nineveh'], 'published'),
  ('holy-week', 'Holy Week', 'ሕማማት', 170, true, array['holy week','himamat'], 'published'),
  ('new-year', 'New Year / Enkutatash', 'እንቁጣጣሽ', 180, true, array['enkutatash','new year'], 'published'),
  ('wedding', 'Wedding', 'ሰርግ', 190, true, array['wedding','marriage'], 'published'),
  ('baptism', 'Baptism', 'ጥምቀት ሥርዓት', 200, false, array['baptism'], 'published'),
  ('funeral', 'Funeral / Memorial', 'ቀብር / መታሰቢያ', 210, false, array['funeral','memorial'], 'published'),
  ('communion', 'Communion', 'ቅዱስ ቁርባን', 220, false, array['communion','eucharist'], 'published'),
  ('short-hymns', 'Short Hymns', 'አጭር መዝሙራት', 15, true, array['short','short hymns'], 'published'),
  ('sunday-school', 'Sunday School', 'ሰንበት ትምህርት ቤት', 25, true, array['sunday school','children'], 'published'),
  ('repentance', 'Repentance', 'ንስሐ', 35, true, array['repentance','confession'], 'published'),
  ('praise', 'Praise', 'ምስጋና', 45, true, array['praise','worship'], 'published'),
  ('general', 'General / Anytime', 'አጠቃላይ', 900, false, array['general','anytime','general worship'], 'published'),
  ('bisrate-gabriel', 'Annunciation / Bisrate Gabriel', null, 105, true, array['bisrate gabriel','annunciation','tsinset'], 'published'),
  ('wednesday-friday', 'Wednesday & Friday', null, 145, false, array['wednesday friday','tsome gehad','weekly fast'], 'published'),
  ('general-fasting', 'General Fasting', null, 146, false, array['fasting','tsom','fast'], 'published'),
  ('marian-feasts', 'Other Marian Feasts', null, 125, false, array['marian feasts','mary feast'], 'published'),
  ('church-worship', 'Church Worship', null, 230, false, array['church worship','liturgy worship'], 'published'),
  ('children-youth', 'Children & Youth', null, 240, false, array['children','youth','kids'], 'published'),
  ('holiday-wereb', 'Various Holidays Wereb', null, 55, false, array['holiday wereb','wereb feast'], 'published')
on conflict (slug) do update set
  name = excluded.name,
  name_amharic = coalesce(public.mezmur_occasions.name_amharic, excluded.name_amharic),
  search_keywords = (
    select array_agg(distinct k)
    from unnest(coalesce(public.mezmur_occasions.search_keywords, '{}'::text[]) || excluded.search_keywords) as k
  ),
  updated_at = now();

-- Categories for saints / subjects (slug unique globally on categories)
insert into public.categories (name, name_amharic, slug, description, type, sort_order, status, is_featured)
values
  ('St. Michael', null, 'kidus-michael', null, 'mezmur', 10, 'published', true),
  ('St. Gabriel', null, 'kidus-gabriel', null, 'mezmur', 20, 'published', true),
  ('St. Uriel', null, 'kidus-uriel', null, 'mezmur', 25, 'published', false),
  ('St. Raphael', null, 'kidus-raphael', null, 'mezmur', 26, 'published', false),
  ('St. George', null, 'kidus-giorgis', null, 'mezmur', 30, 'published', true),
  ('St. Arsema', null, 'kidist-arsema', null, 'mezmur', 35, 'published', false),
  ('Apostles', null, 'apostles', null, 'mezmur', 40, 'published', false),
  ('Martyrs', null, 'martyrs', null, 'mezmur', 45, 'published', false),
  ('Prophets', null, 'prophets', null, 'mezmur', 50, 'published', false),
  ('Saints', null, 'saints', null, 'mezmur', 60, 'published', true),
  ('Angels', null, 'angels', null, 'mezmur', 55, 'published', true),
  ('Virgin Mary', null, 'virgin-mary', null, 'mezmur', 15, 'published', true),
  ('Jesus Christ', null, 'jesus-christ', null, 'mezmur', 5, 'published', true),
  ('Repentance', null, 'repentance', null, 'mezmur', 70, 'published', true),
  ('Praise / Worship', null, 'praise-worship', null, 'mezmur', 80, 'published', true),
  ('General', null, 'general', null, 'mezmur', 90, 'published', false),
  ('Wereb', null, 'wereb', null, 'mezmur', 85, 'published', false)
on conflict (slug) do update set
  name = coalesce(nullif(trim(public.categories.name), ''), excluded.name),
  status = case
    when public.categories.status = 'archived' then public.categories.status
    else 'published'
  end,
  updated_at = now();

-- ---------------------------------------------------------------------------
-- 3) Upsert helper — preserves CMS image/description overrides
-- ---------------------------------------------------------------------------
create or replace function cms_private.upsert_hymn_browse_item(
  p_group_slug text,
  p_item_type text,
  p_item_slug text,
  p_sort integer,
  p_display_title text default null,
  p_display_amharic text default null,
  p_description text default null,
  p_image_path text default null,
  p_image_alt text default null,
  p_status text default 'published'
) returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  g_id uuid;
  linked_id uuid;
  v_status text := coalesce(nullif(trim(p_status), ''), 'published');
begin
  select id into g_id from public.hymn_browse_groups where slug = p_group_slug;
  if g_id is null then
    return;
  end if;

  linked_id := null;
  if p_item_type = 'occasion' then
    select id into linked_id from public.mezmur_occasions where slug = p_item_slug limit 1;
  elsif p_item_type = 'category' then
    select id into linked_id from public.categories where slug = p_item_slug limit 1;
  elsif p_item_type = 'singer' then
    select id into linked_id from public.singers where slug = p_item_slug limit 1;
  elsif p_item_type = 'tag' then
    select id into linked_id from public.tags where slug = p_item_slug limit 1;
  end if;

  -- Occasion/category/singer/tag require a live taxonomy row
  if p_item_type in ('occasion', 'category', 'singer', 'tag') and linked_id is null then
    raise notice 'Skip browse item %/% — taxonomy missing for %', p_group_slug, p_item_slug, p_item_type;
    return;
  end if;

  update public.hymn_browse_group_items i
  set
    item_id = coalesce(linked_id, i.item_id),
    display_title = coalesce(i.display_title, p_display_title),
    display_title_amharic = coalesce(i.display_title_amharic, p_display_amharic),
    description = coalesce(i.description, p_description),
    image_path = coalesce(i.image_path, p_image_path),
    image_alt = coalesce(i.image_alt, p_image_alt),
    sort_order = p_sort,
    status = case
      when i.status = 'archived' then i.status
      else v_status
    end,
    updated_at = now()
  where i.browse_group_id = g_id
    and i.item_type = p_item_type
    and i.item_slug = p_item_slug;

  if not found then
    insert into public.hymn_browse_group_items (
      browse_group_id, item_type, item_id, item_slug,
      display_title, display_title_amharic, description,
      image_path, image_alt, sort_order, status
    )
    values (
      g_id, p_item_type, linked_id, p_item_slug,
      p_display_title, p_display_amharic, p_description,
      p_image_path, p_image_alt, p_sort, v_status
    );
  end if;
end;
$$;

revoke all on function cms_private.upsert_hymn_browse_item(text, text, text, integer, text, text, text, text, text, text) from public;
grant execute on function cms_private.upsert_hymn_browse_item(text, text, text, integer, text, text, text, text, text, text) to authenticated, service_role;

-- Keep older 6-arg signature working
create or replace function cms_private.upsert_hymn_browse_item(
  p_group_slug text,
  p_item_type text,
  p_item_slug text,
  p_sort integer,
  p_display_title text default null,
  p_display_amharic text default null
) returns void
language plpgsql
security definer
set search_path = public
as $$
begin
  perform cms_private.upsert_hymn_browse_item(
    p_group_slug, p_item_type, p_item_slug, p_sort,
    p_display_title, p_display_amharic, null, null, null, 'published'
  );
end;
$$;

revoke all on function cms_private.upsert_hymn_browse_item(text, text, text, integer, text, text) from public;
grant execute on function cms_private.upsert_hymn_browse_item(text, text, text, integer, text, text) to authenticated, service_role;

-- ---------------------------------------------------------------------------
-- 4) Ensure unique (collection-scoped) index — already preferred shape
-- ---------------------------------------------------------------------------
create unique index if not exists hymn_browse_group_items_unique_link_idx
  on public.hymn_browse_group_items (browse_group_id, item_type, item_slug)
  where item_slug is not null and status <> 'archived';

create index if not exists hymn_browse_group_items_slug_idx
  on public.hymn_browse_group_items (item_slug)
  where item_slug is not null;

create index if not exists hymn_browse_group_items_status_idx
  on public.hymn_browse_group_items (browse_group_id, status, sort_order);

-- ---------------------------------------------------------------------------
-- 5) Level-2 sections — item_slug = canonical taxonomy slug (routes stay valid)
--    Display titles match product language. Zemari: no singer rows (dynamic).
-- ---------------------------------------------------------------------------

-- Holidays & Feasts
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','meskel',10,'Meskel / Holy Cross',null,null,'hymns/sections/meskel.webp','Meskel / Holy Cross');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','hosanna',20,'Hosanna / Palm Sunday',null,null,'hymns/sections/hosanna.webp','Hosanna / Palm Sunday');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','new-year',30,'Enkutatash / New Year',null,null,'hymns/sections/enkutatash.webp','Enkutatash / New Year');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','gena',40,'Gena / Christmas',null,null,'hymns/sections/gena.webp','Gena / Christmas');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','timket',50,'Timkat / Epiphany',null,null,'hymns/sections/timkat.webp','Timkat / Epiphany');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','tinsae',60,'Tinsae / Resurrection',null,null,'hymns/sections/tinsae.webp','Tinsae / Resurrection');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','debre-tabor',70,'Debre Tabor / Transfiguration',null,null,'hymns/sections/debre-tabor.webp','Debre Tabor / Transfiguration');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','filseta',80,'Filseta',null,null,'hymns/sections/filseta.webp','Filseta');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','erget',90,'Ascension',null,null,'hymns/sections/ascension.webp','Ascension');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','pentecost',100,'Pentecost',null,null,'hymns/sections/pentecost.webp','Pentecost');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','holy-week',110,'Holy Week',null,null,'hymns/sections/holy-week.webp','Holy Week');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','siklet',120,'Good Friday',null,null,'hymns/sections/good-friday.webp','Good Friday');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','bisrate-gabriel',130,'Annunciation / Bisrate Gabriel',null,null,'hymns/sections/bisrate-gabriel.webp','Annunciation / Bisrate Gabriel');
select cms_private.upsert_hymn_browse_item('holidays-feasts','occasion','tsome-nineveh',140,'Nineveh',null,null,'hymns/sections/nineveh.webp','Nineveh');

-- Angels & Saints
select cms_private.upsert_hymn_browse_item('angels-saints','category','kidus-michael',10,'St. Michael',null,null,'hymns/sections/st-michael.webp','St. Michael');
select cms_private.upsert_hymn_browse_item('angels-saints','category','kidus-gabriel',20,'St. Gabriel',null,null,'hymns/sections/st-gabriel.webp','St. Gabriel');
select cms_private.upsert_hymn_browse_item('angels-saints','category','kidus-uriel',30,'St. Uriel',null,null,'hymns/sections/st-uriel.webp','St. Uriel');
select cms_private.upsert_hymn_browse_item('angels-saints','category','kidus-raphael',40,'St. Raphael',null,null,'hymns/sections/st-raphael.webp','St. Raphael');
select cms_private.upsert_hymn_browse_item('angels-saints','category','kidus-giorgis',50,'St. George',null,null,'hymns/sections/st-george.webp','St. George');
select cms_private.upsert_hymn_browse_item('angels-saints','category','kidist-arsema',60,'St. Arsema',null,null,'hymns/sections/st-arsema.webp','St. Arsema');
select cms_private.upsert_hymn_browse_item('angels-saints','category','apostles',70,'Apostles',null,null,'hymns/sections/apostles.webp','Apostles');
select cms_private.upsert_hymn_browse_item('angels-saints','category','martyrs',80,'Martyrs',null,null,'hymns/sections/martyrs.webp','Martyrs');
select cms_private.upsert_hymn_browse_item('angels-saints','category','prophets',90,'Prophets',null,null,'hymns/sections/prophets.webp','Prophets');
select cms_private.upsert_hymn_browse_item('angels-saints','category','saints',100,'General Saints',null,null,'hymns/sections/general-saints.webp','General Saints');
select cms_private.upsert_hymn_browse_item('angels-saints','category','angels',110,'Holy Angels',null,null,'hymns/sections/holy-angels.webp','Holy Angels');

-- Virgin Mary (filseta + bisrate-gabriel intentionally overlap holidays)
select cms_private.upsert_hymn_browse_item('virgin-mary','category','virgin-mary',10,'St. Mary Praise',null,null,'hymns/sections/mary-general.webp','St. Mary Praise');
select cms_private.upsert_hymn_browse_item('virgin-mary','occasion','lideta-maryam',20,'Lideta Maryam',null,null,'hymns/sections/lideta-maryam.webp','Lideta Maryam');
select cms_private.upsert_hymn_browse_item('virgin-mary','occasion','filseta',30,'Filseta',null,null,'hymns/sections/filseta.webp','Filseta');
select cms_private.upsert_hymn_browse_item('virgin-mary','occasion','bisrate-gabriel',40,'Annunciation / Bisrate Gabriel',null,null,'hymns/sections/bisrate-gabriel.webp','Annunciation / Bisrate Gabriel');
select cms_private.upsert_hymn_browse_item('virgin-mary','occasion','marian-feasts',50,'Other Marian Feasts',null,null,'hymns/sections/marian-feasts.webp','Other Marian Feasts');

-- Jesus Christ
select cms_private.upsert_hymn_browse_item('jesus-christ','category','jesus-christ',10,'Praise of Christ',null,null,'hymns/sections/christ-general.webp','Praise of Christ');
select cms_private.upsert_hymn_browse_item('jesus-christ','occasion','gena',20,'Nativity / Gena',null,null,'hymns/sections/gena.webp','Nativity / Gena');
select cms_private.upsert_hymn_browse_item('jesus-christ','occasion','timket',30,'Baptism / Timkat',null,null,'hymns/sections/timkat.webp','Baptism / Timkat');
select cms_private.upsert_hymn_browse_item('jesus-christ','occasion','hosanna',40,'Hosanna',null,null,'hymns/sections/hosanna.webp','Hosanna');
select cms_private.upsert_hymn_browse_item('jesus-christ','occasion','siklet',50,'Passion / Crucifixion',null,null,'hymns/sections/good-friday.webp','Passion / Crucifixion');
select cms_private.upsert_hymn_browse_item('jesus-christ','occasion','tinsae',60,'Resurrection / Tinsae',null,null,'hymns/sections/tinsae.webp','Resurrection / Tinsae');
select cms_private.upsert_hymn_browse_item('jesus-christ','occasion','erget',70,'Ascension',null,null,'hymns/sections/ascension.webp','Ascension');
select cms_private.upsert_hymn_browse_item('jesus-christ','occasion','debre-tabor',80,'Transfiguration / Debre Tabor',null,null,'hymns/sections/debre-tabor.webp','Transfiguration / Debre Tabor');

-- Repentance & Fasting
select cms_private.upsert_hymn_browse_item('repentance-fasting','category','repentance',10,'Repentance',null,null,'hymns/sections/repentance.webp','Repentance');
select cms_private.upsert_hymn_browse_item('repentance-fasting','occasion','abiy-tsom',20,'Abiy Tsom',null,null,'hymns/sections/abiy-tsom.webp','Abiy Tsom');
select cms_private.upsert_hymn_browse_item('repentance-fasting','occasion','tsome-nineveh',30,'Nineveh',null,null,'hymns/sections/nineveh.webp','Nineveh');
select cms_private.upsert_hymn_browse_item('repentance-fasting','occasion','wednesday-friday',40,'Wednesday & Friday',null,null,'hymns/sections/wednesday-friday.webp','Wednesday & Friday');
select cms_private.upsert_hymn_browse_item('repentance-fasting','occasion','holy-week',50,'Holy Week',null,null,'hymns/sections/holy-week.webp','Holy Week');
select cms_private.upsert_hymn_browse_item('repentance-fasting','occasion','general-fasting',60,'General Fasting',null,null,'hymns/sections/general-fasting.webp','General Fasting');

-- English Mezmur (language facets — no mezmur row duplication)
select cms_private.upsert_hymn_browse_item('english-mezmur','language','english',10,'English',null,null,'hymns/sections/english.webp','English');
select cms_private.upsert_hymn_browse_item('english-mezmur','language','bilingual',20,'Bilingual',null,null,'hymns/sections/bilingual.webp','Bilingual');

-- Sacraments & Church Life
select cms_private.upsert_hymn_browse_item('sacraments-church-life','occasion','wedding',10,'Wedding',null,null,'hymns/sections/wedding.webp','Wedding');
select cms_private.upsert_hymn_browse_item('sacraments-church-life','occasion','communion',20,'Communion',null,null,'hymns/sections/communion.webp','Communion');
select cms_private.upsert_hymn_browse_item('sacraments-church-life','occasion','baptism',30,'Baptism',null,null,'hymns/sections/baptism.webp','Baptism');
select cms_private.upsert_hymn_browse_item('sacraments-church-life','occasion','funeral',40,'Funeral',null,null,'hymns/sections/funeral.webp','Funeral');
select cms_private.upsert_hymn_browse_item('sacraments-church-life','occasion','sunday-school',50,'Sunday School',null,null,'hymns/sections/sunday-school.webp','Sunday School');
select cms_private.upsert_hymn_browse_item('sacraments-church-life','occasion','church-worship',60,'Church Worship',null,null,'hymns/sections/church-worship.webp','Church Worship');
select cms_private.upsert_hymn_browse_item('sacraments-church-life','occasion','children-youth',70,'Children & Youth',null,null,'hymns/sections/children-youth.webp','Children & Youth');

-- Praise & General
select cms_private.upsert_hymn_browse_item('praise-general','category','praise-worship',10,'General Praise',null,null,'hymns/sections/general-praise.webp','General Praise');
select cms_private.upsert_hymn_browse_item('praise-general','occasion','short-hymns',20,'Short Hymns',null,null,'hymns/sections/short-hymns.webp','Short Hymns');
select cms_private.upsert_hymn_browse_item('praise-general','category','wereb',30,'Wereb',null,null,'hymns/sections/wereb.webp','Wereb');
select cms_private.upsert_hymn_browse_item('praise-general','occasion','sunday-school',40,'Sunday School',null,null,'hymns/sections/sunday-school.webp','Sunday School');
select cms_private.upsert_hymn_browse_item('praise-general','occasion','holiday-wereb',50,'Various Holidays Wereb',null,null,'hymns/sections/holiday-wereb.webp','Various Holidays Wereb');
select cms_private.upsert_hymn_browse_item('praise-general','category','general',60,'General Worship',null,null,'hymns/sections/general-worship.webp','General Worship');

-- Zemari / Singers: intentionally NO browse_group_items — public UI uses singers table

-- ---------------------------------------------------------------------------
-- 6) Refresh children view (same definition; ensures grants after re-run)
-- ---------------------------------------------------------------------------
create or replace view public.hymn_browse_group_children as
select
  g.id as browse_group_id,
  g.slug as browse_group_slug,
  i.id as item_id_row,
  i.item_type,
  i.item_id,
  i.item_slug,
  coalesce(
    nullif(trim(i.display_title), ''),
    o.name,
    c.name,
    s.name,
    case when i.item_type = 'language' then initcap(replace(coalesce(i.item_slug, ''), '-', ' ')) end,
    i.item_slug,
    'Collection'
  ) as title,
  coalesce(
    nullif(trim(i.display_title_amharic), ''),
    o.name_amharic,
    c.name_amharic,
    s.name_amharic
  ) as title_amharic,
  coalesce(nullif(trim(i.description), ''), o.description, c.description) as description,
  coalesce(i.image_path, o.image_path, c.image_path, s.image_path, s.image_url) as image_path,
  coalesce(i.image_alt, o.image_alt, c.image_alt, s.image_alt) as image_alt,
  i.sort_order,
  case
    when i.item_type = 'occasion' then coalesce((
      select count(*)::int from public.mezmur_occasion_links l
      join public.mezmur m on m.id = l.mezmur_id and m.status = 'published'
      where l.occasion_id = coalesce(i.item_id, o.id)
    ), 0)
    when i.item_type = 'category' then coalesce((
      select count(*)::int from public.mezmur m
      where m.status = 'published'
        and (
          m.category_id = coalesce(i.item_id, c.id)
          or left(regexp_replace(lower(trim(coalesce(m.category, ''))), '[^a-z0-9]+', '-', 'g'), 80)
            = coalesce(i.item_slug, c.slug)
        )
    ), 0)
    when i.item_type = 'singer' then coalesce((
      select count(*)::int from public.mezmur m
      where m.status = 'published' and m.singer_id = coalesce(i.item_id, s.id)
    ), 0)
    when i.item_type = 'language' and lower(coalesce(i.item_slug, '')) = 'english' then (
      select count(*)::int from public.mezmur m
      where m.status = 'published' and lower(coalesce(m.language, '')) = 'english'
    )
    when i.item_type = 'language' then (
      select count(*)::int from public.mezmur m
      where m.status = 'published'
        and lower(coalesce(m.language, '')) in ('bilingual', 'both', 'amharic-english')
    )
    else 0
  end as mezmur_count,
  case
    when i.item_type = 'occasion' then '/practice/occasion/' || coalesce(i.item_slug, o.slug)
    when i.item_type = 'category' then '/practice/category/' || coalesce(i.item_slug, c.slug)
    when i.item_type = 'singer' then '/practice/singer/' || coalesce(i.item_slug, s.slug)
    when i.item_type = 'language' then '/practice?language=' || coalesce(i.item_slug, 'english')
    else '/practice/browse/' || g.slug
  end as href
from public.hymn_browse_group_items i
join public.hymn_browse_groups g on g.id = i.browse_group_id
left join public.mezmur_occasions o
  on i.item_type = 'occasion' and (o.id = i.item_id or o.slug = i.item_slug)
left join public.categories c
  on i.item_type = 'category' and (c.id = i.item_id or c.slug = i.item_slug)
left join public.singers s
  on i.item_type = 'singer' and (s.id = i.item_id or s.slug = i.item_slug)
where i.status = 'published'
  and g.status = 'published';

grant select on public.hymn_browse_group_children to anon, authenticated;

-- Optional report
do $$
declare
  r record;
begin
  raise notice '--- Level-2 section counts by major group ---';
  for r in
    select g.slug, count(i.id) as sections
    from public.hymn_browse_groups g
    left join public.hymn_browse_group_items i
      on i.browse_group_id = g.id and i.status <> 'archived'
    where g.slug in (
      'holidays-feasts','angels-saints','virgin-mary','jesus-christ',
      'repentance-fasting','english-mezmur','sacraments-church-life',
      'praise-general','zemari-singers'
    )
    group by g.slug
    order by g.slug
  loop
    raise notice '% → % section(s)', r.slug, r.sections;
  end loop;
end $$;

commit;
