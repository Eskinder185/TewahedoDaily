-- PROPOSED - NOT APPLIED. Review before running in the Supabase SQL editor.
--
-- Adds only the canonical Mezmur category and occasion slugs (src/lib/mezmur/taxonomyAliases.ts,
-- CATEGORY_ENTRIES / OCCASION_ENTRIES) that are missing, so that the UUID-safe
-- public.set_mezmur_classification_import(uuid,text[],text[]) RPC stops rejecting them with
-- "Invalid category slug(s)" / "Invalid occasion slug(s)" (errcode 23503).
--
-- Guarantees
--   * Additive and idempotent: every row is inserted only when its slug is absent; re-running does nothing.
--   * No UPDATE, DELETE, rename, un-archive or re-parent of any existing row.
--   * Existing Mezmur assignments (mezmur_*_links_import) and published Mezmurs are never touched.
--   * Legacy slugs (e.g. new-year-enkutatash, qedus-giorgis, praise, church-worship) are left as they are.
--   * Only columns that exist in every environment are written (production categories may not have
--     status / sort_order / is_featured); the remaining columns use their table defaults.
--
-- Run this read-only check first to see exactly which slugs this migration will add, and which
-- canonical rows are archived (archived rows are still rejected by the RPC and are NOT changed here):
--   select 'category' kind, e.slug, c.slug is not null as present, coalesce(c.is_archived,false) as archived
--   from unnest(array['holy-trinity','holy-spirit','abune-tekle-haymanot','abune-gebre-menfes-kidus','kidus-yared',
--     'yohannes-metmek-john-the-baptist','kidus-estifanos-saint-stephen','cross','prayer','salvation']) e(slug)
--   left join public.categories c on c.slug = e.slug
--   union all
--   select 'occasion', e.slug, o.slug is not null, o.status = 'archived'
--   from unnest(array['tsome-nebiyat','tsome-hawariat','holy-week','new-year','baptism','funeral']) e(slug)
--   left join public.mezmur_occasions o on o.slug = e.slug
--   order by 1, 2;
begin;

-- Categories ---------------------------------------------------------------------------------
-- RLS is bypassed by the SQL editor / migration role; staff writes elsewhere use the taxonomy_manage policy.
insert into public.categories (name, name_amharic, slug, type)
select v.name, v.name_amharic, v.slug, 'mezmur'::public.cms_content_type
from (values
  ('Jesus Christ', 'ኢየሱስ ክርስቶስ', 'jesus-christ'),
  ('Virgin Mary', 'ድንግል ማርያም', 'virgin-mary'),
  ('Holy Trinity', 'ቅድስት ሥላሴ', 'holy-trinity'),
  ('Holy Spirit', 'መንፈስ ቅዱስ', 'holy-spirit'),
  ('Kidus Michael', 'ቅዱስ ሚካኤል', 'kidus-michael'),
  ('Kidus Gabriel', 'ቅዱስ ገብርኤል', 'kidus-gabriel'),
  ('Kidus Raphael', 'ቅዱስ ሩፋኤል', 'kidus-raphael'),
  ('Kidus Uriel', 'ቅዱስ ኡራኤል', 'kidus-uriel'),
  ('Kidus Giorgis', 'ቅዱስ ጊዮርጊስ', 'kidus-giorgis'),
  ('Abune Tekle Haymanot', 'አቡነ ተክለ ሃይማኖት', 'abune-tekle-haymanot'),
  ('Abune Gebre Menfes Kidus', 'አቡነ ገብረ መንፈስ ቅዱስ', 'abune-gebre-menfes-kidus'),
  ('Kidus Yared', 'ቅዱስ ያሬድ', 'kidus-yared'),
  ('Yohannes Metmek / John the Baptist', 'ዮሐንስ መጥምቅ', 'yohannes-metmek-john-the-baptist'),
  ('Kidus Estifanos / Saint Stephen', 'ቅዱስ እስጢፋኖስ', 'kidus-estifanos-saint-stephen'),
  ('Apostles', 'ሐዋርያት', 'apostles'),
  ('Martyrs', 'ሰማዕታት', 'martyrs'),
  ('Saints', 'ቅዱሳን', 'saints'),
  ('Angels', 'መላእክት', 'angels'),
  ('Prophets', 'ነቢያት', 'prophets'),
  ('Cross', 'መስቀል', 'cross'),
  ('Repentance', 'ንስሐ', 'repentance'),
  ('Praise / Worship', 'ምስጋናና አምልኮ', 'praise-worship'),
  ('Prayer', 'ጸሎት', 'prayer'),
  ('Salvation', 'ድኅነት', 'salvation'),
  ('General', 'አጠቃላይ', 'general')
) as v(name, name_amharic, slug)
where not exists (
  select 1 from public.categories c where lower(trim(c.slug)) = v.slug
)
on conflict (slug) do nothing;

-- Occasions ----------------------------------------------------------------------------------
-- Names and keywords match the existing seeds (20261002150000 / 20261002170000). New rows are
-- published, not featured, with sort_order after the existing feast order.
insert into public.mezmur_occasions (slug, name, name_amharic, sort_order, is_featured, search_keywords, status)
select v.slug, v.name, v.name_amharic, v.sort_order, false, v.keywords, 'published'
from (values
  ('gena', 'Christmas / Gena', 'ገና', 10, array['christmas','nativity','lidet','gena']),
  ('timket', 'Timkat / Epiphany', 'ጥምቀት', 20, array['timket','timkat','epiphany','baptism feast']),
  ('meskel', 'Meskel / Holy Cross', 'መስቀል', 30, array['meskel','holy cross','demera']),
  ('hosanna', 'Hosanna / Palm Sunday', 'ሆሣዕና', 40, array['hosanna','palm sunday']),
  ('siklet', 'Good Friday / Siklet', 'ስቅለት', 50, array['siklet','good friday','crucifixion']),
  ('tinsae', 'Resurrection / Tinsae', 'ትንሣኤ', 60, array['tinsae','fasika','easter','pascha','resurrection']),
  ('erget', 'Ascension / Erget', 'ዕርገት', 70, array['erget','ascension']),
  ('pentecost', 'Pentecost', 'ጰንጠቆስጤ', 80, array['pentecost']),
  ('debre-tabor', 'Transfiguration / Debre Tabor', 'ደብረ ታቦር', 90, array['debre tabor','transfiguration']),
  ('filseta', 'Filseta / Assumption', 'ፍልሰታ', 100, array['filseta','assumption']),
  ('kidane-mihret', 'Kidane Mihret', 'ኪዳነ ምሕረት', 110, array['kidane mihret','kidane mehret']),
  ('lideta-maryam', 'Lideta Maryam', 'ልደታ ማርያም', 120, array['lideta maryam','nativity of mary']),
  ('abiy-tsom', 'Abiy Tsom / Great Lent', 'ዐቢይ ጾም', 130, array['abiy tsom','great lent','hudadi']),
  ('tsome-nineveh', 'Nineveh Fast', 'ጾመ ነነዌ', 140, array['nineveh','tsome nineveh']),
  ('tsome-nebiyat', 'Fast of the Prophets', 'ጾመ ነቢያት', 150, array['tsome nebiyat']),
  ('tsome-hawariat', 'Apostles Fast', 'ጾመ ሐዋርያት', 160, array['tsome hawariat','apostles fast']),
  ('holy-week', 'Holy Week', 'ሕማማት', 170, array['holy week','himamat']),
  ('new-year', 'New Year / Enkutatash', 'እንቁጣጣሽ', 180, array['enkutatash','new year']),
  ('wedding', 'Wedding', 'ሰርግ', 190, array['wedding','marriage']),
  ('baptism', 'Baptism', 'ጥምቀት ሥርዓት', 200, array['baptism']),
  ('funeral', 'Funeral / Memorial', 'ቀብር / መታሰቢያ', 210, array['funeral','memorial']),
  ('communion', 'Communion', 'ቅዱስ ቁርባን', 220, array['communion','eucharist']),
  ('annual-saint-feast', 'Annual Saint Feast', 'ዓመታዊ የቅዱሳን በዓል', 230, array['annual saint feast']),
  ('general', 'General / Anytime', 'አጠቃላይ', 900, array['general','anytime','general worship'])
) as v(slug, name, name_amharic, sort_order, keywords)
where not exists (
  select 1 from public.mezmur_occasions o where lower(trim(o.slug)) = v.slug
)
on conflict (slug) do nothing;

-- Post-condition: every canonical slug must now exist, otherwise the whole migration rolls back.
do $$
declare
  v_missing text[];
  v_archived text[];
begin
  select array_agg(s order by s) into v_missing
  from unnest(array[
    'jesus-christ','virgin-mary','holy-trinity','holy-spirit','kidus-michael','kidus-gabriel','kidus-raphael','kidus-uriel',
    'kidus-giorgis','abune-tekle-haymanot','abune-gebre-menfes-kidus','kidus-yared','yohannes-metmek-john-the-baptist',
    'kidus-estifanos-saint-stephen','apostles','martyrs','saints','angels','prophets','cross','repentance','praise-worship',
    'prayer','salvation','general']) s
  where not exists (select 1 from public.categories c where c.slug = s);
  if v_missing is not null then
    raise exception 'Canonical category slug(s) still missing: %', array_to_string(v_missing, ', ');
  end if;

  select array_agg(s order by s) into v_missing
  from unnest(array[
    'gena','timket','meskel','hosanna','siklet','tinsae','erget','pentecost','debre-tabor','filseta','kidane-mihret',
    'lideta-maryam','abiy-tsom','tsome-nineveh','tsome-nebiyat','tsome-hawariat','holy-week','new-year','annual-saint-feast',
    'wedding','baptism','funeral','communion','general']) s
  where not exists (select 1 from public.mezmur_occasions o where o.slug = s);
  if v_missing is not null then
    raise exception 'Canonical occasion slug(s) still missing: %', array_to_string(v_missing, ', ');
  end if;

  -- Archived canonical rows are intentionally left alone (never un-archived here); report them.
  select array_agg(c.slug order by c.slug) into v_archived
  from public.categories c
  where coalesce(c.is_archived, false)
    and c.slug in ('jesus-christ','virgin-mary','holy-trinity','holy-spirit','kidus-michael','kidus-gabriel','kidus-raphael',
      'kidus-uriel','kidus-giorgis','abune-tekle-haymanot','abune-gebre-menfes-kidus','kidus-yared',
      'yohannes-metmek-john-the-baptist','kidus-estifanos-saint-stephen','apostles','martyrs','saints','angels','prophets',
      'cross','repentance','praise-worship','prayer','salvation','general');
  if v_archived is not null then
    raise notice 'Archived canonical categories still rejected by the classification RPC (not changed): %', array_to_string(v_archived, ', ');
  end if;
  select array_agg(o.slug order by o.slug) into v_archived
  from public.mezmur_occasions o where o.status = 'archived'
    and o.slug in ('gena','timket','meskel','hosanna','siklet','tinsae','erget','pentecost','debre-tabor','filseta','kidane-mihret',
      'lideta-maryam','abiy-tsom','tsome-nineveh','tsome-nebiyat','tsome-hawariat','holy-week','new-year','annual-saint-feast',
      'wedding','baptism','funeral','communion','general');
  if v_archived is not null then
    raise notice 'Archived canonical occasions still rejected by the classification RPC (not changed): %', array_to_string(v_archived, ', ');
  end if;
end $$;

commit;
