-- Church Library JSONL identity + multilingual hybrid retrieval.
-- Forward-only, additive, and safe to review in SQL Editor. Does not publish
-- books, alter source text, or weaken the existing retrieval/rights gates.
begin;

create extension if not exists vector with schema extensions;

alter table public.church_library_passages
  add column if not exists source_passage_id text;

create unique index if not exists church_library_passages_source_identity_uq
  on public.church_library_passages(version_id, source_passage_id)
  where version_id is not null and source_passage_id is not null;

create or replace function public.church_library_fold_text(input text)
returns text language sql immutable parallel safe set search_path = pg_catalog as $$
  select translate(lower(coalesce(input, '')),
    'ሐሑሒሓሔሕሖኀኁኂኃኄኅኆሠሡሢሣሤሥሦዐዑዒዓዔዕዖፀፁፂፃፄፅፆ',
    'ሀሁሂሃሄህሆሀሁሂሃሄህሆሰሱሲሳሴስሶአኡኢኣኤእኦጸጹጺጻጼጽጾ')
$$;

create table if not exists public.church_library_search_aliases (
  id uuid primary key default gen_random_uuid(),
  alias text not null check (nullif(btrim(alias), '') is not null),
  alias_folded text generated always as (public.church_library_fold_text(btrim(alias))) stored,
  expansion text[] not null check (cardinality(expansion) between 1 and 8),
  review_status text not null default 'pending' check (review_status in ('pending','approved','rejected')),
  source_note text not null,
  created_by uuid references auth.users(id) on delete set null,
  reviewed_by uuid references auth.users(id) on delete set null,
  reviewed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique(alias_folded)
);

alter table public.church_library_search_aliases enable row level security;
revoke all on public.church_library_search_aliases from anon, public;
grant select, insert, update, delete on public.church_library_search_aliases to authenticated;
grant all on public.church_library_search_aliases to service_role;
drop policy if exists church_library_search_aliases_staff_all on public.church_library_search_aliases;
create policy church_library_search_aliases_staff_all on public.church_library_search_aliases
  for all to authenticated using (coalesce(public.is_staff(), false))
  with check (coalesce(public.is_staff(), false));

-- User-requested query vocabulary. These are retrieval aliases, never source
-- quotations and never changes to book text.
insert into public.church_library_search_aliases(alias, expansion, review_status, source_note)
values
  ('Holy Communion', array['holy communion','eucharist','qurban'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('Eucharist', array['holy communion','eucharist','qurban'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('Qurban', array['holy communion','eucharist','qurban'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('ቁርባን', array['holy communion','eucharist','qurban'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('Baptism', array['baptism','sacrament of baptism'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('ጥምቀት', array['baptism','sacrament of baptism'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('Holy Trinity', array['holy trinity','trinity','three persons'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('ሥላሴ', array['holy trinity','trinity','three persons'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('Salvation', array['salvation','redemption'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('ድኅነት', array['salvation','redemption'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('Repentance', array['repentance','penance'], 'approved', 'Owner-requested Church Library search vocabulary.'),
  ('ንስሐ', array['repentance','penance'], 'approved', 'Owner-requested Church Library search vocabulary.')
on conflict(alias_folded) do update set
  expansion = excluded.expansion,
  review_status = 'approved',
  source_note = excluded.source_note,
  updated_at = now();

-- Safe public counts only. This reveals no titles, text, or private rows.
create or replace function public.church_library_public_search_status()
returns table(eligible_books bigint, indexed_passages bigint, embedded_passages bigint)
language sql stable security definer set search_path = public, extensions as $$
  select count(distinct b.id), count(p.id), count(p.embedding)
  from public.church_library_books b
  left join public.church_library_passages p
    on p.book_id = b.id
   and (p.version_id = b.current_version_id or (p.version_id is null and b.current_version_id is null))
  left join public.church_library_book_versions v on v.id = p.version_id
  where b.public_retrieval_enabled = true
    and b.access_level in ('public_search','public')
    and b.approved_for_ingestion = true
    and b.allow_search_quotes = true
    and b.rights_status in ('owned','licensed','public_domain','permission_granted')
    and b.processing_status = 'ready'
    and (v.id is null or v.processing_status = 'ready')
$$;

revoke all on function public.church_library_public_search_status() from public;
grant execute on function public.church_library_public_search_status() to anon, authenticated, service_role;

create or replace function public.search_church_library(
  search_query text,
  result_limit integer default 8,
  search_language text default null,
  query_embedding extensions.vector(384) default null
)
returns table(
  passage_id uuid, book_id uuid, title text, author text, language text,
  excerpt text, page_start integer, page_end integer,
  chapter_reference text, locator_label text, source_url text,
  keyword_rank real, semantic_rank real
)
language plpgsql stable security definer set search_path = public, extensions as $$
declare
  q text := left(btrim(coalesce(search_query,'')), 500);
  q_folded text;
  expanded text;
  q_ts tsquery;
  n integer := greatest(1, least(coalesce(result_limit,8),30));
begin
  if q = '' then return; end if;
  q_folded := public.church_library_fold_text(q);
  select string_agg(distinct term, ' ') into expanded
  from (
    select q as term
    union all
    select unnest(a.expansion)
    from public.church_library_search_aliases a
    where a.review_status = 'approved' and strpos(q_folded, a.alias_folded) > 0
  ) s;
  q_ts := websearch_to_tsquery('simple', left(coalesce(expanded,q),500));

  return query
  with eligible as materialized (
    select p.*, b.title, b.author, b.source_url, b.allow_source_link
    from public.church_library_passages p
    join public.church_library_books b on b.id=p.book_id
    left join public.church_library_book_versions v on v.id=p.version_id
    where (p.version_id=b.current_version_id or (p.version_id is null and b.current_version_id is null))
      and b.public_retrieval_enabled=true
      and b.access_level in ('public_search','public')
      and b.approved_for_ingestion=true
      and b.allow_search_quotes=true
      and b.rights_status in ('owned','licensed','public_domain','permission_granted')
      and b.processing_status='ready'
      and (v.id is null or v.processing_status='ready')
  ),
  exact_ranked as (
    select id, row_number() over(order by
      case when public.church_library_fold_text(content)=q_folded then 0 else 1 end,
      passage_order)::int rank
    from eligible where strpos(public.church_library_fold_text(content),q_folded)>0
    limit 50
  ),
  lexical_ranked as (
    select id, row_number() over(order by ts_rank_cd(search_document,q_ts) desc, passage_order)::int rank
    from eligible where search_document @@ q_ts
    order by ts_rank_cd(search_document,q_ts) desc, passage_order limit 80
  ),
  semantic_ranked as (
    select id, row_number() over(order by embedding <=> query_embedding, passage_order)::int rank
    from eligible
    where query_embedding is not null and embedding is not null
    order by embedding <=> query_embedding, passage_order limit 80
  ),
  fused as (
    select id,
      sum(case source when 'exact' then 2.0 when 'lexical' then 1.25 else 1.0 end/(60+rank))::real score,
      max(case when source in ('exact','lexical') then 1.0/rank else 0 end)::real kr,
      max(case when source='semantic' then 1.0/rank else 0 end)::real sr
    from (
      select id,rank,'exact' source from exact_ranked union all
      select id,rank,'lexical' from lexical_ranked union all
      select id,rank,'semantic' from semantic_ranked
    ) candidates group by id
  ),
  selected as (
    select e.*, f.score, f.kr, f.sr
    from fused f join eligible e on e.id=f.id
    where f.kr>0 or f.sr>=0.0125 -- semantic top 20; prevents weak tail-only evidence
    order by f.score desc, e.title, e.passage_order limit n
  )
  select s.id,s.book_id,s.title,s.author,s.language,
    left(s.content,1200),s.page_start,s.page_end,s.chapter_reference,s.locator_label,
    case when s.allow_source_link and s.source_url ~* '^https?://' then s.source_url else null end,
    s.kr,s.sr
  from selected s order by s.score desc,s.title,s.passage_order;
end;
$$;

revoke all on function public.search_church_library(text,integer,text,extensions.vector) from public;
grant execute on function public.search_church_library(text,integer,text,extensions.vector) to anon, authenticated, service_role;
revoke all on function public.church_library_fold_text(text) from public;

-- Adjacent context remains independently gated and returns exact source rows.
create or replace function public.church_library_passage_context(target_passage_id uuid, context_radius integer default 1)
returns table(passage_id uuid, passage_order integer, content text, chapter_reference text, locator_label text, page_start integer, page_end integer)
language sql stable security definer set search_path=public as $$
  with target as (
    select p.* from public.church_library_passages p
    join public.church_library_books b on b.id=p.book_id
    left join public.church_library_book_versions v on v.id=p.version_id
    where p.id=target_passage_id
      and (p.version_id=b.current_version_id or (p.version_id is null and b.current_version_id is null))
      and b.public_retrieval_enabled=true and b.access_level in ('public_search','public')
      and b.approved_for_ingestion=true and b.allow_search_quotes=true
      and b.rights_status in ('owned','licensed','public_domain','permission_granted')
      and b.processing_status='ready' and (v.id is null or v.processing_status='ready')
  )
  select p.id,p.passage_order,p.content,p.chapter_reference,p.locator_label,p.page_start,p.page_end
  from target t join public.church_library_passages p
    on p.version_id is not distinct from t.version_id and p.book_id=t.book_id
   and p.passage_order between t.passage_order-greatest(0,least(context_radius,2))
                           and t.passage_order+greatest(0,least(context_radius,2))
  order by p.passage_order
$$;

revoke all on function public.church_library_passage_context(uuid,integer) from public;
grant execute on function public.church_library_passage_context(uuid,integer) to anon,authenticated,service_role;

do $$ begin
  create index church_library_passages_embedding_hnsw
    on public.church_library_passages using hnsw (embedding vector_cosine_ops)
    where embedding is not null;
exception when duplicate_table then null; when feature_not_supported then null; end $$;

notify pgrst,'reload schema';
commit;
