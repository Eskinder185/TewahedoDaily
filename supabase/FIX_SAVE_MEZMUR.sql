-- PASTE THIS ENTIRE SCRIPT into Supabase Dashboard → SQL Editor → Run
-- Project: tgvhpibzzkqxkcumrivh
-- Fix: missing public.save_mezmur (PGRST202 from CMS Mezmur editor)
-- Safe to re-run. Does not delete content. Does not wipe Oromo / keyword legacy fields.
-- Same body as supabase/migrations/20260930240000_restore_save_mezmur_rpc.sql

begin;

do $$
begin
  if to_regprocedure('public.is_staff()') is null then
    execute $fn$
      create function public.is_staff()
      returns boolean
      language sql
      stable
      security definer
      set search_path = ''
      as $body$
        select cms_private.current_role() in ('contributor', 'editor', 'admin', 'super_admin');
      $body$;
    $fn$;
    revoke all on function public.is_staff() from public, anon;
    grant execute on function public.is_staff() to authenticated, anon;
  end if;
end
$$;

create or replace function public.save_mezmur(
  payload jsonb,
  tag_ids uuid[],
  expected_updated_at timestamptz default null
)
returns public.mezmur
language plpgsql
security invoker
set search_path = ''
as $$
declare
  row_before public.mezmur;
  saved public.mezmur;
  desired public.content_status;
  target_id uuid := coalesce((payload->>'id')::uuid, gen_random_uuid());
  staff_ok boolean := false;
begin
  if auth.uid() is null then
    raise exception 'Authentication required' using errcode = '42501';
  end if;

  begin
    staff_ok := coalesce(public.is_staff(), false);
  exception
    when undefined_function then
      staff_ok := false;
  end;

  if not staff_ok and cms_private.current_role() is null then
    raise exception 'CMS permission required' using errcode = '42501';
  end if;

  if tag_ids is null then
    raise exception 'Tag list is required';
  end if;

  desired := coalesce((payload->>'status')::public.content_status, 'draft');

  select * into row_before
  from public.mezmur
  where id = target_id
  for update;

  if found then
    if expected_updated_at is null or expected_updated_at <> row_before.updated_at then
      raise exception 'This mezmur changed since you opened it. Reload before saving.'
        using errcode = '40001';
    end if;

    update public.mezmur set
      title = payload->>'title',
      slug = payload->>'slug',
      title_amharic = payload->>'title_amharic',
      title_oromo = case
        when payload ? 'title_oromo' then payload->>'title_oromo'
        else row_before.title_oromo
      end,
      description = payload->>'description',
      lyrics_amharic = payload->>'lyrics_amharic',
      lyrics_english = payload->>'lyrics_english',
      lyrics_oromo = case
        when payload ? 'lyrics_oromo' then payload->>'lyrics_oromo'
        else row_before.lyrics_oromo
      end,
      transliteration = payload->>'transliteration',
      youtube_url = payload->>'youtube_url',
      thumbnail_url = payload->>'thumbnail_url',
      audio_url = payload->>'audio_url',
      thumbnail_path = case
        when payload ? 'thumbnail_path' then payload->>'thumbnail_path'
        else row_before.thumbnail_path
      end,
      image_alt = case
        when payload ? 'image_alt' then payload->>'image_alt'
        else row_before.image_alt
      end,
      singer_id = (payload->>'singer_id')::uuid,
      category_id = (payload->>'category_id')::uuid,
      language = case
        when payload ? 'language' then payload->>'language'
        else row_before.language
      end,
      form = case
        when payload ? 'form' then nullif(payload->>'form', '')
        else row_before.form
      end,
      category = case
        when payload ? 'category' then payload->>'category'
        else row_before.category
      end,
      occasion = case
        when payload ? 'occasion' then payload->>'occasion'
        else row_before.occasion
      end,
      featured = coalesce((payload->>'featured')::boolean, false)
    where id = target_id
    returning * into saved;

    if not found then
      raise exception 'You cannot edit this mezmur' using errcode = '42501';
    end if;
  else
    if expected_updated_at is not null then
      raise exception 'Mezmur no longer available' using errcode = '42501';
    end if;

    insert into public.mezmur (
      id, title, slug, title_amharic, title_oromo, description,
      lyrics_amharic, lyrics_english, lyrics_oromo, transliteration,
      youtube_url, thumbnail_url, audio_url, thumbnail_path, image_alt,
      singer_id, category_id, language, form, category, occasion, featured, status
    )
    values (
      target_id,
      payload->>'title',
      payload->>'slug',
      payload->>'title_amharic',
      payload->>'title_oromo',
      payload->>'description',
      payload->>'lyrics_amharic',
      payload->>'lyrics_english',
      payload->>'lyrics_oromo',
      payload->>'transliteration',
      payload->>'youtube_url',
      payload->>'thumbnail_url',
      payload->>'audio_url',
      payload->>'thumbnail_path',
      payload->>'image_alt',
      (payload->>'singer_id')::uuid,
      (payload->>'category_id')::uuid,
      payload->>'language',
      nullif(payload->>'form', ''),
      payload->>'category',
      payload->>'occasion',
      coalesce((payload->>'featured')::boolean, false),
      'draft'
    )
    on conflict (id) do nothing
    returning * into saved;

    if not found then
      raise exception 'Mezmur already exists or is not accessible' using errcode = '42501';
    end if;
  end if;

  delete from public.mezmur_tags where mezmur_id = target_id;
  insert into public.mezmur_tags (mezmur_id, tag_id)
  select target_id, unnest
  from unnest(tag_ids)
  on conflict do nothing;

  if desired is distinct from saved.status then
    update public.mezmur
    set status = desired
    where id = target_id
    returning * into saved;
    if not found then
      raise exception 'You cannot change this status' using errcode = '42501';
    end if;
  end if;

  return saved;
end;
$$;

revoke all on function public.save_mezmur(jsonb, uuid[], timestamptz) from public, anon;
grant execute on function public.save_mezmur(jsonb, uuid[], timestamptz) to authenticated;

notify pgrst, 'reload schema';

commit;
