-- Search Buddy access to indexed private Church Library passages for signed-in
-- staff. Anonymous callers remain restricted to the existing public book gate.
-- This migration does not publish, re-import, or alter any book or passage.
begin;

create extension if not exists vector with schema extensions;

-- Query expansion is retrieval-only. It never changes or invents source text.
-- Staff-managed approved aliases are included when that optional table exists.
create or replace function public.church_library_search_terms(input text)
returns text[]
language plpgsql
stable
security invoker
set search_path = pg_catalog, public
as $function$
declare
  q text := left(btrim(coalesce(input, '')), 500);
  folded text := public.church_library_fold_am(q);
  terms text[] := array[q];
  reviewed_terms text[];
begin
  if q = '' then return array[]::text[]; end if;

  if folded ~ '(baptism|sacrament of baptism|ጥምቀት|ምሥጢረ ጥምቀት)' then
    terms := terms || array['baptism','sacrament of baptism','ጥምቀት','ምሥጢረ ጥምቀት'];
  end if;
  if folded ~ '(seven sacraments|sacraments|ሰባቱ ምሥጢራት|ምሥጢራተ ቤተ ክርስቲያን)' then
    terms := terms || array['seven sacraments','sacraments','ሰባቱ ምሥጢራት','ምሥጢራተ ቤተ ክርስቲያን'];
  end if;
  if folded ~ '(five pillars|pillars of mystery|አምስቱ አእማደ ምሥጢር|አዕማደ ምሥጢራት)' then
    terms := terms || array['five pillars of mystery','pillars of mystery','አምስቱ አእማደ ምሥጢር','አዕማደ ምሥጢራት'];
  end if;
  if folded ~ '(holy trinity|trinity|ሥላሴ|ምሥጢረ ሥላሴ)' then
    terms := terms || array['holy trinity','trinity','ሥላሴ','ምሥጢረ ሥላሴ'];
  end if;
  if folded ~ '(holy communion|eucharist|qurban|ቁርባን|ምሥጢረ ቁርባን)' then
    terms := terms || array['holy communion','eucharist','qurban','ቁርባን','ምሥጢረ ቁርባን'];
  end if;

  if to_regclass('public.church_library_search_aliases') is not null then
    execute $sql$
      select coalesce(array_agg(distinct expanded_term), array[]::text[])
      from public.church_library_search_aliases a
      cross join lateral unnest(a.expansion) expanded_term
      where a.review_status = 'approved'
        and strpos($1, a.alias_folded) > 0
    $sql$ into reviewed_terms using folded;
    terms := terms || coalesce(reviewed_terms, array[]::text[]);
  end if;

  return array(
    select distinct btrim(term)
    from unnest(terms) term
    where nullif(btrim(term), '') is not null
  );
end
$function$;

revoke all on function public.church_library_search_terms(text) from public, anon, authenticated;

create or replace function public.search_church_library_sections(
  search_query text,
  result_limit integer default 8,
  search_language text default null
)
returns table (
  passage_id text,
  passage_key text,
  book_id uuid,
  book_slug text,
  book_title text,
  book_language text,
  section_key text,
  section_title text,
  chapter_title text,
  excerpt text,
  page_start integer,
  page_end integer,
  source_document_name text,
  keyword_rank real
)
language plpgsql
stable
security definer
set search_path = pg_catalog, public, extensions
as $function$
declare
  q text := left(btrim(coalesce(search_query, '')), 300);
  q_ts pg_catalog.tsquery;
  q_terms text[];
  n integer := greatest(1, least(coalesce(result_limit, 8), 30));
  staff_access boolean := coalesce(auth.uid() is not null and public.is_staff(), false);
begin
  if q = '' then return; end if;
  q_terms := public.church_library_search_terms(q);
  q_ts := websearch_to_tsquery('simple', q);

  return query
  with eligible as materialized (
    select p.*, b.slug, b.title as book_title_value, b.language as book_language_value,
           b.source_document_name, s.stable_key as section_key_value,
           s.title as section_title_value, ch.title as chapter_title_value
    from public.church_library_passages p
    join public.church_library_books b on b.id = p.book_id
    left join public.church_library_sections s on s.id = p.section_id
    left join public.church_library_sections ch on ch.id = s.parent_section_id
    where (p.version_id is null or p.version_id = b.current_version_id)
      and (
        public.church_library_book_is_public(b.id)
        or (
          staff_access
          and (b.processing_status = 'ready' or b.ingestion_status = 'ready')
        )
      )
      and (staff_access or s.id is null or coalesce(s.publication_status, 'published') = 'published')
  ), ranked as (
    select e.*,
      greatest(
        case when e.search_document @@ q_ts then ts_rank_cd(e.search_document, q_ts) else 0 end,
        coalesce((
          select max(
            case
              when e.search_folded = public.church_library_fold_am(term) then 2.0
              when strpos(e.search_folded, public.church_library_fold_am(term)) > 0 then 1.0
              else similarity(e.search_folded, public.church_library_fold_am(term))
            end
          ) from unnest(q_terms) term
        ), 0)
      )
      + case when search_language is not null and e.book_language_value in (search_language, 'mixed') then 0.1 else 0 end
      + case when coalesce((select max(strpos(public.church_library_fold_am(coalesce(e.section_title_value,'')), public.church_library_fold_am(term))) from unnest(q_terms) term), 0) > 0 then 0.5 else 0 end
      as score
    from eligible e
    where e.search_document @@ q_ts
       or exists (
         select 1 from unnest(q_terms) term
         where strpos(e.search_folded, public.church_library_fold_am(term)) > 0
            or strpos(public.church_library_fold_am(e.book_title_value), public.church_library_fold_am(term)) > 0
            or strpos(public.church_library_fold_am(coalesce(e.section_title_value, '')), public.church_library_fold_am(term)) > 0
            or similarity(e.search_folded, public.church_library_fold_am(term)) >= 0.28
       )
  )
  select r.id::text, r.stable_key, r.book_id, r.slug, r.book_title_value,
         r.book_language_value, r.section_key_value, r.section_title_value,
         r.chapter_title_value, left(r.content, 600), r.page_start, r.page_end,
         r.source_document_name, r.score::real
  from ranked r
  order by r.score desc, r.book_title_value, r.passage_order
  limit n;
end
$function$;

alter function public.search_church_library_sections(text, integer, text) owner to postgres;
revoke all on function public.search_church_library_sections(text, integer, text) from public;
grant execute on function public.search_church_library_sections(text, integer, text) to anon, authenticated, service_role;

create or replace function public.search_church_library(
  search_query text,
  result_limit integer default 8,
  search_language text default null,
  query_embedding extensions.vector(384) default null
)
returns table (
  passage_id text,
  book_id uuid,
  title text,
  author text,
  language text,
  excerpt text,
  page_start integer,
  page_end integer,
  chapter_reference text,
  locator_label text,
  source_url text,
  keyword_rank real,
  semantic_rank real
)
language plpgsql
stable
security definer
set search_path = pg_catalog, public, extensions
as $function$
declare
  q text := left(btrim(coalesce(search_query, '')), 500);
  q_ts pg_catalog.tsquery;
  q_terms text[];
  n integer := greatest(1, least(coalesce(result_limit, 8), 30));
  staff_access boolean := coalesce(auth.uid() is not null and public.is_staff(), false);
begin
  if q = '' then return; end if;
  q_terms := public.church_library_search_terms(q);
  q_ts := websearch_to_tsquery('simple', q);

  return query
  with eligible as materialized (
    select p.*, b.title, b.author, b.source_url as book_source_url, b.allow_source_link
    from public.church_library_passages p
    join public.church_library_books b on b.id = p.book_id
    where (p.version_id is null or p.version_id = b.current_version_id)
      and (
        public.church_library_book_is_public(b.id)
        or (
          staff_access
          and (b.processing_status = 'ready' or b.ingestion_status = 'ready')
        )
      )
  ), ranked as (
    select e.*,
      greatest(
        case when e.search_document @@ q_ts then ts_rank_cd(e.search_document, q_ts) else 0 end,
        coalesce((
          select max(
            case
              when public.church_library_fold_am(e.content) = public.church_library_fold_am(term) then 2.0
              when strpos(public.church_library_fold_am(e.content), public.church_library_fold_am(term)) > 0 then 1.0
              else similarity(public.church_library_fold_am(e.content), public.church_library_fold_am(term))
            end
          ) from unnest(q_terms) term
        ), 0)
      )::real as kr,
      case
        when query_embedding is null or e.embedding is null then 0::real
        else greatest(0::real, (1 - (e.embedding <=> query_embedding))::real)
      end as sr
    from eligible e
    where e.search_document @@ q_ts
       or exists (
         select 1 from unnest(q_terms) term
         where strpos(public.church_library_fold_am(e.content), public.church_library_fold_am(term)) > 0
            or similarity(public.church_library_fold_am(e.content), public.church_library_fold_am(term)) >= 0.28
       )
       or (query_embedding is not null and e.embedding is not null and (1 - (e.embedding <=> query_embedding)) >= 0.35)
  )
  select r.id::text, r.book_id, r.title, r.author, r.language, left(r.content, 1200),
         r.page_start, r.page_end, r.chapter_reference,
         coalesce(r.locator_label, 'Passage ' || (r.passage_order + 1)::text),
         case when r.allow_source_link and r.book_source_url ~* '^https?://' then r.book_source_url else null end,
         r.kr, r.sr
  from ranked r
  order by (r.kr + r.sr) desc,
           case when search_language is not null and r.language in (search_language, 'mixed') then 0 else 1 end,
           r.title, r.passage_order
  limit n;
end
$function$;

alter function public.search_church_library(text, integer, text, extensions.vector) owner to postgres;
revoke all on function public.search_church_library(text, integer, text, extensions.vector) from public;
grant execute on function public.search_church_library(text, integer, text, extensions.vector) to anon, authenticated, service_role;

create or replace function public.church_library_search_status()
returns table (eligible_books bigint, indexed_passages bigint, embedded_passages bigint)
language plpgsql
stable
security definer
set search_path = pg_catalog, public, extensions
as $function$
declare staff_access boolean := coalesce(auth.uid() is not null and public.is_staff(), false);
begin
  return query
  select count(distinct b.id)::bigint, count(p.id)::bigint, count(p.embedding)::bigint
  from public.church_library_books b
  left join public.church_library_passages p
    on p.book_id = b.id and (p.version_id is null or p.version_id = b.current_version_id)
  where public.church_library_book_is_public(b.id)
     or (staff_access and (b.processing_status = 'ready' or b.ingestion_status = 'ready'));
end
$function$;

alter function public.church_library_search_status() owner to postgres;
revoke all on function public.church_library_search_status() from public;
grant execute on function public.church_library_search_status() to anon, authenticated, service_role;

-- Suggested questions remain tied to an approved FAQ and at least one source
-- book the current caller may retrieve. Taking a book private removes its
-- question from anonymous suggestions immediately, without deleting the FAQ.
create or replace function public.list_church_library_faq_suggestions(
  search_language text default 'en',
  result_limit integer default 5
)
returns table (stable_id text, question text)
language plpgsql
stable
security definer
set search_path = pg_catalog, public
as $function$
declare staff_access boolean := coalesce(auth.uid() is not null and public.is_staff(), false);
begin
  if to_regclass('public.church_library_faqs') is null then return; end if;
  return query
  select f.stable_id,
         case when search_language = 'am' then f.question_am else f.question_en end
  from public.church_library_faqs f
  where f.publication_status = 'published'
    and f.review_status = 'approved'
    and exists (
      select 1
      from jsonb_array_elements(f.source_references) source
      join public.church_library_books b on b.slug = source->>'book_slug'
      where public.church_library_book_is_public(b.id)
         or (staff_access and (b.processing_status = 'ready' or b.ingestion_status = 'ready'))
    )
  order by f.published_at desc nulls last, f.stable_id
  limit least(greatest(coalesce(result_limit, 5), 1), 10);
end
$function$;

alter function public.list_church_library_faq_suggestions(text, integer) owner to postgres;
revoke all on function public.list_church_library_faq_suggestions(text, integer) from public;
grant execute on function public.list_church_library_faq_suggestions(text, integer) to anon, authenticated, service_role;

notify pgrst, 'reload schema';
commit;
