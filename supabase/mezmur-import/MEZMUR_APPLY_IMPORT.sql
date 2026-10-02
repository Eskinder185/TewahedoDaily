-- MEZMUR_APPLY_IMPORT.sql
-- Moves VALIDATED staging rows into permanent tables.
--
-- DO NOT RUN until:
--   1) supabase/migrations/20261002180000_hymn_collections_sections.sql applied
--   2) MEZMUR_STAGING_SCHEMA.sql applied
--   3) six CSVs loaded into public.mezmur_*_import
--   4) MEZMUR_IMPORT_VALIDATION.sql shows all F_zero_required.n = 0
--
-- Default behavior (safe):
--   - upsert hymn_collections / hymn_sections
--   - upsert mezmur_section_links
--   - insert mezmur_occasion_links (no duplicates)
--   - fill mezmur.category_id ONLY when currently null
--   - do NOT insert new mezmur rows
--   - do NOT overwrite existing mezmur editorial fields
--
-- Optional metadata mode:
--   select public.apply_mezmur_staging_import(true);
--   Updates nonblank staged mezmur fields and still never invents mezmur rows.
--
-- This file defines the apply function and a guarded one-shot CALL block that
-- is commented out. Inspect first; then uncomment to execute.

begin;

create or replace function public.apply_mezmur_staging_import(
  p_apply_mezmur_updates boolean default false
)
returns jsonb
language plpgsql
security definer
set search_path = public
as $$
declare
  v_collections integer := 0;
  v_sections integer := 0;
  v_parents integer := 0;
  v_section_links integer := 0;
  v_occasion_links integer := 0;
  v_category_fills integer := 0;
  v_mezmur_updates integer := 0;
  v_blocker integer := 0;
begin
  if to_regclass('public.hymn_collections') is null
     or to_regclass('public.hymn_sections') is null
     or to_regclass('public.mezmur_section_links') is null then
    raise exception
      'Permanent hymn tables missing. Apply supabase/migrations/20261002180000_hymn_collections_sections.sql first.';
  end if;

  -- Hard blockers (same families as validation F_zero_required).
  select count(*) into v_blocker from (
    select 1 from public.mezmur_collections_import
    where nullif(trim(collection_slug), '') is not null
    group by trim(collection_slug) having count(*) > 1
  ) x;
  if v_blocker > 0 then
    raise exception 'Blocked: duplicate collection_slug in mezmur_collections_import';
  end if;

  select count(*) into v_blocker from (
    select 1 from public.mezmur_sections_import
    where nullif(trim(section_slug), '') is not null
    group by trim(section_slug) having count(*) > 1
  ) x;
  if v_blocker > 0 then
    raise exception 'Blocked: duplicate section_slug in mezmur_sections_import';
  end if;

  select count(*) into v_blocker from (
    select 1 from public.mezmur_data_import
    where nullif(trim(slug), '') is not null
    group by trim(slug) having count(*) > 1
  ) x;
  if v_blocker > 0 then
    raise exception 'Blocked: duplicate slug in mezmur_data_import';
  end if;

  select count(*) into v_blocker
  from public.mezmur_section_links_import l
  left join public.mezmur m on m.slug = trim(l.mezmur_slug)
  where m.id is null;
  if v_blocker > 0 then
    raise exception
      'Blocked: % section-link rows reference mezmur_slug values missing in public.mezmur. Re-run MEZMUR_IMPORT_VALIDATION.sql.',
      v_blocker;
  end if;

  select count(*) into v_blocker
  from public.mezmur_section_links_import l
  left join public.mezmur_sections_import s on trim(s.section_slug) = trim(l.section_slug)
  where s.section_slug is null;
  if v_blocker > 0 then
    raise exception
      'Blocked: % section-link rows reference section_slug values missing in mezmur_sections_import.',
      v_blocker;
  end if;

  select count(*) into v_blocker
  from public.mezmur_occasion_links_import l
  left join public.mezmur_occasions o on o.slug = trim(l.occasion_slug)
  where o.id is null;
  if v_blocker > 0 then
    raise exception
      'Blocked: % occasion-link rows reference unknown occasion_slug values.',
      v_blocker;
  end if;

  -- ------------------------------------------------------------------------
  -- Collections → public.hymn_collections
  -- Preserve existing image_path / image_alt / sort_order / is_featured when
  -- staging cell is blank; never invent blank over intentional CMS values.
  -- ------------------------------------------------------------------------
  insert into public.hymn_collections (
    id, slug, title, title_amharic, description, description_amharic,
    image_path, image_alt, collection_type, sort_order, is_featured, status
  )
  select
    coalesce(nullif(trim(s.collection_id), '')::uuid, gen_random_uuid()),
    trim(s.collection_slug),
    trim(s.title),
    nullif(trim(s.title_amharic), ''),
    nullif(trim(s.description), ''),
    nullif(trim(s.description_amharic), ''),
    nullif(trim(s.image_path), ''),
    nullif(trim(s.image_alt), ''),
    trim(s.collection_type),
    coalesce(nullif(trim(s.sort_order), '')::integer, 0),
    case lower(trim(coalesce(s.is_featured, '')))
      when 'true' then true when 't' then true when '1' then true when 'yes' then true
      else false
    end,
    coalesce(nullif(trim(s.status), ''), 'draft')
  from public.mezmur_collections_import s
  where nullif(trim(s.collection_slug), '') is not null
    and nullif(trim(s.title), '') is not null
  on conflict (slug) do update set
    title = excluded.title,
    title_amharic = coalesce(excluded.title_amharic, public.hymn_collections.title_amharic),
    description = coalesce(excluded.description, public.hymn_collections.description),
    description_amharic = coalesce(excluded.description_amharic, public.hymn_collections.description_amharic),
    image_path = coalesce(excluded.image_path, public.hymn_collections.image_path),
    image_alt = coalesce(excluded.image_alt, public.hymn_collections.image_alt),
    collection_type = excluded.collection_type,
    -- CSV always carries intentional sort_order / featured / status for seed collections.
    sort_order = excluded.sort_order,
    is_featured = excluded.is_featured,
    status = excluded.status,
    updated_at = now();
  get diagnostics v_collections = row_count;

  -- ------------------------------------------------------------------------
  -- Sections → public.hymn_sections (parents resolved in second pass)
  -- ------------------------------------------------------------------------
  insert into public.hymn_sections (
    id, collection_id, slug, title, title_amharic,
    description, description_amharic, image_path, image_alt,
    section_type, source_entity_type, source_entity_id, source_entity_slug,
    sort_order, is_featured, status
  )
  select
    coalesce(nullif(trim(s.section_id), '')::uuid, gen_random_uuid()),
    c.id,
    trim(s.section_slug),
    trim(s.title),
    nullif(trim(s.title_amharic), ''),
    nullif(trim(s.description), ''),
    nullif(trim(s.description_amharic), ''),
    nullif(trim(s.image_path), ''),
    nullif(trim(s.image_alt), ''),
    trim(s.section_type),
    coalesce(nullif(trim(s.source_entity_type), ''), 'manual'),
    case trim(s.source_entity_type)
      when 'occasion' then (
        select o.id from public.mezmur_occasions o
        where o.slug = nullif(trim(s.source_entity_slug), '') limit 1
      )
      when 'category' then (
        select cat.id from public.categories cat
        where cat.slug = nullif(trim(s.source_entity_slug), '') limit 1
      )
      when 'tag' then (
        select t.id from public.tags t
        where t.slug = nullif(trim(s.source_entity_slug), '') limit 1
      )
      when 'singer' then (
        select sg.id from public.singers sg
        where sg.slug = nullif(trim(s.source_entity_slug), '') limit 1
      )
      else null
    end,
    nullif(trim(s.source_entity_slug), ''),
    coalesce(nullif(trim(s.sort_order), '')::integer, 0),
    case lower(trim(coalesce(s.is_featured, '')))
      when 'true' then true when 't' then true when '1' then true when 'yes' then true
      else false
    end,
    coalesce(nullif(trim(s.status), ''), 'draft')
  from public.mezmur_sections_import s
  join public.hymn_collections c on c.slug = trim(s.collection_slug)
  where nullif(trim(s.section_slug), '') is not null
    and nullif(trim(s.title), '') is not null
  on conflict (slug) do update set
    collection_id = excluded.collection_id,
    title = excluded.title,
    title_amharic = coalesce(excluded.title_amharic, public.hymn_sections.title_amharic),
    description = coalesce(excluded.description, public.hymn_sections.description),
    description_amharic = coalesce(excluded.description_amharic, public.hymn_sections.description_amharic),
    image_path = coalesce(excluded.image_path, public.hymn_sections.image_path),
    image_alt = coalesce(excluded.image_alt, public.hymn_sections.image_alt),
    section_type = excluded.section_type,
    source_entity_type = excluded.source_entity_type,
    source_entity_id = coalesce(excluded.source_entity_id, public.hymn_sections.source_entity_id),
    source_entity_slug = coalesce(excluded.source_entity_slug, public.hymn_sections.source_entity_slug),
    sort_order = excluded.sort_order,
    is_featured = excluded.is_featured,
    status = excluded.status,
    updated_at = now();
  get diagnostics v_sections = row_count;

  update public.hymn_sections target
  set parent_section_id = parent.id,
      updated_at = now()
  from public.mezmur_sections_import staged
  join public.hymn_sections parent
    on parent.slug = nullif(trim(staged.parent_section_slug), '')
  where target.slug = trim(staged.section_slug)
    and target.id <> parent.id;
  get diagnostics v_parents = row_count;

  -- ------------------------------------------------------------------------
  -- Optional mezmur field updates (never INSERT new mezmur rows)
  -- Form mapping: CSV "wereb" → DB check value "werb"
  -- ------------------------------------------------------------------------
  if p_apply_mezmur_updates then
    update public.mezmur m
    set
      title = coalesce(nullif(trim(s.title), ''), m.title),
      title_amharic = coalesce(nullif(trim(s.title_amharic), ''), m.title_amharic),
      title_english = coalesce(nullif(trim(s.title_english), ''), m.title_english),
      description = coalesce(nullif(trim(s.description), ''), m.description),
      description_amharic = coalesce(nullif(trim(s.description_amharic), ''), m.description_amharic),
      lyrics_amharic = coalesce(nullif(s.lyrics_amharic, ''), m.lyrics_amharic),
      transliteration = coalesce(nullif(s.lyrics_transliteration, ''), m.transliteration),
      lyrics_english = coalesce(nullif(s.lyrics_english, ''), m.lyrics_english),
      lyrics_geez = coalesce(nullif(s.lyrics_geez, ''), m.lyrics_geez),
      lyrics_oromo = coalesce(nullif(s.lyrics_oromo, ''), m.lyrics_oromo),
      language = coalesce(nullif(trim(s.primary_language), ''), m.language),
      form = coalesce(
        case lower(trim(s.form))
          when 'wereb' then 'werb'
          when 'werb' then 'werb'
          when 'mezmur' then 'mezmur'
          else nullif(trim(s.form), '')
        end,
        m.form
      ),
      singer_id = coalesce(
        m.singer_id,
        nullif(trim(s.singer_id), '')::uuid,
        (select sg.id from public.singers sg where sg.slug = nullif(trim(s.singer_slug), '') limit 1)
      ),
      youtube_url = coalesce(nullif(trim(s.youtube_url), ''), m.youtube_url),
      audio_url = coalesce(nullif(trim(s.audio_url), ''), m.audio_url),
      image_path = coalesce(nullif(trim(s.image_path), ''), m.image_path),
      image_alt = coalesce(nullif(trim(s.image_alt), ''), m.image_alt),
      thumbnail_url = coalesce(
        nullif(trim(s.legacy_thumbnail_url), ''),
        m.thumbnail_url
      ),
      search_keywords = coalesce(
        case
          when nullif(trim(s.search_keywords), '') is null then null
          else regexp_split_to_array(trim(s.search_keywords), '\s*\|\s*')
        end,
        m.search_keywords
      ),
      review_status = coalesce(nullif(trim(s.review_status), ''), m.review_status),
      review_notes = coalesce(nullif(trim(s.review_notes), ''), m.review_notes),
      source_url = coalesce(nullif(trim(s.source_url), ''), m.source_url),
      source_notes = coalesce(nullif(trim(s.source_notes), ''), m.source_notes),
      updated_at = now()
    from public.mezmur_data_import s
    where m.slug = trim(s.slug);
    get diagnostics v_mezmur_updates = row_count;
  end if;

  -- ------------------------------------------------------------------------
  -- Category links → fill mezmur.category_id only when null
  -- There is NO public.mezmur_category_links M2M table in the live schema.
  -- ------------------------------------------------------------------------
  update public.mezmur m
  set category_id = c.id,
      updated_at = now()
  from public.mezmur_category_links_import staged
  join public.categories c on c.slug = trim(staged.category_slug)
  where m.slug = trim(staged.mezmur_slug)
    and m.category_id is null;
  get diagnostics v_category_fills = row_count;

  -- ------------------------------------------------------------------------
  -- Section links → public.mezmur_section_links
  -- ------------------------------------------------------------------------
  update public.mezmur_section_links existing
  set is_primary = false
  where existing.is_primary
    and exists (
      select 1
      from public.mezmur_section_links_import staged
      join public.mezmur m on m.slug = trim(staged.mezmur_slug)
      where m.id = existing.mezmur_id
    );

  insert into public.mezmur_section_links (
    mezmur_id, section_id, sort_order, is_primary
  )
  select
    m.id,
    s.id,
    coalesce(nullif(trim(staged.sort_order), '')::integer, 0),
    case lower(trim(coalesce(staged.is_primary, '')))
      when 'true' then true when 't' then true when '1' then true when 'yes' then true
      else false
    end
  from public.mezmur_section_links_import staged
  join public.mezmur m on m.slug = trim(staged.mezmur_slug)
  join public.hymn_sections s on s.slug = trim(staged.section_slug)
  on conflict (mezmur_id, section_id) do update set
    sort_order = excluded.sort_order,
    is_primary = excluded.is_primary;
  get diagnostics v_section_links = row_count;

  -- ------------------------------------------------------------------------
  -- Occasion links → public.mezmur_occasion_links (existing normalized table)
  -- ------------------------------------------------------------------------
  insert into public.mezmur_occasion_links (mezmur_id, occasion_id)
  select m.id, o.id
  from public.mezmur_occasion_links_import staged
  join public.mezmur m on m.slug = trim(staged.mezmur_slug)
  join public.mezmur_occasions o on o.slug = trim(staged.occasion_slug)
  on conflict (mezmur_id, occasion_id) do nothing;
  get diagnostics v_occasion_links = row_count;

  return jsonb_build_object(
    'collections_upserted', v_collections,
    'sections_upserted', v_sections,
    'section_parents_updated', v_parents,
    'section_links_upserted', v_section_links,
    'occasion_links_inserted', v_occasion_links,
    'category_ids_filled', v_category_fills,
    'mezmur_rows_updated', v_mezmur_updates,
    'mezmur_updates_enabled', p_apply_mezmur_updates,
    'note', 'No new mezmur rows were inserted. Missing production slugs must be created in CMS first.'
  );
end;
$$;

revoke all on function public.apply_mezmur_staging_import(boolean) from public, anon;
grant execute on function public.apply_mezmur_staging_import(boolean) to service_role, authenticated;

commit;

-- ============================================================================
-- EXECUTE MANUALLY AFTER VALIDATION PASSES (leave commented until ready)
-- ============================================================================
-- begin;
-- select public.apply_mezmur_staging_import(false);  -- hierarchy + links only
-- -- select public.apply_mezmur_staging_import(true); -- optional mezmur metadata updates
-- -- Inspect counts, then:
-- commit;
-- -- or: rollback;
