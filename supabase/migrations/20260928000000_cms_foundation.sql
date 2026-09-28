begin;
create type public.cms_role as enum ('super_admin', 'admin', 'editor', 'contributor');
create type public.content_status as enum ('draft', 'pending_review', 'published', 'rejected', 'archived');
create type public.cms_content_type as enum ('mezmur', 'saints', 'feasts', 'prayers', 'articles');
create schema if not exists cms_private;
revoke all on schema cms_private from public;
grant usage on schema cms_private to anon, authenticated;

create table public.profiles (
 id uuid primary key references auth.users(id) on delete cascade,
 email text,
 display_name text not null default '',
 avatar_url text,
 role public.cms_role,
 created_at timestamptz not null default now(),
 updated_at timestamptz not null default now()
);
-- No signup trigger grants membership. Only trusted provisioning creates profiles.
create function cms_private.current_role() returns public.cms_role
language sql stable security definer set search_path = '' as $$
 select role from public.profiles where id = auth.uid()
$$;
revoke all on function cms_private.current_role() from public;
grant execute on function cms_private.current_role() to anon, authenticated;

alter table public.profiles enable row level security;
revoke all on public.profiles from anon, authenticated;
grant select on public.profiles to authenticated;
grant update (display_name, avatar_url) on public.profiles to authenticated;
grant all on public.profiles to service_role;
create policy profiles_read on public.profiles for select to authenticated using (
 id = auth.uid() or cms_private.current_role() = 'super_admin' or
 (cms_private.current_role() = 'admin' and (role is null or role in ('contributor','editor')))
);
create policy profiles_edit on public.profiles for update to authenticated using (
 id = auth.uid() or cms_private.current_role() = 'super_admin' or
 (cms_private.current_role() = 'admin' and (role is null or role in ('contributor','editor')))
) with check (
 id = auth.uid() or cms_private.current_role() = 'super_admin' or
 (cms_private.current_role() = 'admin' and (role is null or role in ('contributor','editor')))
);
create trigger profiles_updated before update on public.profiles for each row execute function public.set_updated_at();

-- Only this RPC changes memberships. NULL revokes CMS access without deleting Auth history.
create function public.set_cms_member(target_user_id uuid, new_role public.cms_role)
returns void language plpgsql security definer set search_path = '' as $$
declare actor_role public.cms_role; old_role public.cms_role;
begin
 perform pg_advisory_xact_lock(724601);
 actor_role := cms_private.current_role();
 select role into old_role from public.profiles where id = target_user_id;
 if actor_role is null or actor_role not in ('super_admin','admin') then
  raise exception 'CMS administrator required' using errcode = '42501';
 end if;
 if actor_role = 'admin' and (
  old_role in ('admin','super_admin') or new_role in ('admin','super_admin')
 ) then raise exception 'Super admin required' using errcode = '42501'; end if;
 if old_role = 'super_admin' and new_role is distinct from old_role and
  (select count(*) from public.profiles where role = 'super_admin') <= 1 then
  raise exception 'Cannot remove the last super admin';
 end if;
 insert into public.profiles (id,email,role)
 select id,email,new_role from auth.users where id = target_user_id
 on conflict (id) do update set role = excluded.role, email = excluded.email;
 if not found then raise exception 'Auth user not found'; end if;
end $$;
revoke all on function public.set_cms_member(uuid,public.cms_role) from public, anon;
grant execute on function public.set_cms_member(uuid,public.cms_role) to authenticated;

create function cms_private.sync_profile_email() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
 update public.profiles set email = new.email where id = new.id;
 return new;
end $$;
create trigger cms_sync_email after update of email on auth.users
for each row execute function cms_private.sync_profile_email();

create table public.categories (
 id uuid primary key default gen_random_uuid(), name text not null,
 name_amharic text, slug text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
 description text, type public.cms_content_type not null default 'mezmur',
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create table public.singers (
 id uuid primary key default gen_random_uuid(), name text not null, name_amharic text,
 description text, image_url text,
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create table public.tags (
 id uuid primary key default gen_random_uuid(), name text not null,
 slug text not null unique check (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$')
);

-- Common editorial fields for all five content types.
do $$ declare t text; begin
 foreach t in array array['mezmur','saints','feasts','prayers','articles'] loop
  execute format('create table public.%I (
   id uuid primary key default gen_random_uuid(),
   slug text not null unique check (slug ~ ''^[a-z0-9]+(-[a-z0-9]+)*$''),
   title text not null check (length(trim(title)) > 0), title_amharic text, title_oromo text,
   description text, thumbnail_url text,
   status public.content_status not null default ''draft'', featured boolean not null default false,
   published_at timestamptz,
   created_by uuid references public.profiles(id) on delete set null,
   updated_by uuid references public.profiles(id) on delete set null,
   created_at timestamptz not null default now(), updated_at timestamptz not null default now()
  )', t);
 end loop;
end $$;
alter table public.mezmur
 add lyrics_amharic text, add lyrics_english text, add lyrics_oromo text,
 add transliteration text, add youtube_url text, add audio_url text,
 add singer_id uuid references public.singers(id) on delete set null,
 add category_id uuid references public.categories(id) on delete set null;
alter table public.saints add body text, add body_amharic text, add commemoration_month smallint check (commemoration_month between 1 and 13), add commemoration_day smallint check (commemoration_day between 1 and 30);
alter table public.feasts add body text, add body_amharic text, add ethiopian_month smallint check (ethiopian_month between 1 and 13), add ethiopian_day smallint check (ethiopian_day between 1 and 30), add is_movable boolean not null default false;
alter table public.prayers add body text, add body_amharic text, add body_oromo text, add transliteration text, add audio_url text;
alter table public.articles add body text, add body_amharic text, add body_oromo text;
create table public.mezmur_tags (
 mezmur_id uuid references public.mezmur(id) on delete cascade,
 tag_id uuid references public.tags(id) on delete cascade, primary key (mezmur_id,tag_id)
);
create index mezmur_tags_tag_idx on public.mezmur_tags(tag_id);
create index mezmur_singer_idx on public.mezmur(singer_id);
create index mezmur_category_idx on public.mezmur(category_id);

create table public.content_versions (
 id uuid primary key default gen_random_uuid(), content_type public.cms_content_type not null,
 content_id uuid not null, snapshot jsonb not null,
 changed_by uuid references public.profiles(id) on delete set null,
 created_at timestamptz not null default now()
);
create index content_versions_content_idx on public.content_versions(content_type,content_id,created_at desc);
alter table public.content_versions enable row level security;
revoke all on public.content_versions from anon, authenticated;
grant select on public.content_versions to authenticated;
grant all on public.content_versions to service_role;
create policy versions_staff_read on public.content_versions for select to authenticated
using (cms_private.current_role() in ('editor','admin','super_admin'));

create function cms_private.guard_content() returns trigger
language plpgsql set search_path = '' as $$
declare actor public.cms_role := cms_private.current_role();
begin
 if tg_op = 'INSERT' then
  new.created_by := auth.uid(); new.created_at := now();
 else
  new.id := old.id; new.created_by := old.created_by; new.created_at := old.created_at;
 end if;
 new.updated_by := auth.uid(); new.updated_at := now();
 if actor = 'contributor' then
  if new.featured or new.published_at is not null then
   raise exception 'Contributors cannot set publication metadata' using errcode = '42501';
  end if;
 end if;
 if new.status = 'published' then
  if tg_op = 'INSERT' then
   if actor = 'editor' then raise exception 'Submit for review before publishing' using errcode = '42501'; end if;
   new.published_at := now();
  elsif old.status <> 'published' then
   if actor = 'editor' and old.status <> 'pending_review' then
    raise exception 'Submit for review before publishing' using errcode = '42501';
   end if;
   new.published_at := now();
  else new.published_at := old.published_at;
  end if;
 else new.published_at := null;
 end if;
 return new;
end $$;
create function cms_private.record_version() returns trigger
language plpgsql security definer set search_path = '' as $$
begin
 insert into public.content_versions(content_type,content_id,snapshot,changed_by)
 values (tg_table_name::public.cms_content_type, case when tg_op = 'DELETE' then old.id else new.id end,
 jsonb_build_object('operation',tg_op,'record',case when tg_op = 'DELETE' then to_jsonb(old) else to_jsonb(new) end),auth.uid());
 return null;
end $$;

do $$ declare t text; begin
 foreach t in array array['mezmur','saints','feasts','prayers','articles'] loop
  execute format('alter table public.%I enable row level security',t);
  execute format('revoke all on public.%I from anon, authenticated',t);
  execute format('grant select on public.%I to anon',t);
  execute format('grant select,insert,update,delete on public.%I to authenticated',t);
  execute format('grant all on public.%I to service_role',t);
  execute format('create policy content_read on public.%I for select to anon,authenticated using (
   status = ''published'' or cms_private.current_role() in (''editor'',''admin'',''super_admin'') or
   (cms_private.current_role() = ''contributor'' and created_by = auth.uid()))',t);
  execute format('create policy content_insert on public.%I for insert to authenticated with check (
   cms_private.current_role() in (''editor'',''admin'',''super_admin'') or
   (cms_private.current_role() = ''contributor'' and created_by = auth.uid() and status = ''draft''))',t);
  execute format('create policy content_update on public.%I for update to authenticated using (
   cms_private.current_role() in (''editor'',''admin'',''super_admin'') or
   (cms_private.current_role() = ''contributor'' and created_by = auth.uid() and status = ''draft''))
   with check (cms_private.current_role() in (''editor'',''admin'',''super_admin'') or
   (cms_private.current_role() = ''contributor'' and created_by = auth.uid() and status in (''draft'',''pending_review'')))',t);
  execute format('create policy content_delete on public.%I for delete to authenticated using (cms_private.current_role() in (''admin'',''super_admin''))',t);
  execute format('create trigger content_guard before insert or update on public.%I for each row execute function cms_private.guard_content()',t);
  execute format('create trigger content_revision after insert or update or delete on public.%I for each row execute function cms_private.record_version()',t);
  execute format('create index on public.%I(status,published_at desc)',t);
  execute format('create index on public.%I(created_by)',t);
 end loop;
 foreach t in array array['categories','singers','tags'] loop
  execute format('alter table public.%I enable row level security',t);
  execute format('revoke all on public.%I from anon, authenticated',t);
  execute format('grant select on public.%I to anon',t);
  execute format('grant select,insert,update,delete on public.%I to authenticated',t);
  execute format('grant all on public.%I to service_role',t);
  execute format('create policy taxonomy_read on public.%I for select to anon,authenticated using (true)',t);
  execute format('create policy taxonomy_manage on public.%I for all to authenticated using (cms_private.current_role() in (''admin'',''super_admin'')) with check (cms_private.current_role() in (''admin'',''super_admin''))',t);
 end loop;
end $$;
create trigger categories_updated before update on public.categories for each row execute function public.set_updated_at();
create trigger singers_updated before update on public.singers for each row execute function public.set_updated_at();
alter table public.mezmur_tags enable row level security;
revoke all on public.mezmur_tags from anon,authenticated;
grant select on public.mezmur_tags to anon;
grant select,insert,delete on public.mezmur_tags to authenticated;
grant all on public.mezmur_tags to service_role;
create policy links_read on public.mezmur_tags for select to anon,authenticated
using (exists (select 1 from public.mezmur m where m.id = mezmur_id));
create policy links_insert on public.mezmur_tags for insert to authenticated with check (
 cms_private.current_role() in ('editor','admin','super_admin') or exists (
 select 1 from public.mezmur m where m.id = mezmur_id and m.created_by = auth.uid() and m.status = 'draft' and cms_private.current_role() = 'contributor'));
create policy links_delete on public.mezmur_tags for delete to authenticated using (
 cms_private.current_role() in ('editor','admin','super_admin') or exists (
 select 1 from public.mezmur m where m.id = mezmur_id and m.created_by = auth.uid() and m.status = 'draft' and cms_private.current_role() = 'contributor'));

create table public.content_reports (
 id uuid primary key default gen_random_uuid(), content_type public.cms_content_type not null,
 content_id uuid not null, message text not null check (length(trim(message)) between 10 and 4000),
 reporter_email text check (length(reporter_email) <= 254),
 status text not null default 'open' check (status in ('open','resolved','dismissed')),
 created_at timestamptz not null default now(), updated_at timestamptz not null default now()
);
create index content_reports_status_idx on public.content_reports(status,created_at);
alter table public.content_reports enable row level security;
revoke all on public.content_reports from anon,authenticated;
grant select,update,delete on public.content_reports to authenticated;
grant all on public.content_reports to service_role;
create policy reports_review on public.content_reports for select to authenticated using (cms_private.current_role() in ('editor','admin','super_admin'));
create policy reports_update on public.content_reports for update to authenticated using (cms_private.current_role() in ('editor','admin','super_admin')) with check (cms_private.current_role() in ('editor','admin','super_admin'));
create policy reports_delete on public.content_reports for delete to authenticated using (cms_private.current_role() in ('admin','super_admin'));
create trigger reports_updated before update on public.content_reports for each row execute function public.set_updated_at();
-- Public submissions must pass through a future rate-limited, CAPTCHA-verified server endpoint.
-- Direct anonymous inserts intentionally remain denied.
revoke all on function cms_private.sync_profile_email(), cms_private.guard_content(), cms_private.record_version() from public,anon,authenticated;
commit;
