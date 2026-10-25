-- SAFE THREE-RECORD TEST. Run only after the migration.
-- It uses meaningful text matches, verifies every UUID-keyed relationship, and
-- ROLLS BACK all test writes. It never changes Mezmur content or status.
begin;

create temporary table classification_test_requests(
  import_id uuid primary key,
  slug text not null,
  category_slugs text[] not null,
  occasion_slugs text[] not null,
  test_case text not null
) on commit drop;

insert into classification_test_requests
select import_id,slug,array['virgin-mary'],array['kidane-mihret'],'Mary / Kidane Mihret'
from public.mezmur_data_import
where deleted_at is null and lower(trim(coalesce(status,''))) in ('draft','published')
 and concat_ws(' ',title,lyrics_amharic,lyrics_geez,lyrics_transliteration)
     ~* '(ማርያም|ኪዳነ[[:space:]]*ምሕረት|mary|mariam)'
order by import_id limit 1;

insert into classification_test_requests
select import_id,slug,array['angels-saints','kidus-michael'],array['annual-saint-feast'],'St. Michael'
from public.mezmur_data_import
where deleted_at is null and lower(trim(coalesce(status,''))) in ('draft','published')
 and concat_ws(' ',title,lyrics_amharic,lyrics_geez,lyrics_transliteration)
     ~* '(ሚካኤል|michael)'
order by import_id limit 1
on conflict(import_id) do nothing;

insert into classification_test_requests
select import_id,slug,array['jesus-christ'],array['tinsae'],'Christ / Resurrection'
from public.mezmur_data_import
where deleted_at is null and lower(trim(coalesce(status,''))) in ('draft','published')
 and concat_ws(' ',title,lyrics_amharic,lyrics_geez,lyrics_transliteration)
     ~* '(ትንሣኤ|ትንሳኤ|resurrection|tinsae)'
order by import_id limit 1
on conflict(import_id) do nothing;

do $$ begin
 if (select count(*) from classification_test_requests) <> 3 then
  raise exception 'Three distinct meaningful test records were not found; no persistent writes were made'
   using errcode='P0002',hint='Inspect the three text predicates and select three reviewed records manually.';
 end if;
end $$;

select public.bulk_assign_mezmur_classifications(
 jsonb_agg(jsonb_build_object(
  'import_id',import_id,'slug',slug,
  'category_slugs',to_jsonb(category_slugs),
  'occasion_slugs',to_jsonb(occasion_slugs)
 ) order by test_case),false
) as rpc_result
from classification_test_requests;

-- Every requested relationship must return verified=true for the exact UUID.
select r.test_case,r.import_id,r.slug,
 not exists(select 1 from unnest(r.category_slugs) requested
   where not exists(select 1 from public.mezmur_category_links_import l
     where l.mezmur_import_id=r.import_id and l.category_slug=requested)) as categories_verified,
 not exists(select 1 from unnest(r.occasion_slugs) requested
   where not exists(select 1 from public.mezmur_occasion_links_import l
     where l.mezmur_import_id=r.import_id and l.occasion_slug=requested)) as occasions_verified
from classification_test_requests r order by r.test_case;

rollback;
