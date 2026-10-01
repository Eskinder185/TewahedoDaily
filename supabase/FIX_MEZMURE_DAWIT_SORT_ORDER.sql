-- PASTE into Supabase SQL Editor if migrations are applied manually.
-- Same body as 20260930250000_mezmure_dawit_sort_order_backfill.sql

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
