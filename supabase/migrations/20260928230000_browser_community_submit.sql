-- Allow anonymous/authenticated visitors to submit community content via the
-- browser Supabase client (publishable key + RLS-safe SECURITY DEFINER RPC).
-- Does not open SELECT/UPDATE/DELETE on community_submissions to the public.
-- Keeps receive_community_submission for the optional Turnstile Pages Function path.

begin;

create or replace function public.submit_community_submission(payload jsonb)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  saved public.community_submissions;
  submission_kind public.submission_type;
  tags text[];
begin
  -- Honeypot: bots that fill hidden "website" fail silently with a fake receipt.
  if nullif(trim(coalesce(payload->>'website', '')), '') is not null then
    return jsonb_build_object('reference', 'TD-' || extract(year from now())::text || '-00000');
  end if;

  submission_kind := (payload->>'submission_type')::public.submission_type;
  if submission_kind is distinct from 'mezmur' and submission_kind is distinct from 'correction' then
    raise exception 'This form accepts Mezmur and correction submissions.' using errcode = '22023';
  end if;

  tags := coalesce(
    array(select jsonb_array_elements_text(coalesce(payload->'suggested_tags', '[]'::jsonb))),
    '{}'::text[]
  );

  -- Allowlisted columns only; status and admin fields are never taken from the client.
  insert into public.community_submissions (
    submission_type, title, title_amharic, singer_name, youtube_url,
    lyrics_amharic, lyrics_english, lyrics_oromo, transliteration,
    suggested_category, suggested_tags, contributor_name, contributor_email,
    credit_requested, source_notes, source_reference, related_content_id,
    related_legacy_key, related_content_title, current_page_url,
    correction_type, suggested_correction, explanation, status
  ) values (
    submission_kind,
    payload->>'title',
    coalesce(payload->>'title_amharic', ''),
    coalesce(payload->>'singer_name', ''),
    coalesce(payload->>'youtube_url', ''),
    coalesce(payload->>'lyrics_amharic', ''),
    coalesce(payload->>'lyrics_english', ''),
    coalesce(payload->>'lyrics_oromo', ''),
    coalesce(payload->>'transliteration', ''),
    coalesce(payload->>'suggested_category', ''),
    tags,
    payload->>'contributor_name',
    coalesce(payload->>'contributor_email', ''),
    coalesce((payload->>'credit_requested')::boolean, false),
    coalesce(payload->>'source_notes', ''),
    coalesce(payload->>'source_reference', ''),
    nullif(payload->>'related_content_id', '')::uuid,
    nullif(payload->>'related_legacy_key', ''),
    nullif(payload->>'related_content_title', ''),
    nullif(payload->>'current_page_url', ''),
    nullif(payload->>'correction_type', ''),
    coalesce(payload->>'suggested_correction', ''),
    coalesce(payload->>'explanation', ''),
    'submitted'
  )
  returning * into saved;

  return jsonb_build_object('reference', saved.public_reference);
exception
  when check_violation then
    raise exception 'Please check your submission and try again.' using errcode = '23514';
  when foreign_key_violation then
    raise exception 'Related content was not found. Open the form from a Mezmur page.' using errcode = '23503';
  when invalid_text_representation then
    raise exception 'Invalid submission data.' using errcode = '22P02';
end;
$$;

revoke all on function public.submit_community_submission(jsonb) from public;
grant execute on function public.submit_community_submission(jsonb) to anon, authenticated;

-- Direct table INSERT remains denied for browser roles (RPC only).
-- Staff SELECT policy unchanged.

commit;
