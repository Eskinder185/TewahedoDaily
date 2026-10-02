-- Fix public Zemari browse: ensure zemaris_with_counts reflects public.zemaris
-- profile fields and counts mezmurs via mezmur_data_import.zemari_id.
-- Run in Supabase SQL Editor.

begin;

-- Ensure link column is uuid (text comparisons against z.id can silently fail counts)
do $$
begin
  if exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'mezmur_data_import'
      and column_name = 'zemari_id'
      and data_type = 'text'
  ) then
    alter table public.mezmur_data_import
      alter column zemari_id type uuid
      using nullif(trim(zemari_id), '')::uuid;
  end if;
exception
  when others then
    raise notice 'zemari_id type coerce skipped: %', sqlerrm;
end $$;

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
  coalesce((
    select count(*)::int
    from public.mezmur_data_import m
    where m.zemari_id is not null
      and m.zemari_id::text = z.id::text
      and (
        nullif(trim(coalesce(m.status, '')), '') is null
        or lower(trim(m.status)) in ('published', 'active', 'true', '1')
        or lower(trim(m.status)) not in ('draft', 'archived', 'hidden', 'rejected', 'deleted')
      )
  ), 0) as published_mezmur_count,
  coalesce((
    select count(*)::int
    from public.mezmur_data_import m
    where m.zemari_id is not null
      and m.zemari_id::text = z.id::text
  ), 0) as mezmur_count
from public.zemaris z;

comment on view public.zemaris_with_counts is
  'Zemari profile fields from public.zemaris; counts from mezmur_data_import.zemari_id only.';

grant select on table public.zemaris_with_counts to anon, authenticated;
grant select on table public.zemaris to anon, authenticated;

notify pgrst, 'reload schema';

commit;
