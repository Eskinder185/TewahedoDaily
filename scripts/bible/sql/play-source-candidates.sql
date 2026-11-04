-- READ-ONLY. SELECT statement only: no writes, no DDL, no function calls with side effects.
-- Purpose: export candidate Amharic Bible passages for the Faith Challenges offline generator.
-- Run in the Supabase SQL Editor, then export the result grid:
--   * "Download CSV"  -> save as play-source-candidates.csv, or
--   * "Copy as JSON"  -> save as play-source-candidates.json
-- Convert locally with scripts/bible/prepare-play-source-batch.ts (applies audit anomaly checks).
--
-- Eligibility mirrors validateSourceBatch(): edition code 'am', reviewed + published + public,
-- source book reviewed + published + public, canonical book source_status 'available'.
-- Up to 6 chapters per source book are sampled across the book (not only chapter 1),
-- and up to 8 verses are taken from the first section of each sampled chapter only,
-- because Amharic verse source_order is scoped to its section.
with ed as (
  select id, code, name, review_status, is_public, publication_status, canon_code,
         numbering_scheme, rights_status, attribution, source_edition, updated_at
  from public.bible_editions
  where code = 'am' and review_status = 'reviewed' and publication_status = 'published' and is_public
),
sb as (
  select s.id, s.edition_id, s.canonical_book_id, s.source_book_number, s.source_order,
         s.source_file, s.review_status, s.is_public, s.publication_status, s.updated_at
  from public.bible_source_books s
  join ed on ed.id = s.edition_id
  where s.review_status = 'reviewed' and s.publication_status = 'published' and s.is_public
),
bk as (
  select b.id, b.slug, b.name_am, b.name_en, b.canonical_number, b.sort_order, b.source_status
  from public.bible_canonical_books b
  where b.source_status = 'available' and b.name_am is not null
),
ch as (
  select c.id, c.source_book_id, c.chapter_number, c.source_order, c.updated_at,
         row_number() over (partition by c.source_book_id order by c.source_order) as rn,
         count(*) over (partition by c.source_book_id) as n
  from public.bible_chapters c
  join sb on sb.id = c.source_book_id
  where c.chapter_number >= 1
),
pick as (
  select * from ch where (rn - 1) % greatest(1, ceil(n / 6.0)::int) = 0
),
vs as (
  select v.id, v.chapter_id, v.section_id, v.verse_number, v.source_order, v.text, v.updated_at,
         coalesce(s.source_order, 0) as section_order
  from public.bible_verses v
  join pick on pick.id = v.chapter_id
  left join public.bible_sections s on s.id = v.section_id
),
first_group as (
  select chapter_id, min(section_order) as section_order from vs group by chapter_id
),
vr as (
  select vs.*, row_number() over (partition by vs.chapter_id order by vs.source_order) as vrn
  from vs
  join first_group f on f.chapter_id = vs.chapter_id and f.section_order = vs.section_order
)
select jsonb_build_object(
  'edition', to_jsonb(ed),
  'book', to_jsonb(bk),
  'sourceBook', to_jsonb(sb),
  'chapter', jsonb_build_object('id', pick.id, 'source_book_id', pick.source_book_id,
    'chapter_number', pick.chapter_number, 'source_order', pick.source_order, 'updated_at', pick.updated_at),
  'sectionOrder', agg.section_order,
  'verses', agg.verses
) as candidate
from pick
join sb on sb.id = pick.source_book_id
join ed on ed.id = sb.edition_id
join bk on bk.id = sb.canonical_book_id
cross join lateral (
  select min(vr.section_order) as section_order,
         jsonb_agg(jsonb_build_object('id', vr.id, 'chapter_id', vr.chapter_id, 'section_id', vr.section_id,
           'verse_number', vr.verse_number, 'source_order', vr.source_order, 'text', vr.text,
           'updated_at', vr.updated_at) order by vr.source_order) as verses
  from vr
  where vr.chapter_id = pick.id and vr.vrn <= 8
) agg
where agg.verses is not null
order by bk.sort_order, sb.source_order, pick.source_order;
