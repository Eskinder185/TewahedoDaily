-- Synthetic stand-in for the live schema, used only to validate the proposal on a scratch PostgreSQL. No real content.
create schema if not exists extensions;
create role anon nologin; create role authenticated nologin;
create table public.mezmur_data_import (
  mezmur_id uuid primary key default gen_random_uuid(), slug text, title text, title_amharic text, title_english text,
  lyrics_amharic text, lyrics_transliteration text, lyrics_english text, status text, rights_status text, deleted_at timestamptz);
create view public.mezmur_public with (security_barrier = true) as
select mezmur_id, slug, title, title_amharic, title_english, lyrics_amharic,
  case when lower(coalesce(rights_status,'unknown')) in ('external_only','restricted') then null else lyrics_transliteration end as lyrics_transliteration,
  lyrics_english, status
from public.mezmur_data_import where deleted_at is null and lower(trim(coalesce(status,''))) = 'published';
grant select on public.mezmur_public to anon, authenticated;
insert into public.mezmur_data_import (slug,title,title_amharic,lyrics_transliteration,status,rights_status) values
 ('egziabher-siraw','Egziabher Siraw','እግዚአብሔር ሥራው','selam lek maryam enat','published','open'),
 ('selam-lek','Selam Lek','ሰላም ለክ','egziabher yimesgen','published','open'),
 ('hidden-restricted','Restricted Hymn',null,'secretphrase here now','published','restricted'),
 ('draft-one','Draft Hymn',null,'draftphrase here','draft','open'),
 ('deleted-one','Deleted Hymn',null,'deletedphrase here','published','open');
update public.mezmur_data_import set deleted_at = now() where slug = 'deleted-one';
