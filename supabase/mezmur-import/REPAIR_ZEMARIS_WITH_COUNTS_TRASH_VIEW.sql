-- Surgical production repair for a stale public.zemaris_with_counts definition.
--
-- This script does NOT add/recreate table columns, alter data, or change RLS.
-- Review the read-only preflight result before running this file. Run it as one
-- transaction in Supabase SQL Editor only after explicit production approval.

begin;

do $check$
declare
  v_missing text[];
begin
  if to_regclass('public.zemaris_with_counts') is null then
    raise exception 'public.zemaris_with_counts does not exist; stop and inspect the production schema';
  end if;

  select array_agg(required.column_name order by required.column_name)
    into v_missing
  from (
    values ('deleted_at'), ('deleted_by'), ('deleted_from_status')
  ) as required(column_name)
  where not exists (
    select 1
    from information_schema.columns c
    where c.table_schema = 'public'
      and c.table_name = 'zemaris'
      and c.column_name = required.column_name
  );

  if coalesce(cardinality(v_missing), 0) > 0 then
    raise exception 'public.zemaris is missing required base columns: %', array_to_string(v_missing, ', ');
  end if;

  if to_regclass('public.mezmur_public') is null then
    raise exception 'public.mezmur_public does not exist; stop and inspect the production schema';
  end if;
end
$check$;

-- Preserve every existing view column in its established order and append the
-- three Trash metadata fields. PostgreSQL will reject the transaction if the
-- production view's existing column contract is incompatible.
create or replace view public.zemaris_with_counts
with (security_invoker = true)
as
select
  z.id,
  z.slug,
  z.name,
  z.name_amharic,
  z.bio,
  z.bio_amharic,
  z.image_path,
  z.image_alt,
  z.youtube_url,
  z.website_url,
  z.sort_order,
  z.is_featured,
  z.status,
  z.created_at,
  z.updated_at,
  (select count(*)::integer from public.mezmur_public m where m.zemari_id = z.id) as published_mezmur_count,
  case when coalesce(public.is_staff(), false) then
    (select count(*)::integer
       from public.mezmur_data_import m
      where m.zemari_id = z.id
        and m.deleted_at is null)
  else
    (select count(*)::integer from public.mezmur_public m where m.zemari_id = z.id)
  end as mezmur_count,
  z.deleted_at,
  z.deleted_by,
  z.deleted_from_status
from public.zemaris z;

comment on view public.zemaris_with_counts is
  'Zemaris with public/staff-appropriate Mezmur counts and Trash metadata.';

grant select on public.zemaris_with_counts to anon, authenticated;

-- CREATE OR REPLACE invalidates PostgreSQL metadata; explicitly ask PostgREST
-- to refresh immediately instead of waiting for its listener/cache cycle.
notify pgrst, 'reload schema';

commit;

-- Read-only verification (expected: three rows, then no error):
select column_name, ordinal_position
from information_schema.columns
where table_schema = 'public'
  and table_name = 'zemaris_with_counts'
  and column_name in ('deleted_at', 'deleted_by', 'deleted_from_status')
order by ordinal_position;

select id, deleted_at, deleted_by, deleted_from_status
from public.zemaris_with_counts
limit 0;
