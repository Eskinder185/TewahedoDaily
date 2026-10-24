-- Structured lyrics, provenance metadata, and verified content relationships.
-- Rights status is retained for editorial tracking and attribution; public
-- reader tools are available for every locally displayed hymn.
alter table if exists public.mezmur_data_import
  add column if not exists structured_lyrics jsonb,
  add column if not exists lyrics_language text,
  add column if not exists source_info text,
  add column if not exists rights_status text not null default 'unknown',
  add column if not exists external_lyrics_url text,
  add column if not exists last_verified_at timestamptz,
  add column if not exists related_content jsonb not null default '[]'::jsonb;

do $$ begin
  alter table public.mezmur_data_import add constraint mezmur_data_import_rights_status_check
    check (rights_status in ('owned','licensed','authorized_contributor','public_domain','display_only','external_only','unknown'));
exception when duplicate_object then null; end $$;

do $$ begin
  alter table public.mezmur_data_import add constraint mezmur_data_import_structured_lyrics_check
    check (structured_lyrics is null or jsonb_typeof(structured_lyrics) = 'array');
exception when duplicate_object then null; end $$;

do $$ begin
  alter table public.mezmur_data_import add constraint mezmur_data_import_related_content_check
    check (jsonb_typeof(related_content) = 'array' and jsonb_array_length(related_content) <= 30);
exception when duplicate_object then null; end $$;

comment on column public.mezmur_data_import.rights_status is
  'Editorial provenance/rights metadata. It does not gate public reader tools.';
comment on column public.mezmur_data_import.related_content is
  'Editorially verified relations only. Entries should include target_type, target_slug, label, and verified=true.';
