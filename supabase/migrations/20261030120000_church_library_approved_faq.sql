-- Approved bilingual Church Library FAQ layer for Search Buddy.
-- Additive and forward-only. It does not alter books, sections, or passages.
begin;

create extension if not exists pg_trgm with schema extensions;

create table if not exists public.church_library_faqs (
  stable_id text primary key check (stable_id ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  question_en text not null check (btrim(question_en) <> ''),
  question_am text not null check (btrim(question_am) <> ''),
  answer_en text not null check (btrim(answer_en) <> ''),
  answer_am text not null check (btrim(answer_am) <> ''),
  alternative_phrasings text[] not null default '{}',
  topic text not null,
  related_section_ids uuid[] not null default '{}',
  source_references jsonb not null default '[]'::jsonb,
  review_status text not null default 'pending' check (review_status in ('pending', 'approved', 'needs_changes')),
  publication_status text not null default 'draft' check (publication_status in ('draft', 'published')),
  reviewed_by uuid references auth.users(id) on delete set null,
  reviewed_at timestamptz,
  published_by uuid references auth.users(id) on delete set null,
  published_at timestamptz,
  created_by uuid references auth.users(id) on delete set null default auth.uid(),
  updated_by uuid references auth.users(id) on delete set null default auth.uid(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint church_library_faq_publication_guard check (
    publication_status = 'draft'
    or (review_status = 'approved' and jsonb_array_length(source_references) > 0)
  )
);

create index if not exists church_library_faq_topic_idx on public.church_library_faqs(topic);
create index if not exists church_library_faq_question_en_trgm on public.church_library_faqs using gin (question_en extensions.gin_trgm_ops);
create index if not exists church_library_faq_question_am_trgm on public.church_library_faqs using gin (question_am extensions.gin_trgm_ops);

alter table public.church_library_faqs enable row level security;
revoke all on public.church_library_faqs from public, anon;
grant select on public.church_library_faqs to anon;
grant select, insert, update, delete on public.church_library_faqs to authenticated;
grant all on public.church_library_faqs to service_role;

drop policy if exists church_library_faq_public_read on public.church_library_faqs;
create policy church_library_faq_public_read on public.church_library_faqs for select to anon, authenticated
using (publication_status = 'published' and review_status = 'approved');

drop policy if exists church_library_faq_staff_all on public.church_library_faqs;
create policy church_library_faq_staff_all on public.church_library_faqs for all to authenticated
using (public.is_staff()) with check (public.is_staff());

create or replace function public.church_library_faq_touch()
returns trigger language plpgsql security invoker set search_path = pg_catalog, public as $$
begin
  new.updated_at := now();
  new.updated_by := auth.uid();
  if new.review_status = 'approved' and old.review_status is distinct from 'approved' then
    new.reviewed_at := now(); new.reviewed_by := auth.uid();
  end if;
  if new.publication_status = 'published' and old.publication_status is distinct from 'published' then
    new.published_at := now(); new.published_by := auth.uid();
  end if;
  return new;
end $$;

create or replace function public.church_library_faq_validate_sources()
returns trigger language plpgsql security invoker set search_path = pg_catalog, public as $$
declare v_source jsonb;
begin
  if (new.review_status = 'approved' or new.publication_status = 'published')
     and coalesce(cms_private.current_role() not in ('admin', 'super_admin'), true) then
    raise exception 'Admin role required to approve or publish Church Library FAQs'
      using errcode = '42501';
  end if;
  if new.publication_status <> 'published' then return new; end if;
  if new.answer_en = 'The source-reviewed answer must be entered before publication.'
     or new.answer_am = 'ከመታተሙ በፊት ከምንጩ ጋር የተረጋገጠ መልስ መጨመር አለበት።' then
    raise exception 'Replace the starter placeholder with a source-reviewed bilingual answer before publication'
      using errcode = '23514';
  end if;
  for v_source in select value from jsonb_array_elements(new.source_references) loop
    if not exists (
      select 1 from public.church_library_books b
      left join public.church_library_sections s on s.book_id = b.id
        and (v_source->>'section_key' is null or s.stable_key = v_source->>'section_key')
      left join public.church_library_passages p on p.book_id = b.id
        and (v_source->>'passage_key' is null or p.stable_key = v_source->>'passage_key')
      where b.slug = v_source->>'book_slug'
        and public.church_library_book_is_public(b.id)
        and (v_source->>'section_key' is null or s.id is not null)
        and (v_source->>'passage_key' is null or p.id is not null)
    ) then
      raise exception 'FAQ source reference does not resolve to published Church Library content: %', v_source
        using errcode = '23503';
    end if;
  end loop;
  return new;
end $$;
drop trigger if exists church_library_faq_validate_sources on public.church_library_faqs;
create trigger church_library_faq_validate_sources before insert or update of answer_en, answer_am, source_references, review_status, publication_status
on public.church_library_faqs for each row execute function public.church_library_faq_validate_sources();

drop trigger if exists church_library_faq_touch on public.church_library_faqs;
create trigger church_library_faq_touch before update on public.church_library_faqs
for each row execute function public.church_library_faq_touch();

create or replace function public.search_church_library_faq(
  search_query text,
  search_language text default null,
  result_limit integer default 3,
  context_stable_id text default null
)
returns table (
  stable_id text, question text, answer text, language text, topic text,
  source_references jsonb, score double precision
)
language sql stable security invoker
set search_path = pg_catalog, public, extensions
as $$
  with input as (
    select public.church_library_fold_am(left(btrim(coalesce(search_query, '')), 500)) as q,
           case when search_language = 'am' or search_query ~ '[ሀ-፼]' then 'am' else 'en' end as lang,
           (select topic from public.church_library_faqs where stable_id = context_stable_id
             and publication_status = 'published' and review_status = 'approved') as context_topic
  ), ranked as (
    select f.*, i.lang,
      greatest(
        similarity(public.church_library_fold_am(f.question_en), i.q),
        similarity(public.church_library_fold_am(f.question_am), i.q),
        coalesce((select max(similarity(public.church_library_fold_am(alias), i.q)) from unnest(f.alternative_phrasings) alias), 0)
      ) + case when f.topic = i.context_topic then 0.12 else 0 end as rank_score
    from public.church_library_faqs f cross join input i
    where f.publication_status = 'published' and f.review_status = 'approved'
      and exists (
        select 1 from jsonb_array_elements(f.source_references) source
        join public.church_library_books b on b.slug = source->>'book_slug'
        where public.church_library_book_is_public(b.id)
      )
  )
  select r.stable_id,
    case when r.lang = 'am' then r.question_am else r.question_en end,
    case when r.lang = 'am' then r.answer_am else r.answer_en end,
    r.lang, r.topic, r.source_references, r.rank_score::double precision
  from ranked r
  where r.rank_score >= 0.26
  order by r.rank_score desc, r.stable_id
  limit least(greatest(coalesce(result_limit, 3), 1), 10)
$$;

revoke all on function public.search_church_library_faq(text,text,integer,text) from public;
grant execute on function public.search_church_library_faq(text,text,integer,text) to anon, authenticated, service_role;

-- Draft-only starter records. Staff must verify translations and attach real,
-- existing source references before approval/publishing is possible.
insert into public.church_library_faqs
  (stable_id, question_en, question_am, answer_en, answer_am, alternative_phrasings, topic)
values
  ('seven-sacraments', 'What are the Seven Sacraments?', 'ሰባቱ ምሥጢራት ምንድን ናቸው?',
   'The source-reviewed answer must be entered before publication.', 'ከመታተሙ በፊት ከምንጩ ጋር የተረጋገጠ መልስ መጨመር አለበት።',
   array['How many sacraments are there?','List the sacraments','What are the 7 sacraments?','Number of sacraments'], 'seven-sacraments'),
  ('first-sacrament', 'What is the first sacrament?', 'የመጀመሪያው ምሥጢር ምንድን ነው?',
   'The source-reviewed answer must be entered before publication.', 'ከመታተሙ በፊት ከምንጩ ጋር የተረጋገጠ መልስ መጨመር አለበት።',
   array['Which sacrament comes first?','የመጀመሪያ ምሥጢር'], 'seven-sacraments'),
  ('baptism', 'What is Baptism?', 'ጥምቀት ምንድን ነው?',
   'The source-reviewed answer must be entered before publication.', 'ከመታተሙ በፊት ከምንጩ ጋር የተረጋገጠ መልስ መጨመር አለበት።',
   array['Why is Baptism important?','Explain the first sacrament','የጥምቀት ምሥጢር'], 'baptism'),
  ('five-pillars', 'What are the Five Pillars of Mystery?', 'አምስቱ አእማደ ምሥጢር ምንድን ናቸው?',
   'The source-reviewed answer must be entered before publication.', 'ከመታተሙ በፊት ከምንጩ ጋር የተረጋገጠ መልስ መጨመር አለበት።',
   array['What are the pillars?','List the five mysteries','How many Pillars of Mystery are there?'], 'five-pillars'),
  ('holy-trinity-mystery', 'What is the Mystery of the Holy Trinity?', 'የሥላሴ ምሥጢር ምንድን ነው?',
   'The source-reviewed answer must be entered before publication.', 'ከመታተሙ በፊት ከምንጩ ጋር የተረጋገጠ መልስ መጨመር አለበት።',
   array['Explain the Holy Trinity','Mystery of Trinity','የቅድስት ሥላሴ ምሥጢር'], 'five-pillars')
on conflict (stable_id) do nothing;

notify pgrst, 'reload schema';
commit;
