\set ON_ERROR_STOP on

insert into auth.users(id) values
  ('11111111-1111-1111-1111-111111111111'),
  ('22222222-2222-2222-2222-222222222222');
insert into public.profiles(id, role) values
  ('11111111-1111-1111-1111-111111111111', 'super_admin'),
  ('22222222-2222-2222-2222-222222222222', 'user');

-- Seed production-shaped pre-migration records through the protected metadata
-- context; normal CMS saves below do not receive this setting.
select set_config('tewahedo.approval_via_rpc', 'on', false);
insert into public.mezmur_data_import
  (mezmur_id, slug, title, lyrics_amharic, status, review_status, rights_status,
   publication_approved_at, publication_approved_by, youtube_url, updated_at)
values
  ('shared-id', 'target-mezmur', 'Target', 'የዒላማ ግጥም', 'draft', 'pending', 'owned',
   now(), '11111111-1111-1111-1111-111111111111', null, '2026-10-24T12:00:00Z'),
  ('shared-id', 'same-id-other-row', 'Other', 'ሌላ ግጥም', 'draft', 'pending', 'owned',
   now(), '11111111-1111-1111-1111-111111111111', null, '2026-10-24T12:00:00Z'),
  ('media-id', 'media-only', 'Media only', 'የማይታይ ግጥም', 'draft', 'pending', 'unknown',
   null, null, 'https://youtu.be/abcdefghijk', '2026-10-24T12:00:00Z'),
  ('blocked-id', 'blocked', 'Blocked', 'ግጥም', 'draft', 'approved', 'unknown',
   null, null, null, '2026-10-24T12:00:00Z');
select set_config('tewahedo.approval_via_rpc', 'off', false);

set role authenticated;
select set_config('request.jwt.claim.role', 'authenticated', false);
select set_config('request.jwt.claim.sub', '11111111-1111-1111-1111-111111111111', false);

insert into public.mezmur_data_import
  (mezmur_id, slug, title, lyrics_amharic, status, review_status, rights_status, updated_at)
values ('saved-draft-id', 'saved-draft', 'Saved draft', 'ድራፍት', 'draft', 'pending', 'unknown',
        '2026-10-24T12:00:00Z');
do $$ begin
  if exists (select 1 from public.mezmur_public where slug = 'saved-draft') then
    raise exception 'Saved draft became public';
  end if;
end $$;

-- Publishing does not require review_status=approved and updates only the
-- single row locked by its unique slug, even when mezmur_id is duplicated.
select public.publish_mezmur_import('target-mezmur', '2026-10-24T12:00:00Z');
do $$ begin
  if (select status from public.mezmur_data_import where slug = 'target-mezmur') <> 'published'
     or (select status from public.mezmur_data_import where slug = 'same-id-other-row') <> 'draft' then
    raise exception 'Publication did not target exactly one row';
  end if;
  if (select count(*) from public.mezmur_public where slug = 'target-mezmur') <> 1 then
    raise exception 'Eligible published Mezmur is not public';
  end if;
end $$;

-- Unpublish remains an ordinary staff transition.
update public.mezmur_data_import set status = 'draft' where slug = 'target-mezmur';
do $$ begin
  if exists (select 1 from public.mezmur_public where slug = 'target-mezmur') then
    raise exception 'Draft remains publicly visible';
  end if;
end $$;

-- Unknown rights may publish only to a YouTube/source destination; lyrics are redacted.
select public.publish_mezmur_import('media-only', '2026-10-24T12:00:00Z');
do $$ begin
  if (select lyrics_amharic from public.mezmur_public where slug = 'media-only') is not null then
    raise exception 'Unverified lyrics were exposed';
  end if;
end $$;

do $$ begin
  begin
    perform public.publish_mezmur_import('blocked', '2026-10-24T12:00:00Z');
    raise exception 'Missing rights/source unexpectedly published';
  exception when check_violation then null;
  end;
end $$;

reset role;
set role authenticated;
select set_config('request.jwt.claim.sub', '22222222-2222-2222-2222-222222222222', false);
do $$ begin
  begin
    perform public.publish_mezmur_import('blocked', '2026-10-24T12:00:00Z');
    raise exception 'Unauthorized user unexpectedly published';
  exception when insufficient_privilege then null;
  end;
end $$;

reset role;
set role anon;
select set_config('request.jwt.claim.sub', '', false);
do $$ begin
  begin
    perform 1 from public.mezmur_data_import limit 1;
    raise exception 'Anonymous user can read the protected base table';
  exception when insufficient_privilege then null;
  end;
  if (select count(*) from public.mezmur_public where slug = 'media-only') <> 1 then
    raise exception 'Anonymous public projection is unavailable';
  end if;
end $$;
reset role;

select 'mezmur two-state publication tests passed' as result;
