-- Forward-only, UUID-safe Mezmur classification persistence.
-- Review PREFLIGHT_MEZMUR_BULK_CLASSIFICATION_READ_ONLY.sql before applying.
-- This migration never changes Mezmur content or publication metadata.
begin;

-- Stable identifiers are mandatory. The Trash repair installs this UUID and
-- its unique index; fail instead of silently falling back to a duplicate slug.
do $$
begin
  if not exists (
    select 1 from information_schema.columns
    where table_schema = 'public' and table_name = 'mezmur_data_import'
      and column_name = 'import_id' and data_type = 'uuid'
  ) or not exists (
    select 1 from pg_index i
    join pg_attribute a on a.attrelid = i.indrelid and a.attnum = any(i.indkey)
    where i.indrelid = 'public.mezmur_data_import'::regclass
      and i.indisunique and a.attname = 'import_id'
  ) then
    raise exception 'Stable public.mezmur_data_import.import_id UUID uniqueness is required'
      using errcode = '55000', hint = 'Install and verify the hymn Trash stable-identifier repair first.';
  end if;
  if to_regclass('public.mezmur_public') is null
     or not exists(select 1 from information_schema.columns where table_schema='public' and table_name='mezmur_public' and column_name='mezmur_id') then
    raise exception 'Canonical public.mezmur_public(mezmur_id) is required'
      using errcode='55000',hint='Install and verify the public Mezmur projection before classification relationships.';
  end if;
end $$;

create table if not exists public.mezmur_category_links_import (
  mezmur_slug text not null, category_slug text not null,
  source_category text default 'manual', confidence text default 'verified'
);
create table if not exists public.mezmur_occasion_links_import (
  mezmur_slug text not null, occasion_slug text not null
);
alter table public.mezmur_category_links_import
  add column if not exists mezmur_import_id uuid,
  add column if not exists source_category text default 'manual';
alter table public.mezmur_occasion_links_import
  add column if not exists mezmur_import_id uuid,
  add column if not exists source_occasion text default 'manual';

do $$
begin
  if exists (select 1 from information_schema.columns where table_schema='public' and table_name='mezmur_category_links_import' and column_name='mezmur_import_id' and data_type<>'uuid')
     or exists (select 1 from information_schema.columns where table_schema='public' and table_name='mezmur_occasion_links_import' and column_name='mezmur_import_id' and data_type<>'uuid') then
    raise exception 'Classification relationship mezmur_import_id columns must be UUID' using errcode='55000';
  end if;
  if not exists (select 1 from pg_constraint where conname='mezmur_category_links_import_mezmur_fk') then
    alter table public.mezmur_category_links_import
      add constraint mezmur_category_links_import_mezmur_fk foreign key (mezmur_import_id)
      references public.mezmur_data_import(import_id) on delete cascade not valid;
  end if;
  if not exists (select 1 from pg_constraint where conname='mezmur_occasion_links_import_mezmur_fk') then
    alter table public.mezmur_occasion_links_import
      add constraint mezmur_occasion_links_import_mezmur_fk foreign key (mezmur_import_id)
      references public.mezmur_data_import(import_id) on delete cascade not valid;
  end if;
end $$;
alter table public.mezmur_category_links_import validate constraint mezmur_category_links_import_mezmur_fk;
alter table public.mezmur_occasion_links_import validate constraint mezmur_occasion_links_import_mezmur_fk;

-- Explicit unique constraints on (mezmur_import_id, category_slug) and
-- (mezmur_import_id, occasion_slug). Note: in production, both link tables have
-- 0 rows, so no backfilling of legacy records is needed.
do $$
begin
  if not exists (select 1 from pg_constraint where conname='mezmur_category_links_import_uuid_cat_key') then
    alter table public.mezmur_category_links_import
      add constraint mezmur_category_links_import_uuid_cat_key unique (mezmur_import_id, category_slug);
  end if;
  if not exists (select 1 from pg_constraint where conname='mezmur_occasion_links_import_uuid_occ_key') then
    alter table public.mezmur_occasion_links_import
      add constraint mezmur_occasion_links_import_uuid_occ_key unique (mezmur_import_id, occasion_slug);
  end if;
end $$;

drop index if exists public.mezmur_category_links_import_slug_cat_idx;
drop index if exists public.mezmur_occasion_links_import_slug_occ_idx;
create index if not exists mezmur_category_links_import_uuid_idx on public.mezmur_category_links_import(mezmur_import_id);
create index if not exists mezmur_occasion_links_import_uuid_idx on public.mezmur_occasion_links_import(mezmur_import_id);

-- Explicit reviewed taxonomy manifest used by the existing deterministic
-- classifier. Existing labels and hierarchy are never renamed or reparented.
insert into public.categories(name,slug,type) values
 ('Jesus Christ','jesus-christ','mezmur'), ('Virgin Mary','virgin-mary','mezmur'),
 ('Angels & Saints','angels-saints','mezmur'), ('Repentance & Fasting','repentance-fasting','mezmur'),
 ('Sacraments & Church Life','sacraments-church-life','mezmur'), ('Praise & General','praise-general','mezmur'),
 ('English Mezmur','english-mezmur','mezmur'), ('Angels','angels','mezmur'), ('Saints','saints','mezmur'),
 ('St. Michael','kidus-michael','mezmur'), ('St. Gabriel','kidus-gabriel','mezmur'),
 ('St. Uriel','kidus-uriel','mezmur'), ('St. Raphael','kidus-raphael','mezmur'),
 ('St. George','kidus-giorgis','mezmur'), ('St. Arsema','kidist-arsema','mezmur'),
 ('Apostles','apostles','mezmur'), ('Martyrs','martyrs','mezmur'), ('Prophets','prophets','mezmur'),
 ('Wereb','wereb','mezmur'), ('General','general','mezmur'), ('Repentance','repentance','mezmur'),
 ('Praise / Worship','praise-worship','mezmur')
on conflict(slug) do nothing;

create table if not exists public.mezmur_occasions(
 id uuid primary key default gen_random_uuid(), slug text not null unique check(slug~'^[a-z0-9]+(-[a-z0-9]+)*$'),
 name text not null, name_amharic text, description text, description_amharic text,
 image_path text, image_alt text, sort_order integer not null default 0,
 is_featured boolean not null default false,
 status text not null default 'published' check(status in ('draft','published','archived')),
 search_keywords text[] not null default '{}', created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
insert into public.mezmur_occasions(slug,name,name_amharic,sort_order,is_featured,search_keywords,status) values
 ('gena','Christmas / Gena','ገና',10,true,array['christmas','nativity','lidet','gena'],'published'),
 ('timket','Timkat / Epiphany','ጥምቀት',20,true,array['timket','epiphany','baptism feast'],'published'),
 ('meskel','Meskel / Holy Cross','መስቀል',30,true,array['meskel','holy cross','demera'],'published'),
 ('hosanna','Hosanna / Palm Sunday','ሆሣዕና',40,false,array['hosanna','palm sunday'],'published'),
 ('siklet','Good Friday / Siklet','ስቅለት',50,false,array['siklet','good friday','crucifixion'],'published'),
 ('tinsae','Resurrection / Tinsae','ትንሣኤ',60,true,array['tinsae','fasika','pascha','resurrection'],'published'),
 ('erget','Ascension / Erget','ዕርገት',70,false,array['erget','ascension'],'published'),
 ('pentecost','Pentecost','ጰንጠቆስጤ',80,false,array['pentecost'],'published'),
 ('debre-tabor','Transfiguration / Debre Tabor','ደብረ ታቦር',90,false,array['debre tabor','transfiguration'],'published'),
 ('filseta','Filseta / Assumption','ፍልሰታ',100,true,array['filseta','assumption'],'published'),
 ('kidane-mihret','Kidane Mihret','ኪዳነ ምሕረት',110,true,array['kidane mihret'],'published'),
 ('lideta-maryam','Lideta Maryam','ልደታ ማርያም',120,false,array['lideta maryam'],'published'),
 ('abiy-tsom','Abiy Tsom / Great Lent','ዐቢይ ጾም',130,true,array['abiy tsom','great lent'],'published'),
 ('tsome-nineveh','Nineveh Fast','ጾመ ነነዌ',140,false,array['nineveh'],'published'),
 ('wedding','Wedding','ሰርግ',190,false,array['wedding','marriage'],'published'),
 ('communion','Communion','ቅዱስ ቁርባን',220,false,array['communion','eucharist'],'published'),
 ('annual-saint-feast','Annual Saint Feast','ዓመታዊ የቅዱሳን በዓል',250,false,array['saint feast'],'published'),
 ('repentance','Repentance / Fasting','ንስሐና ጾም',260,false,array['repentance','fasting'],'published'),
 ('praise','Praise / Worship','ምስጋና',270,false,array['praise','worship'],'published'),
 ('general','General / Anytime','አጠቃላይ',900,false,array['general','anytime'],'published')
on conflict(slug) do nothing;

alter table public.mezmur_occasions enable row level security;
revoke all on public.mezmur_occasions from anon;
grant select on public.mezmur_occasions to anon,authenticated;
grant insert,update,delete on public.mezmur_occasions to authenticated;
drop policy if exists mezmur_occasions_public_read on public.mezmur_occasions;
drop policy if exists mezmur_occasions_authenticated_read on public.mezmur_occasions;
drop policy if exists mezmur_occasions_staff_write on public.mezmur_occasions;
create policy mezmur_occasions_public_read on public.mezmur_occasions for select to anon using(status='published');
create policy mezmur_occasions_authenticated_read on public.mezmur_occasions for select to authenticated using(status='published' or public.is_staff());
create policy mezmur_occasions_staff_write on public.mezmur_occasions for all to authenticated using(public.is_staff()) with check(public.is_staff());

-- Direct relationship tables are staff-only. Public clients use filtered views.
alter table public.mezmur_category_links_import enable row level security;
alter table public.mezmur_occasion_links_import enable row level security;
revoke all on public.mezmur_category_links_import from public,anon;
revoke all on public.mezmur_occasion_links_import from public,anon;
grant select,insert,update,delete on public.mezmur_category_links_import to authenticated;
grant select,insert,update,delete on public.mezmur_occasion_links_import to authenticated;
drop policy if exists mezmur_category_links_import_public_read on public.mezmur_category_links_import;
drop policy if exists mezmur_category_links_import_staff_read on public.mezmur_category_links_import;
drop policy if exists mezmur_category_links_import_staff_write on public.mezmur_category_links_import;
drop policy if exists mezmur_occasion_links_import_public_read on public.mezmur_occasion_links_import;
drop policy if exists mezmur_occasion_links_import_staff_read on public.mezmur_occasion_links_import;
drop policy if exists mezmur_occasion_links_import_staff_write on public.mezmur_occasion_links_import;
create policy mezmur_category_links_import_staff_read on public.mezmur_category_links_import for select to authenticated using(public.is_staff());
create policy mezmur_category_links_import_staff_write on public.mezmur_category_links_import for all to authenticated using(public.is_staff()) with check(public.is_staff());
create policy mezmur_occasion_links_import_staff_read on public.mezmur_occasion_links_import for select to authenticated using(public.is_staff());
create policy mezmur_occasion_links_import_staff_write on public.mezmur_occasion_links_import for all to authenticated using(public.is_staff()) with check(public.is_staff());

create or replace view public.mezmur_category_links_public with(security_barrier=true) as
select distinct l.mezmur_import_id,p.mezmur_id,p.slug mezmur_slug,l.category_slug
from public.mezmur_category_links_import l
join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
join public.mezmur_public p on p.mezmur_id=m.mezmur_id
where l.mezmur_import_id is not null
  and m.deleted_at is null
  and lower(trim(coalesce(m.status,''))) = 'published';

create or replace view public.mezmur_occasion_links_public with(security_barrier=true) as
select distinct l.mezmur_import_id,p.mezmur_id,p.slug mezmur_slug,l.occasion_slug
from public.mezmur_occasion_links_import l
join public.mezmur_data_import m on m.import_id=l.mezmur_import_id
join public.mezmur_public p on p.mezmur_id=m.mezmur_id
where l.mezmur_import_id is not null
  and m.deleted_at is null
  and lower(trim(coalesce(m.status,''))) = 'published';
revoke all on public.mezmur_category_links_public from public;
revoke all on public.mezmur_occasion_links_public from public;
grant select on public.mezmur_category_links_public to anon,authenticated;
grant select on public.mezmur_occasion_links_public to anon,authenticated;

-- Replace the editor's legacy slug-only write path with a UUID-keyed overload.
-- Revoke the old overload when present: a duplicate slug can never be a safe
-- mutation key, even for a signed-in staff member.
do $$ begin
 if to_regprocedure('public.set_mezmur_classification_import(text,text[],text[],text)') is not null then
  revoke all on function public.set_mezmur_classification_import(text,text[],text[],text)
   from public,anon,authenticated,service_role;
 end if;
end $$;

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
 from (select distinct lower(trim(value)) value from unnest(coalesce(p_category_slugs,'{}'::text[]))
       where nullif(trim(value),'') is not null) q;
 select coalesce(array_agg(value order by value),'{}'::text[]) into v_occasions
 from (select distinct lower(trim(value)) value from unnest(coalesce(p_occasion_slugs,'{}'::text[]))
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

create or replace function public.bulk_assign_mezmur_classifications(p_classifications jsonb,p_overwrite boolean default false)
returns jsonb language plpgsql security definer set search_path='' as $$
declare
 v_actor uuid:=auth.uid(); v_role text; v_elem jsonb; v_import_id uuid; v_payload_slug text;
 v_slug text; v_status text; v_categories text[]; v_occasions text[]; v_invalid text[]; v_value text;
 v_duplicate_slug_count integer; v_cat_inserted integer; v_cat_existing integer;
 v_occ_inserted integer; v_occ_existing integer; v_manual_preserved integer; v_removed integer; v_verified integer;
 v_applied integer:=0; v_failed integer:=0; v_categories_inserted integer:=0; v_categories_existing integer:=0;
 v_occasions_inserted integer:=0; v_occasions_existing integer:=0; v_manual_total integer:=0; v_removed_total integer:=0;
 v_results jsonb:='[]'::jsonb;
begin
 if v_actor is null then
  if current_user not in ('postgres','supabase_admin') then raise exception 'Authenticated Admin or Super Admin is required for bulk classification' using errcode='42501'; end if;
 else
  select role::text into v_role from public.profiles where id=v_actor;
  if v_role not in ('admin','super_admin') then raise exception 'Admin or Super Admin is required for bulk classification' using errcode='42501'; end if;
 end if;
 if jsonb_typeof(coalesce(p_classifications,'null'::jsonb))<>'array' then raise exception 'p_classifications must be a JSON array' using errcode='22023'; end if;
 if jsonb_array_length(p_classifications)>100 then raise exception 'Bulk classification is limited to 100 records per call' using errcode='22023'; end if;

 for v_elem in select value from jsonb_array_elements(p_classifications) loop
  v_import_id:=null; v_payload_slug:=null; v_slug:=null; v_status:=null;
  v_categories:='{}'::text[]; v_occasions:='{}'::text[];
  v_cat_inserted:=0; v_cat_existing:=0; v_occ_inserted:=0; v_occ_existing:=0; v_manual_preserved:=0; v_removed:=0;
  begin
   v_import_id:=nullif(trim(v_elem->>'import_id'),'')::uuid; v_payload_slug:=nullif(trim(v_elem->>'slug'),'');
   if v_import_id is null then raise exception 'Stable import_id UUID is required; slug-only classification is unsafe' using errcode='22023'; end if;
   if v_elem?'category_slugs' and jsonb_typeof(v_elem->'category_slugs')<>'array' then raise exception 'category_slugs must be a JSON array' using errcode='22023'; end if;
   if v_elem?'occasion_slugs' and jsonb_typeof(v_elem->'occasion_slugs')<>'array' then raise exception 'occasion_slugs must be a JSON array' using errcode='22023'; end if;
   select array_agg(value order by value) into v_categories from (select distinct lower(trim(value)) value from jsonb_array_elements_text(coalesce(v_elem->'category_slugs','[]'::jsonb)) where nullif(trim(value),'') is not null)q;
   select array_agg(value order by value) into v_occasions from (select distinct lower(trim(value)) value from jsonb_array_elements_text(coalesce(v_elem->'occasion_slugs','[]'::jsonb)) where nullif(trim(value),'') is not null)q;
   v_categories:=coalesce(v_categories,'{}'::text[]); v_occasions:=coalesce(v_occasions,'{}'::text[]);
   if cardinality(v_categories)+cardinality(v_occasions)=0 then raise exception 'At least one category or occasion slug is required' using errcode='22023'; end if;
   select slug,lower(trim(coalesce(status,''))) into strict v_slug,v_status from public.mezmur_data_import where import_id=v_import_id and deleted_at is null for update;
   if v_status not in ('draft','published') then raise exception 'Mezmur % has ineligible status %',v_import_id,v_status using errcode='22023'; end if;
   if v_payload_slug is not null and lower(trim(v_payload_slug))<>lower(trim(v_slug)) then raise exception 'Payload slug % does not match import_id % (actual slug: %)',v_payload_slug,v_import_id,v_slug using errcode='22023'; end if;
   select count(*) into v_duplicate_slug_count from public.mezmur_data_import where deleted_at is null and lower(trim(slug))=lower(trim(v_slug));
    select array_agg(x order by x) into v_invalid from unnest(v_categories)x where not exists(select 1 from public.categories c where lower(trim(c.slug))=x and not coalesce(c.is_archived,false));
   if cardinality(coalesce(v_invalid,'{}'::text[]))>0 then raise exception 'Invalid category slug(s): %',array_to_string(v_invalid,', ') using errcode='23503'; end if;
   select array_agg(x order by x) into v_invalid from unnest(v_occasions)x where not exists(select 1 from public.mezmur_occasions o where lower(trim(o.slug))=x and o.status<>'archived');
   if cardinality(coalesce(v_invalid,'{}'::text[]))>0 then raise exception 'Invalid occasion slug(s): %',array_to_string(v_invalid,', ') using errcode='23503'; end if;

   if not p_overwrite then
    select (select count(*) from public.mezmur_category_links_import where mezmur_import_id=v_import_id and coalesce(source_category,'manual')<>'bulk-classifier')+
           (select count(*) from public.mezmur_occasion_links_import where mezmur_import_id=v_import_id and coalesce(source_occasion,'manual')<>'bulk-classifier') into v_manual_preserved;
   else
    delete from public.mezmur_category_links_import where mezmur_import_id=v_import_id; get diagnostics v_removed=row_count;
    delete from public.mezmur_occasion_links_import where mezmur_import_id=v_import_id; get diagnostics v_verified=row_count; v_removed:=v_removed+v_verified;
   end if;
   foreach v_value in array v_categories loop
    if exists(select 1 from public.mezmur_category_links_import where mezmur_import_id=v_import_id and category_slug=v_value) then v_cat_existing:=v_cat_existing+1;
    else
     insert into public.mezmur_category_links_import(mezmur_import_id,mezmur_slug,category_slug,source_category,confidence) values(v_import_id,v_slug,v_value,'bulk-classifier','verified') on conflict do nothing;
     if found then v_cat_inserted:=v_cat_inserted+1; else raise exception 'Concurrent category write prevented assignment of %',v_value using errcode='40001'; end if;
    end if;
   end loop;
   foreach v_value in array v_occasions loop
    if exists(select 1 from public.mezmur_occasion_links_import where mezmur_import_id=v_import_id and occasion_slug=v_value) then v_occ_existing:=v_occ_existing+1;
    else
     insert into public.mezmur_occasion_links_import(mezmur_import_id,mezmur_slug,occasion_slug,source_occasion) values(v_import_id,v_slug,v_value,'bulk-classifier') on conflict do nothing;
     if found then v_occ_inserted:=v_occ_inserted+1; else raise exception 'Concurrent occasion write prevented assignment of %',v_value using errcode='40001'; end if;
    end if;
   end loop;
   select count(*) into v_verified from unnest(v_categories)x where exists(select 1 from public.mezmur_category_links_import l where l.mezmur_import_id=v_import_id and l.category_slug=x);
   if v_verified<>cardinality(v_categories) then raise exception 'Category read-after-write verification failed (% of %)',v_verified,cardinality(v_categories) using errcode='P0001'; end if;
   select count(*) into v_verified from unnest(v_occasions)x where exists(select 1 from public.mezmur_occasion_links_import l where l.mezmur_import_id=v_import_id and l.occasion_slug=x);
   if v_verified<>cardinality(v_occasions) then raise exception 'Occasion read-after-write verification failed (% of %)',v_verified,cardinality(v_occasions) using errcode='P0001'; end if;

   v_applied:=v_applied+1; v_categories_inserted:=v_categories_inserted+v_cat_inserted; v_categories_existing:=v_categories_existing+v_cat_existing;
   v_occasions_inserted:=v_occasions_inserted+v_occ_inserted; v_occasions_existing:=v_occasions_existing+v_occ_existing;
   v_manual_total:=v_manual_total+v_manual_preserved; v_removed_total:=v_removed_total+v_removed;
   v_results:=v_results||jsonb_build_object('import_id',v_import_id,'slug',v_slug,'status',v_status,'duplicate_slug_count',v_duplicate_slug_count,
    'categories_inserted',v_cat_inserted,'categories_already_present',v_cat_existing,'occasions_inserted',v_occ_inserted,'occasions_already_present',v_occ_existing,
    'manual_relationships_preserved',v_manual_preserved,'relationships_removed_by_overwrite',v_removed,'outcome','applied');
  exception when no_data_found then
   v_failed:=v_failed+1; v_results:=v_results||jsonb_build_object('import_id',coalesce(v_import_id::text,v_elem->>'import_id','unknown'),'slug',v_payload_slug,'outcome','failed','sqlstate','P0002','reason','Active Mezmur import_id was not found');
  when others then
   v_failed:=v_failed+1; v_results:=v_results||jsonb_build_object('import_id',coalesce(v_import_id::text,v_elem->>'import_id','unknown'),'slug',coalesce(v_slug,v_payload_slug),'outcome','failed','sqlstate',sqlstate,'reason',sqlerrm);
  end;
 end loop;
 return jsonb_build_object('applied',v_applied,'failed',v_failed,'categories_inserted',v_categories_inserted,'categories_already_present',v_categories_existing,
  'occasions_inserted',v_occasions_inserted,'occasions_already_present',v_occasions_existing,'manual_relationships_preserved',v_manual_total,
  'relationships_removed_by_overwrite',v_removed_total,'results',v_results);
end;
$$;
revoke all on function public.bulk_assign_mezmur_classifications(jsonb,boolean) from public,anon;
grant execute on function public.bulk_assign_mezmur_classifications(jsonb,boolean) to authenticated;
notify pgrst,'reload schema';
commit;
