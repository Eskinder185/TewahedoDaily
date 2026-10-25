-- Forward-only repair: make bulk-job creation durable and idempotent while
-- preserving the existing enrichment tables and protected publication RPCs.
begin;

create or replace function public.create_mezmur_enrichment_job(
  p_mode text,
  p_import_ids uuid[] default '{}'
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  v_actor uuid := auth.uid();
  v_role text;
  v_ids uuid[];
  v_key text;
  v_job public.mezmur_enrichment_jobs%rowtype;
begin
  select role into v_role from public.profiles where id = v_actor;
  if v_actor is null or v_role not in ('editor','admin','super_admin') then
    raise exception 'CMS staff role required' using errcode = '42501';
  end if;
  if p_mode not in ('all','selected','zemari','classification','missing_categories','missing_occasions','retry_failed') then
    raise exception 'Unsupported enrichment mode' using errcode = '22023';
  end if;
  select coalesce(array_agg(distinct value order by value), '{}') into v_ids
  from unnest(coalesce(p_import_ids, '{}')) value;
  if p_mode = 'selected' and cardinality(v_ids) = 0 then
    raise exception 'Select at least one Mezmur' using errcode = '22023';
  end if;
  if cardinality(v_ids) > 2000 then
    raise exception 'Selected jobs are limited to 2000 stable import IDs' using errcode = '22023';
  end if;

  v_key := v_actor::text || ':' || p_mode || ':' || array_to_string(v_ids, ',');
  perform pg_advisory_xact_lock(hashtextextended(v_key, 0));

  select * into v_job
  from public.mezmur_enrichment_jobs
  where created_by = v_actor
    and mode = p_mode
    and requested_import_ids = v_ids
    and status in ('queued','running','cancel_requested')
  order by created_at desc
  limit 1
  for update;

  if found then
    return jsonb_build_object('created', false, 'job', to_jsonb(v_job));
  end if;

  insert into public.mezmur_enrichment_jobs(mode, requested_import_ids, created_by)
  values (p_mode, v_ids, v_actor)
  returning * into v_job;
  return jsonb_build_object('created', true, 'job', to_jsonb(v_job));
end $$;

revoke all on function public.create_mezmur_enrichment_job(text, uuid[]) from public, anon;
grant execute on function public.create_mezmur_enrichment_job(text, uuid[]) to authenticated;

notify pgrst, 'reload schema';
commit;
