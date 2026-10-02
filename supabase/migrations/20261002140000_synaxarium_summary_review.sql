-- Synaxarium compact preview fields (Calendar panel + CMS).
-- Does not alter full body text.

begin;

alter table public.synaxarium_commemorations
  add column if not exists summary_amharic text;

alter table public.synaxarium_commemorations
  add column if not exists content_review_status text;

alter table public.synaxarium_commemorations
  drop constraint if exists synaxarium_commemorations_content_review_status_check;

alter table public.synaxarium_commemorations
  add constraint synaxarium_commemorations_content_review_status_check
  check (
    content_review_status is null
    or content_review_status in ('ok', 'needs_review', 'omit_public')
  );

comment on column public.synaxarium_commemorations.summary is
  'Short Calendar/list preview. Separate from body_english full Synaxarium account.';

comment on column public.synaxarium_commemorations.summary_amharic is
  'Amharic compact preview for Calendar and listings.';

comment on column public.synaxarium_commemorations.content_review_status is
  'ok | needs_review | omit_public — omit_public hides broken import fragments from compact public panels.';

-- Flag obvious date-header rows incorrectly stored as commemorations.
update public.synaxarium_commemorations
set content_review_status = 'omit_public',
    updated_at = now()
where content_review_status is null
  and (
    title ~* '^(Meskerem|Tikimt|Tekemt|Hidar|Hedar|Tahsas|Tir|Yekatit|Megabit|Miazia|Ginbot|Sene|Hamle|Nehase|Pagumen)[[:space:]]+[0-9]{1,2}'
    or title ~* '^THE FIRST MONTH'
    or title ~* '\((January|February|March|April|May|June|July|August|September|October|November|December)'
  )
  and coalesce(length(trim(body_english)), 0) < 80;

-- Flag clear mid-sentence fragment titles for staff review (do not delete).
update public.synaxarium_commemorations
set content_review_status = 'needs_review',
    updated_at = now()
where content_review_status is null
  and (
    title ~* '^(is |are |was |were |and |also |on this day is |salutation to )'
    or title ~ '^[a-z]'
  );

commit;
