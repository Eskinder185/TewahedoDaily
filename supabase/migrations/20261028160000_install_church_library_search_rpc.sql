-- TEWAHEDODAILY: reconcile the deployed legacy Church Library just far enough
-- to install public passage search and stable reader citations.
--
-- Production preflight on 2026-10-28 confirmed that the existing tables are:
--   church_library_books: id, title, author, language, category, description,
--     storage_path, ingestion_status, search_enabled, audit timestamps/users
--   church_library_passages: id, book_id, passage_order, language, content
-- The migration is additive and transactional. It preserves every book and
-- passage, does not create a second library, does not publish a private book,
-- and does not make the private Storage bucket public.

begin;

create extension if not exists vector with schema extensions;

do $preflight$
declare
  missing text[];
begin
  if to_regclass('public.church_library_books') is null
     or to_regclass('public.church_library_passages') is null then
    raise exception
      'Church Library base schema is missing church_library_books or church_library_passages.'
      using errcode = '42P01';
  end if;

  select array_agg(required.table_name || '.' || required.column_name
                   order by required.table_name, required.column_name)
    into missing
  from (values
    ('church_library_books', 'id'),
    ('church_library_books', 'title'),
    ('church_library_books', 'author'),
    ('church_library_books', 'language'),
    ('church_library_books', 'ingestion_status'),
    ('church_library_books', 'search_enabled'),
    ('church_library_passages', 'id'),
    ('church_library_passages', 'book_id'),
    ('church_library_passages', 'passage_order'),
    ('church_library_passages', 'language'),
    ('church_library_passages', 'content')
  ) as required(table_name, column_name)
  where not exists (
    select 1
    from information_schema.columns c
    where c.table_schema = 'public'
      and c.table_name = required.table_name
      and c.column_name = required.column_name
  );

  if coalesce(cardinality(missing), 0) > 0 then
    raise exception 'Church Library search prerequisites are missing: %', array_to_string(missing, ', ')
      using errcode = '42703';
  end if;
end
$preflight$;

-- Add the current access/search metadata without changing legacy intent.
alter table public.church_library_books
  add column if not exists title_amharic text,
  add column if not exists cover_storage_path text,
  add column if not exists original_publication_info text,
  add column if not exists source_url text,
  add column if not exists access_level text not null default 'private',
  add column if not exists rights_status text not null default 'unknown',
  add column if not exists rights_notes text,
  add column if not exists allow_search_quotes boolean not null default false,
  add column if not exists allow_source_link boolean not null default false,
  add column if not exists approved_for_ingestion boolean not null default false,
  add column if not exists public_retrieval_enabled boolean not null default false,
  add column if not exists processing_status text not null default 'not_uploaded',
  add column if not exists extraction_quality text not null default 'not_checked',
  add column if not exists extraction_notes text,
  add column if not exists current_version_id uuid;

-- Legacy search_enabled and ingestion_status are the deployed source of truth.
-- Mirroring them does not authorize any previously private book.
update public.church_library_books
set public_retrieval_enabled = coalesce(search_enabled, false),
    processing_status = coalesce(nullif(ingestion_status, ''), 'not_uploaded')
where public_retrieval_enabled is distinct from coalesce(search_enabled, false)
   or processing_status is distinct from coalesce(nullif(ingestion_status, ''), 'not_uploaded');

-- Reader/search fields are nullable because old imports did not record them.
-- The immutable passage UUID and passage_order remain the citation identity.
alter table public.church_library_passages
  add column if not exists version_id uuid,
  add column if not exists section_id uuid,
  add column if not exists page_start integer,
  add column if not exists page_end integer,
  add column if not exists chapter_reference text,
  add column if not exists locator_label text,
  add column if not exists extraction_confidence real,
  add column if not exists search_document tsvector,
  add column if not exists embedding extensions.vector(384),
  add column if not exists embedding_model text,
  add column if not exists created_at timestamptz not null default now(),
  add column if not exists updated_at timestamptz not null default now();

create or replace function public.church_library_passage_search_document()
returns trigger
language plpgsql
security invoker
set search_path = pg_catalog, public
as $function$
begin
  new.search_document := to_tsvector(
    'simple',
    coalesce(new.content, '') || ' ' ||
    coalesce(new.chapter_reference, '') || ' ' ||
    coalesce(new.locator_label, '')
  );
  return new;
end
$function$;

drop trigger if exists church_library_passages_search_document
  on public.church_library_passages;
create trigger church_library_passages_search_document
before insert or update of content, chapter_reference, locator_label
on public.church_library_passages
for each row execute function public.church_library_passage_search_document();

update public.church_library_passages
set search_document = to_tsvector(
  'simple',
  coalesce(content, '') || ' ' ||
  coalesce(chapter_reference, '') || ' ' ||
  coalesce(locator_label, '')
)
where search_document is null;

create index if not exists church_library_passages_search_document_gin
  on public.church_library_passages using gin (search_document);
create index if not exists church_library_passages_book_order_idx
  on public.church_library_passages (book_id, passage_order);

-- Preserve RLS. These policies only allow rows whose book was already marked
-- search_enabled + ready in the legacy schema, or passes every modern gate.
alter table public.church_library_books enable row level security;
alter table public.church_library_passages enable row level security;

grant select on public.church_library_books, public.church_library_passages
  to anon, authenticated;

drop policy if exists church_library_books_public_search_read
  on public.church_library_books;
create policy church_library_books_public_search_read
on public.church_library_books
for select to anon, authenticated
using (
  (
    coalesce(search_enabled, false) is true
    and ingestion_status = 'ready'
  )
  or (
    public_retrieval_enabled is true
    and access_level in ('public_search', 'public')
    and approved_for_ingestion is true
    and allow_search_quotes is true
    and rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
    and processing_status = 'ready'
  )
);

drop policy if exists church_library_passages_public_search_read
  on public.church_library_passages;
create policy church_library_passages_public_search_read
on public.church_library_passages
for select to anon, authenticated
using (
  exists (
    select 1
    from public.church_library_books b
    where b.id = church_library_passages.book_id
      and (
        (
          coalesce(b.search_enabled, false) is true
          and b.ingestion_status = 'ready'
        )
        or (
          b.public_retrieval_enabled is true
          and b.access_level in ('public_search', 'public')
          and b.approved_for_ingestion is true
          and b.allow_search_quotes is true
          and b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
          and b.processing_status = 'ready'
        )
      )
  )
);

create or replace function public.church_library_public_search_status()
returns table (
  eligible_books bigint,
  indexed_passages bigint,
  embedded_passages bigint
)
language sql
stable
security definer
set search_path = pg_catalog, public, extensions
as $function$
  select
    count(distinct b.id)::bigint,
    count(p.id)::bigint,
    count(p.embedding)::bigint
  from public.church_library_books b
  left join public.church_library_passages p
    on p.book_id = b.id
   and (p.version_id is null or p.version_id = b.current_version_id)
  where (
      coalesce(b.search_enabled, false) is true
      and b.ingestion_status = 'ready'
    )
    or (
      b.public_retrieval_enabled is true
      and b.access_level in ('public_search', 'public')
      and b.approved_for_ingestion is true
      and b.allow_search_quotes is true
      and b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
      and b.processing_status = 'ready'
    );
$function$;

alter function public.church_library_public_search_status() owner to postgres;
revoke all on function public.church_library_public_search_status() from public;
grant execute on function public.church_library_public_search_status()
  to anon, authenticated, service_role;

-- Exact PostgREST contract used by src/lib/searchBuddy/churchLibrarySearch.ts.
create or replace function public.search_church_library(
  search_query text,
  result_limit integer default 8,
  search_language text default null,
  query_embedding extensions.vector(384) default null
)
returns table (
  passage_id uuid,
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
  q_folded text;
  q_ts pg_catalog.tsquery;
  n integer := greatest(1, least(coalesce(result_limit, 8), 30));
begin
  if q = '' then
    return;
  end if;

  q_folded := lower(q);
  q_ts := websearch_to_tsquery('simple', q);

  return query
  with eligible as materialized (
    select
      p.id,
      p.book_id,
      p.passage_order,
      p.language,
      p.content,
      p.page_start,
      p.page_end,
      p.chapter_reference,
      p.locator_label,
      p.search_document,
      p.embedding,
      b.title,
      b.author,
      b.source_url as book_source_url,
      b.allow_source_link
    from public.church_library_passages p
    join public.church_library_books b on b.id = p.book_id
    where (p.version_id is null or p.version_id = b.current_version_id)
      and (
        (
          coalesce(b.search_enabled, false) is true
          and b.ingestion_status = 'ready'
        )
        or (
          b.public_retrieval_enabled is true
          and b.access_level in ('public_search', 'public')
          and b.approved_for_ingestion is true
          and b.allow_search_quotes is true
          and b.rights_status in ('owned', 'licensed', 'public_domain', 'permission_granted')
          and b.processing_status = 'ready'
        )
      )
  ),
  ranked as (
    select
      e.*,
      (
        case
          when lower(e.content) = q_folded then 2.0
          when strpos(lower(e.content), q_folded) > 0 then 1.0
          else 0.0
        end
        + case when lower(e.title) = q_folded then 1.5 else 0.0 end
        + case when strpos(lower(e.title), q_folded) > 0 then 0.75 else 0.0 end
        + case when e.search_document @@ q_ts
            then ts_rank_cd(e.search_document, q_ts)::double precision
            else 0.0 end
        + case when search_language is not null
                 and e.language in (search_language, 'mixed') then 0.05
            else 0.0 end
      )::real as kr,
      case
        when query_embedding is null or e.embedding is null then 0::real
        else greatest(0::real, (1 - (e.embedding <=> query_embedding))::real)
      end as sr
    from eligible e
    where strpos(lower(e.content), q_folded) > 0
       or strpos(lower(e.title), q_folded) > 0
       or e.search_document @@ q_ts
       or (
         query_embedding is not null
         and e.embedding is not null
         and (1 - (e.embedding <=> query_embedding)) >= 0.35
       )
  )
  select
    r.id,
    r.book_id,
    r.title,
    r.author,
    r.language,
    left(r.content, 1200),
    r.page_start,
    r.page_end,
    r.chapter_reference,
    coalesce(r.locator_label, 'Passage ' || (r.passage_order + 1)::text),
    case when r.allow_source_link and r.book_source_url ~* '^https?://'
      then r.book_source_url else null end,
    r.kr,
    r.sr
  from ranked r
  order by
    (r.kr + r.sr) desc,
    case when search_language is not null
           and r.language in (search_language, 'mixed') then 0 else 1 end,
    r.title,
    r.passage_order
  limit n;
end
$function$;

alter function public.search_church_library(text, integer, text, extensions.vector)
  owner to postgres;
revoke all on function public.search_church_library(text, integer, text, extensions.vector)
  from public;
grant execute on function public.search_church_library(text, integer, text, extensions.vector)
  to anon, authenticated, service_role;

comment on function public.search_church_library(text, integer, text, extensions.vector) is
  'Searches active Church Library passages gated by legacy search_enabled/ready or the complete modern public-retrieval policy.';

notify pgrst, 'reload schema';

commit;
