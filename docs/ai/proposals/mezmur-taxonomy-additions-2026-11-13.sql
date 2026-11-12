-- PROPOSAL ONLY: not applied anywhere and not in supabase/migrations. Review, then promote with a timestamped name.
--
-- Adds the new canonical Mezmur categories (important saints and figures) and occasions (seasons) that the admin
-- pickers now list (src/lib/mezmur/taxonomyAliases.ts, CATEGORY_ENTRIES / OCCASION_ENTRIES). Until these rows exist,
-- the editor shows each one as "not set up yet" and does not let it be chosen, because the classification RPC
-- rejects slugs that have no row ("Invalid category slug(s)" / "Invalid occasion slug(s)").
--
-- Guarantees
--   * Additive and idempotent: a row is inserted only when its slug is absent; re-running does nothing.
--   * No UPDATE, DELETE, rename, un-archive or re-parent of any existing row.
--   * Existing Mezmur assignments and published Mezmurs are never touched.
--   * Same columns as 20261101130000_mezmur_canonical_taxonomy_slugs.sql (the only ones present in every environment).
--
-- Read-only check first: which of these already exist (live read on 2026-11-13: kidist-arsema exists as a category;
-- none of the three occasions exist):
--   select e.slug, c.slug is not null as present from unnest(array['kidus-petros','kidus-pawlos','kidus-yohannes-wengelawi',
--     'kidus-markos','abune-aregawi','kidus-lalibela','kidist-arsema','kidus-merkorios','kidus-tewodros','nine-saints']) e(slug)
--     left join public.categories c on c.slug = e.slug order by 1;
--   select e.slug, o.slug is not null as present from unnest(array['tsige','tsome-gehad','hidar-tsion']) e(slug)
--     left join public.mezmur_occasions o on o.slug = e.slug order by 1;
begin;

insert into public.categories (name, name_amharic, slug, type)
select v.name, v.name_amharic, v.slug, 'mezmur'::public.cms_content_type
from (values
  ('Kidus Petros / Saint Peter', 'ቅዱስ ጴጥሮስ', 'kidus-petros'),
  ('Kidus Pawlos / Saint Paul', 'ቅዱስ ጳውሎስ', 'kidus-pawlos'),
  ('Kidus Yohannes Wengelawi / John the Evangelist', 'ቅዱስ ዮሐንስ ወንጌላዊ', 'kidus-yohannes-wengelawi'),
  ('Kidus Markos / Saint Mark', 'ቅዱስ ማርቆስ', 'kidus-markos'),
  ('Abune Aregawi', 'አቡነ አረጋዊ', 'abune-aregawi'),
  ('Kidus Lalibela', 'ቅዱስ ላሊበላ', 'kidus-lalibela'),
  ('Kidist Arsema', 'ቅድስት አርሴማ', 'kidist-arsema'),
  ('Kidus Merkorios', 'ቅዱስ መርቆሬዎስ', 'kidus-merkorios'),
  ('Kidus Tewodros / Saint Theodore', 'ቅዱስ ቴዎድሮስ', 'kidus-tewodros'),
  ('Nine Saints', 'ዘጠኙ ቅዱሳን', 'nine-saints')
) as v(name, name_amharic, slug)
where not exists (select 1 from public.categories c where lower(trim(c.slug)) = v.slug)
on conflict (slug) do nothing;

insert into public.mezmur_occasions (slug, name, name_amharic, sort_order, is_featured, search_keywords, status)
select v.slug, v.name, v.name_amharic, v.sort_order, false, v.keywords, 'published'
from (values
  ('tsige', 'Tsige (Flower Season / Fast)', 'ጽጌ', 235, array['tsige','tsome tsige','tsige dingil','flower season']),
  ('tsome-gehad', 'Tsome Gehad', 'ጾመ ገሃድ', 165, array['tsome gehad','gehad','eve of epiphany']),
  ('hidar-tsion', 'Hidar Tsion / Tsion Maryam', 'ጽዮን ማርያም', 236, array['hidar tsion','tsion maryam','mary of zion'])
) as v(slug, name, name_amharic, sort_order, keywords)
where not exists (select 1 from public.mezmur_occasions o where lower(trim(o.slug)) = v.slug)
on conflict (slug) do nothing;

-- Post-condition: every slug above must exist now, otherwise everything rolls back.
do $$
declare v_missing text[];
begin
  select array_agg(s order by s) into v_missing
  from unnest(array['kidus-petros','kidus-pawlos','kidus-yohannes-wengelawi','kidus-markos','abune-aregawi','kidus-lalibela',
    'kidist-arsema','kidus-merkorios','kidus-tewodros','nine-saints']) s
  where not exists (select 1 from public.categories c where c.slug = s);
  if v_missing is not null then raise exception 'Category slug(s) still missing: %', array_to_string(v_missing, ', '); end if;
  select array_agg(s order by s) into v_missing
  from unnest(array['tsige','tsome-gehad','hidar-tsion']) s
  where not exists (select 1 from public.mezmur_occasions o where o.slug = s);
  if v_missing is not null then raise exception 'Occasion slug(s) still missing: %', array_to_string(v_missing, ', '); end if;
end $$;

commit;

-- Rollback (only if nothing links to them yet):
--   delete from public.mezmur_occasions where slug in ('tsige','tsome-gehad','hidar-tsion');
--   delete from public.categories where slug in ('kidus-petros','kidus-pawlos','kidus-yohannes-wengelawi','kidus-markos',
--     'abune-aregawi','kidus-lalibela','kidus-merkorios','kidus-tewodros','nine-saints');   -- keep kidist-arsema: it already existed
