begin;
-- Private buckets: public downloads still go through object RLS. No public-bucket bypass.
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types) values
 ('mezmur-images','mezmur-images',false,10485760,array['image/jpeg','image/png','image/webp']),
 ('mezmur-audio','mezmur-audio',false,52428800,array['audio/mpeg','audio/mp4','audio/ogg','audio/wav']),
 ('saints','saints',false,10485760,array['image/jpeg','image/png','image/webp']),
 ('feasts','feasts',false,10485760,array['image/jpeg','image/png','image/webp']),
 ('articles','articles',false,10485760,array['image/jpeg','image/png','image/webp']),
 ('general-media','general-media',false,10485760,array['image/jpeg','image/png','image/webp','application/pdf'])
on conflict (id) do update set public = false, file_size_limit = excluded.file_size_limit, allowed_mime_types = excluded.allowed_mime_types;

-- Object names: <content_type>/<content_uuid>/<filename>. No anonymous listing of drafts.
create function cms_private.media_is_published(object_name text) returns boolean
language plpgsql stable security definer set search_path = '' as $$
declare parts text[] := string_to_array(object_name,'/'); visible boolean;
begin
 if array_length(parts,1) < 3 or parts[1] not in ('mezmur','saints','feasts','prayers','articles') then return false; end if;
 execute format('select exists(select 1 from public.%I where id::text = $1 and status = ''published'')',parts[1]) into visible using parts[2];
 return visible;
end $$;
revoke all on function cms_private.media_is_published(text) from public;
grant execute on function cms_private.media_is_published(text) to anon,authenticated;
create policy cms_media_read on storage.objects for select to anon,authenticated using (
 bucket_id in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') and
 (cms_private.current_role() in ('editor','admin','super_admin') or cms_private.media_is_published(name))
);
create policy cms_media_insert on storage.objects for insert to authenticated with check (
 bucket_id in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') and cms_private.current_role() in ('admin','super_admin')
);
create policy cms_media_update on storage.objects for update to authenticated using (
 bucket_id in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') and cms_private.current_role() in ('admin','super_admin')
) with check (
 bucket_id in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') and cms_private.current_role() in ('admin','super_admin')
);
create policy cms_media_delete on storage.objects for delete to authenticated using (
 bucket_id in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') and cms_private.current_role() in ('admin','super_admin')
);
-- Restrictive boundary preserves policies for unrelated buckets.
create policy cms_media_select_boundary on storage.objects as restrictive for select to anon,authenticated
using (bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or (cms_private.current_role() in ('editor','admin','super_admin') or cms_private.media_is_published(name)))
;
-- Restrictive boundary preserves policies for unrelated buckets.
create policy cms_media_insert_boundary on storage.objects as restrictive for insert to anon,authenticated
with check (bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or (cms_private.current_role() in ('admin','super_admin')))
;
-- Restrictive boundary preserves policies for unrelated buckets.
create policy cms_media_update_boundary on storage.objects as restrictive for update to anon,authenticated
using (bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or (cms_private.current_role() in ('admin','super_admin')))
with check (bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or (cms_private.current_role() in ('admin','super_admin')))
;
-- Restrictive boundary preserves policies for unrelated buckets.
create policy cms_media_delete_boundary on storage.objects as restrictive for delete to anon,authenticated
using (bucket_id not in ('mezmur-images','mezmur-audio','saints','feasts','articles','general-media') or (cms_private.current_role() in ('admin','super_admin')))
;
commit;

