-- Backfill public.prayers.sort_order for Mezmure Dawit to the Psalm number.
-- Import chunks 01-50 / 51-99 / 100-150 each restarted sort_order at 1, so
-- ORDER BY sort_order yielded 1,100,51,2,... Public UI sorts by getPsalmNumber;
-- this aligns sort_order for CMS / future queries.
--
-- Canonical collection id: 73769ee2-6a34-4138-84e1-5f2430d3b61c
-- Canonical collection slug: mezmure-dawit
-- Live slug patterns: psalm-001 (padded) and psalm-42 (unpadded).
-- Does NOT invent missing Psalms 15 / 147.
-- Does NOT touch other collections.

begin;

update public.prayers p
set sort_order = sub.psalm_number
from (
  select
    id,
    case
      when lower(slug) ~ '^psalm-?0*[0-9]{1,3}$'
        then (regexp_match(lower(slug), '([0-9]{1,3})$'))[1]::int
      when lower(slug) ~ '^mezmure?-?dawit-?0*[0-9]{1,3}$'
        then (regexp_match(lower(slug), '([0-9]{1,3})$'))[1]::int
      else null
    end as psalm_number
  from public.prayers
  where collection_id = '73769ee2-6a34-4138-84e1-5f2430d3b61c'
     or collection_slug = 'mezmure-dawit'
) sub
where p.id = sub.id
  and sub.psalm_number is not null
  and sub.psalm_number between 1 and 150
  and p.sort_order is distinct from sub.psalm_number;

commit;
