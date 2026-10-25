\set ON_ERROR_STOP on

insert into auth.users(id) values
  ('10000000-0000-0000-0000-000000000001'),
  ('10000000-0000-0000-0000-000000000002'),
  ('10000000-0000-0000-0000-000000000003');
insert into public.profiles(id, role) values
  ('10000000-0000-0000-0000-000000000001', 'admin'),
  ('10000000-0000-0000-0000-000000000002', 'super_admin'),
  ('10000000-0000-0000-0000-000000000003', 'editor');

insert into public.zemaris(id, slug, name, status) values
  ('20000000-0000-0000-0000-000000000001', 'source-zemari', 'Source Zemari', 'published'),
  ('20000000-0000-0000-0000-000000000002', 'target-zemari', 'Target Zemari', 'published');
insert into public.mezmur_collections_import(collection_id, collection_slug, title, status)
values ('collection-1', 'collection-1', 'Collection One', 'published');
insert into public.mezmur_sections_import(section_id, section_slug, collection_slug, title, status)
values ('section-1', 'section-1', 'collection-1', 'Section One', 'published');
select set_config('tewahedo.publication_via_rpc', 'on', false);
select set_config('tewahedo.approval_via_rpc', 'on', false);
insert into public.mezmur_data_import(
  mezmur_id, slug, title, lyrics_amharic, status, zemari_id,
  singer_id, singer_slug, singer_name, rights_status,
  publication_approved_at, publication_approved_by, updated_at
) values (
  'mezmur-1', 'mezmur-1', 'Mezmur One', 'የሙከራ ግጥም', 'published',
  '20000000-0000-0000-0000-000000000001',
  'source-zemari', 'source-zemari', 'Source Zemari', 'owned', now(),
  '10000000-0000-0000-0000-000000000002', now()::text
);
select set_config('tewahedo.publication_via_rpc', 'off', false);
select set_config('tewahedo.approval_via_rpc', 'off', false);
insert into public.mezmur_section_links_import(mezmur_slug, section_slug) values ('mezmur-1', 'section-1');
insert into public.mezmur_category_links_import(mezmur_slug, category_slug) values ('mezmur-1', 'category-1');
insert into public.mezmur_occasion_links_import(mezmur_slug, occasion_slug) values ('mezmur-1', 'occasion-1');

-- Anonymous callers can see only the live published projection and its live
-- browse relationships, never the canonical Mezmur table.
set role anon;
select set_config('request.jwt.claim.sub', '', false);
select set_config('request.jwt.claim.role', 'anon', false);
do $$ begin
  if (select count(*) from public.mezmur_public where slug='mezmur-1') <> 1
    or (select count(*) from public.mezmur_collections_import where collection_slug='collection-1') <> 1
    or (select count(*) from public.mezmur_sections_import where section_slug='section-1') <> 1
    or (select count(*) from public.mezmur_section_links_import where mezmur_slug='mezmur-1') <> 1
    or (select count(*) from public.mezmur_category_links_import where mezmur_slug='mezmur-1') <> 1
    or (select count(*) from public.mezmur_occasion_links_import where mezmur_slug='mezmur-1') <> 1
  then raise exception 'live public browse rows were not available'; end if;
  begin
    perform 1 from public.mezmur_data_import limit 1;
    raise exception 'anonymous canonical Mezmur read unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;
reset role;

-- Create and edit remain available to staff and ordinary saves do not alter
-- trash metadata.
set role authenticated;
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000001', false);
select set_config('request.jwt.claim.role', 'authenticated', false);
insert into public.mezmur_data_import(mezmur_id, slug, title, status, updated_at)
values ('draft-1', 'draft-1', 'Draft One', 'draft', now()::text);
update public.mezmur_data_import set title = 'Draft One Edited' where mezmur_id = 'draft-1';

-- Admin trash hides the published record without touching any relationships.
select public.trash_hymn_content('mezmur', 'mezmur-1');
do $$ begin
  if (select count(*) from public.mezmur_data_import where mezmur_id='mezmur-1' and deleted_at is not null
      and deleted_by='10000000-0000-0000-0000-000000000001' and deleted_from_status='published' and status='draft') <> 1
  then raise exception 'trash metadata or original status was not preserved'; end if;
  if (select count(*) from public.mezmur_public where slug='mezmur-1') <> 0
  then raise exception 'trashed Mezmur remained public'; end if;
  if (select count(*) from public.mezmur_section_links_import where mezmur_slug='mezmur-1') <> 1
    or (select count(*) from public.mezmur_category_links_import where mezmur_slug='mezmur-1') <> 1
    or (select count(*) from public.mezmur_occasion_links_import where mezmur_slug='mezmur-1') <> 1
  then raise exception 'soft delete removed classification relationships'; end if;
  if (select count(*) from public.zemaris where id='20000000-0000-0000-0000-000000000001') <> 1
  then raise exception 'trashing a Mezmur deleted its Zemari'; end if;
end $$;

reset role;
set role anon;
select set_config('request.jwt.claim.sub', '', false);
select set_config('request.jwt.claim.role', 'anon', false);
do $$ begin
  if (select count(*) from public.mezmur_public where slug='mezmur-1') <> 0
    or (select count(*) from public.mezmur_section_links_import where mezmur_slug='mezmur-1') <> 0
    or (select count(*) from public.mezmur_category_links_import where mezmur_slug='mezmur-1') <> 0
    or (select count(*) from public.mezmur_occasion_links_import where mezmur_slug='mezmur-1') <> 0
  then raise exception 'trashed Mezmur or relationships remained public'; end if;
end $$;
reset role;
set role authenticated;
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000001', false);
select set_config('request.jwt.claim.role', 'authenticated', false);

-- Ordinary saves cannot forge deletion fields.
do $$ begin
  begin
    update public.mezmur_data_import set deleted_at = null where mezmur_id='mezmur-1';
    raise exception 'direct trash metadata update unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;

-- Restore is deliberately safe-as-draft; the original published status is
-- retained in the immutable audit event and returned by the RPC.
select public.restore_hymn_content('mezmur', 'mezmur-1');
do $$ begin
  if (select count(*) from public.mezmur_data_import where mezmur_id='mezmur-1'
      and deleted_at is null and status='draft') <> 1
  then raise exception 'restore did not produce an active draft'; end if;
  if not exists (
    select 1 from public.content_deletion_events
    where content_type='mezmur' and action='restored' and details->>'previous_status'='published'
  ) then raise exception 'restore audit lost original publication status'; end if;
end $$;

-- Re-publish through the guarded RPC, then trash again.
reset role;
set role authenticated;
select set_config('request.jwt.claim.role', 'authenticated', false);
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000002', false);
select public.publish_mezmur_import(
  'mezmur-1',
  (select updated_at from public.mezmur_data_import where mezmur_id='mezmur-1')
);
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000001', false);
select public.trash_hymn_content('mezmur', 'mezmur-1');

-- Admin cannot permanently delete; Super Admin can, and only this Mezmur's
-- link rows disappear. The Zemari survives.
do $$ begin
  begin
    perform public.permanently_delete_hymn_content('mezmur', 'mezmur-1');
    raise exception 'admin permanent delete unexpectedly succeeded';
  exception when insufficient_privilege then null;
  end;
end $$;
select set_config('request.jwt.claim.sub', '10000000-0000-0000-0000-000000000002', false);
select public.permanently_delete_hymn_content('mezmur', 'mezmur-1');
do $$ begin
  if exists (select 1 from public.mezmur_data_import where mezmur_id='mezmur-1')
  then raise exception 'Mezmur permanent delete failed'; end if;
  if not exists (select 1 from public.zemaris where id='20000000-0000-0000-0000-000000000001')
  then raise exception 'Mezmur permanent delete removed the Zemari'; end if;
  if exists (select 1 from public.mezmur_section_links_import where mezmur_slug='mezmur-1')
    or exists (select 1 from public.mezmur_category_links_import where mezmur_slug='mezmur-1')
    or exists (select 1 from public.mezmur_occasion_links_import where mezmur_slug='mezmur-1')
  then raise exception 'Mezmur relationships were orphaned'; end if;
end $$;

-- A Zemari with a Mezmur cannot be deleted. Explicit reassignment preserves
-- the Mezmur and moves it to an active target.
insert into public.mezmur_data_import(mezmur_id, slug, title, status, zemari_id, updated_at)
values ('mezmur-2', 'mezmur-2', 'Mezmur Two', 'draft', '20000000-0000-0000-0000-000000000001', now()::text);
select public.trash_hymn_content('zemari', '20000000-0000-0000-0000-000000000001');
do $$ begin
  begin
    perform public.permanently_delete_hymn_content('zemari', '20000000-0000-0000-0000-000000000001');
    raise exception 'referenced Zemari permanent delete unexpectedly succeeded';
  exception when foreign_key_violation then null;
  end;
end $$;
select public.reassign_and_delete_zemari(
  '20000000-0000-0000-0000-000000000001',
  '20000000-0000-0000-0000-000000000002'
);
do $$ begin
  if not exists (select 1 from public.mezmur_data_import where mezmur_id='mezmur-2'
      and zemari_id='20000000-0000-0000-0000-000000000002')
  then raise exception 'Zemari reassignment lost the Mezmur'; end if;
end $$;

-- Collection deletion refuses to cascade into sections; section deletion only
-- removes its own links and never removes a Mezmur.
select public.trash_hymn_content('collection', 'collection-1');
do $$ begin
  begin
    perform public.permanently_delete_hymn_content('collection', 'collection-1');
    raise exception 'collection cascade unexpectedly succeeded';
  exception when foreign_key_violation then null;
  end;
end $$;
select public.restore_hymn_content('collection', 'collection-1');
select public.trash_hymn_content('section', 'section-1');
select public.permanently_delete_hymn_content('section', 'section-1');
do $$ begin
  if not exists (select 1 from public.mezmur_data_import where mezmur_id='mezmur-2')
  then raise exception 'section deletion removed a Mezmur'; end if;
end $$;

reset role;
select 'hymn trash schema repair integration test passed' as result;

