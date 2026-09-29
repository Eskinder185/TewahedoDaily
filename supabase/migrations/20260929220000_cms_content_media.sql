-- CMS content media + homepage slides hardening.
-- Safe / idempotent: does not drop tables or existing data.

begin;

-- ---------------------------------------------------------------------------
-- media_assets
-- ---------------------------------------------------------------------------
create table if not exists public.media_assets (
  id uuid primary key default gen_random_uuid(),
  file_name text not null,
  storage_bucket text not null default 'content-media',
  storage_path text not null,
  alt_text text,
  caption text,
  media_type text not null default 'image'
    check (media_type in ('image', 'audio', 'document', 'other')),
  width integer,
  height integer,
  mime_type text,
  file_size bigint,
  created_by uuid references auth.users(id) on delete set null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (storage_bucket, storage_path)
);

create index if not exists media_assets_path_idx
  on public.media_assets (storage_path);
create index if not exists media_assets_created_at_idx
  on public.media_assets (created_at desc);
create index if not exists media_assets_media_type_idx
  on public.media_assets (media_type);

alter table public.media_assets enable row level security;

grant select on public.media_assets to anon, authenticated;
grant insert, update, delete on public.media_assets to authenticated;
grant all on public.media_assets to service_role;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'media_assets' and policyname = 'media_assets_public_read'
  ) then
    create policy media_assets_public_read
      on public.media_assets for select to anon, authenticated
      using (true);
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'media_assets' and policyname = 'media_assets_staff_write'
  ) then
    create policy media_assets_staff_write
      on public.media_assets for all to authenticated
      using (cms_private.current_role() in ('editor', 'admin', 'super_admin'))
      with check (cms_private.current_role() in ('editor', 'admin', 'super_admin'));
  end if;
end $$;

-- ---------------------------------------------------------------------------
-- homepage_slides
-- ---------------------------------------------------------------------------
create table if not exists public.homepage_slides (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  eyebrow text,
  title text not null check (length(trim(title)) > 0),
  title_amharic text,
  subtitle text,
  subtitle_amharic text,
  image_path text,
  image_alt text,
  primary_button_label text,
  primary_button_url text,
  secondary_button_label text,
  secondary_button_url text,
  sort_order integer not null default 0,
  animation_style text not null default 'fade'
    check (animation_style in ('fade', 'crossfade', 'slide')),
  display_duration integer not null default 7000 check (display_duration between 2000 and 60000),
  active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists homepage_slides_active_sort_idx
  on public.homepage_slides (sort_order, slug)
  where active = true;

alter table public.homepage_slides enable row level security;

grant select on public.homepage_slides to anon, authenticated;
grant insert, update, delete on public.homepage_slides to authenticated;
grant all on public.homepage_slides to service_role;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'homepage_slides' and policyname = 'homepage_slides_public_read'
  ) then
    create policy homepage_slides_public_read
      on public.homepage_slides for select to anon, authenticated
      using (active = true or cms_private.current_role() in ('editor', 'admin', 'super_admin'));
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'homepage_slides' and policyname = 'homepage_slides_staff_write'
  ) then
    create policy homepage_slides_staff_write
      on public.homepage_slides for all to authenticated
      using (cms_private.current_role() in ('editor', 'admin', 'super_admin'))
      with check (cms_private.current_role() in ('editor', 'admin', 'super_admin'));
  end if;
end $$;

-- ---------------------------------------------------------------------------
-- site_settings
-- ---------------------------------------------------------------------------
create table if not exists public.site_settings (
  id uuid primary key default gen_random_uuid(),
  setting_key text not null unique,
  setting_value jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.site_settings enable row level security;
grant select on public.site_settings to anon, authenticated;
grant insert, update, delete on public.site_settings to authenticated;
grant all on public.site_settings to service_role;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'site_settings' and policyname = 'site_settings_public_read'
  ) then
    create policy site_settings_public_read
      on public.site_settings for select to anon, authenticated
      using (true);
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'public' and tablename = 'site_settings' and policyname = 'site_settings_staff_write'
  ) then
    create policy site_settings_staff_write
      on public.site_settings for all to authenticated
      using (cms_private.current_role() in ('admin', 'super_admin'))
      with check (cms_private.current_role() in ('admin', 'super_admin'));
  end if;
end $$;

-- ---------------------------------------------------------------------------
-- Image columns on content tables (additive only)
-- ---------------------------------------------------------------------------
alter table public.mezmur
  add column if not exists thumbnail_path text,
  add column if not exists image_alt text;

alter table public.prayer_collections
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists featured boolean not null default false,
  add column if not exists card_label text;

alter table public.liturgy_collections
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists featured boolean not null default false,
  add column if not exists card_label text;

alter table public.synaxarium_days
  add column if not exists image_path text,
  add column if not exists image_alt text;

alter table public.synaxarium_commemorations
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists featured boolean not null default false;

alter table public.saints
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists name text,
  add column if not exists name_amharic text;

alter table public.feasts
  add column if not exists image_path text,
  add column if not exists image_alt text;

-- Staff write policies for prayer / liturgy / synaxarium tables (if missing)
do $$
declare
  t text;
begin
  foreach t in array array[
    'prayer_collections', 'prayer_sections', 'prayers',
    'liturgy_collections', 'liturgy_sections', 'liturgy_entries',
    'synaxarium_days', 'synaxarium_commemorations'
  ]
  loop
    if to_regclass(format('public.%I', t)) is null then
      continue;
    end if;

    execute format('alter table public.%I enable row level security', t);
    execute format('grant select on public.%I to anon, authenticated', t);
    execute format('grant insert, update, delete on public.%I to authenticated', t);
    execute format('grant all on public.%I to service_role', t);

    if not exists (
      select 1 from pg_policies
      where schemaname = 'public' and tablename = t and policyname = t || '_staff_write'
    ) then
      execute format(
        'create policy %I on public.%I for all to authenticated
         using (cms_private.current_role() in (''editor'',''admin'',''super_admin''))
         with check (cms_private.current_role() in (''editor'',''admin'',''super_admin''))',
        t || '_staff_write', t
      );
    end if;

    if not exists (
      select 1 from pg_policies
      where schemaname = 'public' and tablename = t and policyname = t || '_public_read'
    ) and not exists (
      select 1 from pg_policies
      where schemaname = 'public' and tablename = t and policyname like '%public_read%'
    ) and not exists (
      select 1 from pg_policies
      where schemaname = 'public' and tablename = t and policyname like 'content_read%'
    ) then
      execute format(
        'create policy %I on public.%I for select to anon, authenticated
         using (status = ''published'' or cms_private.current_role() in (''editor'',''admin'',''super_admin''))',
        t || '_public_read', t
      );
    end if;
  end loop;
end $$;

-- ---------------------------------------------------------------------------
-- content-media storage bucket (public read, staff write)
-- ---------------------------------------------------------------------------
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'content-media',
  'content-media',
  true,
  10485760,
  array['image/jpeg', 'image/png', 'image/webp']
)
on conflict (id) do update set
  public = true,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

do $$
begin
  if not exists (
    select 1 from pg_policies
    where schemaname = 'storage' and tablename = 'objects' and policyname = 'content_media_public_read'
  ) then
    create policy content_media_public_read
      on storage.objects for select to anon, authenticated
      using (bucket_id = 'content-media');
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'storage' and tablename = 'objects' and policyname = 'content_media_staff_insert'
  ) then
    create policy content_media_staff_insert
      on storage.objects for insert to authenticated
      with check (
        bucket_id = 'content-media'
        and cms_private.current_role() in ('editor', 'admin', 'super_admin')
      );
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'storage' and tablename = 'objects' and policyname = 'content_media_staff_update'
  ) then
    create policy content_media_staff_update
      on storage.objects for update to authenticated
      using (
        bucket_id = 'content-media'
        and cms_private.current_role() in ('editor', 'admin', 'super_admin')
      )
      with check (
        bucket_id = 'content-media'
        and cms_private.current_role() in ('editor', 'admin', 'super_admin')
      );
  end if;

  if not exists (
    select 1 from pg_policies
    where schemaname = 'storage' and tablename = 'objects' and policyname = 'content_media_staff_delete'
  ) then
    create policy content_media_staff_delete
      on storage.objects for delete to authenticated
      using (
        bucket_id = 'content-media'
        and cms_private.current_role() in ('admin', 'super_admin')
      );
  end if;
end $$;

commit;
