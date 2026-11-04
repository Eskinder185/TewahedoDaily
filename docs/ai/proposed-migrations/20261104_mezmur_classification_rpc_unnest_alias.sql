-- PROPOSED - NOT APPLIED. Review before running in the Supabase SQL editor. Do NOT run on production first.
--
-- Fixes: "column "value" does not exist (42703)" when saving Mezmur categories/occasions.
-- Cause: public.set_mezmur_classification_import(uuid,text[],text[]) in 20261025020000_mezmur_bulk_classification.sql
-- (lines 209-214) reads a column named `value` from an UNALIASED unnest(...). PostgreSQL names that column
-- `unnest`, so every call fails. The only change below is `as t(value)` on those two unnest() calls.
--
-- Guarantees
--   * Same name, argument types, return type, SECURITY DEFINER, search_path and grants: CREATE OR REPLACE only.
--   * No table, column, row or policy is touched. Published Mezmurs, tags and existing links are not modified;
--     the function only runs when someone presses Save, and replaces ONE Mezmur's links in one transaction.
--   * Retrying Save is idempotent: links are deleted and re-inserted for that import_id inside the function,
--     so repeated calls leave exactly the selected links (verified on a local PostgreSQL 17 simulation).
--
-- Read-only checks to run FIRST (the live function may differ from the repository):
--   select pg_get_functiondef('public.set_mezmur_classification_import(uuid,text[],text[])'::regprocedure);
--       -- SAVE this output: it is the rollback script. Confirm it contains an unaliased
--       -- "from unnest(coalesce(p_category_slugs" before applying; if it already has "as t(value)" or "as value",
--       -- this patch is not needed.
--   select proname, pg_get_function_identity_arguments(oid), prosecdef, proacl
--   from pg_proc where proname='set_mezmur_classification_import' and pronamespace='public'::regnamespace;
--       -- expect exactly one overload, (uuid,text[],text[]), security definer, EXECUTE for authenticated only.
--   select count(*) from public.mezmur_category_links_import;   select count(*) from public.mezmur_occasion_links_import;
--       -- record both counts; they must be unchanged by applying this file.
begin;

create or replace function public.set_mezmur_classification_import(
 p_mezmur_import_id uuid,p_category_slugs text[] default '{}',p_occasion_slugs text[] default '{}'
) returns void language plpgsql security definer set search_path='' as $$
declare
 v_slug text; v_status text; v_categories text[]; v_occasions text[]; v_invalid text[];
begin
 if auth.uid() is null or not coalesce(public.is_staff(),false) then
  raise exception 'Authenticated staff access is required to edit Mezmur classifications' using errcode='42501';
 end if;
 if p_mezmur_import_id is null then
  raise exception 'Stable Mezmur import_id is required' using errcode='22023';
 end if;
 select slug,lower(trim(coalesce(status,''))) into strict v_slug,v_status
 from public.mezmur_data_import where import_id=p_mezmur_import_id and deleted_at is null for update;
 if v_status not in ('draft','published') then
  raise exception 'Mezmur % has ineligible status %',p_mezmur_import_id,v_status using errcode='22023';
 end if;
 select coalesce(array_agg(value order by value),'{}'::text[]) into v_categories
 from (select distinct lower(trim(value)) value from unnest(coalesce(p_category_slugs,'{}'::text[])) as t(value)
       where nullif(trim(value),'') is not null) q;
 select coalesce(array_agg(value order by value),'{}'::text[]) into v_occasions
 from (select distinct lower(trim(value)) value from unnest(coalesce(p_occasion_slugs,'{}'::text[])) as t(value)
       where nullif(trim(value),'') is not null) q;
 select array_agg(x order by x) into v_invalid from unnest(v_categories)x
 where not exists(select 1 from public.categories c where lower(trim(c.slug))=x and not coalesce(c.is_archived,false));
 if cardinality(coalesce(v_invalid,'{}'::text[]))>0 then
  raise exception 'Invalid category slug(s): %',array_to_string(v_invalid,', ') using errcode='23503';
 end if;
 select array_agg(x order by x) into v_invalid from unnest(v_occasions)x
 where not exists(select 1 from public.mezmur_occasions o where lower(trim(o.slug))=x and o.status<>'archived');
 if cardinality(coalesce(v_invalid,'{}'::text[]))>0 then
  raise exception 'Invalid occasion slug(s): %',array_to_string(v_invalid,', ') using errcode='23503';
 end if;
 delete from public.mezmur_category_links_import where mezmur_import_id=p_mezmur_import_id;
 delete from public.mezmur_occasion_links_import where mezmur_import_id=p_mezmur_import_id;
 insert into public.mezmur_category_links_import(mezmur_import_id,mezmur_slug,category_slug,source_category,confidence)
 select p_mezmur_import_id,v_slug,x,'admin-editor','verified' from unnest(v_categories)x on conflict do nothing;
 insert into public.mezmur_occasion_links_import(mezmur_import_id,mezmur_slug,occasion_slug,source_occasion)
 select p_mezmur_import_id,v_slug,x,'admin-editor' from unnest(v_occasions)x on conflict do nothing;
 if (select count(*) from public.mezmur_category_links_import where mezmur_import_id=p_mezmur_import_id)<>cardinality(v_categories)
    or (select count(*) from public.mezmur_occasion_links_import where mezmur_import_id=p_mezmur_import_id)<>cardinality(v_occasions) then
  raise exception 'Classification read-after-write verification failed for Mezmur %',p_mezmur_import_id using errcode='P0001';
 end if;
exception when no_data_found then
 raise exception 'Active Mezmur import_id % was not found',p_mezmur_import_id using errcode='P0002';
end;
$$;
revoke all on function public.set_mezmur_classification_import(uuid,text[],text[]) from public,anon;
grant execute on function public.set_mezmur_classification_import(uuid,text[],text[]) to authenticated;

notify pgrst,'reload schema';
-- Rollback before commit: ROLLBACK. After commit: re-run the pg_get_functiondef output saved above.
commit;
