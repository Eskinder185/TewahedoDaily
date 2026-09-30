-- Expand calendar_cards into an educational / devotional card system.
-- Safe additive migration; preserves existing rows.

begin;

alter table public.calendar_cards
  add column if not exists category text,
  add column if not exists what_is_it text,
  add column if not exists what_is_it_amharic text,
  add column if not exists important_information text,
  add column if not exists important_information_amharic text,
  add column if not exists scripture_references text,
  add column if not exists fasting_notes text,
  add column if not exists fasting_notes_amharic text,
  add column if not exists season_notes text,
  add column if not exists season_notes_amharic text,
  add column if not exists image_caption text,
  add column if not exists image_caption_amharic text,
  add column if not exists learn_more_label text;

-- Keep summary / why_celebrated / short_label from prior migration if present.
alter table public.calendar_cards
  add column if not exists summary text,
  add column if not exists summary_amharic text,
  add column if not exists why_celebrated text,
  add column if not exists why_celebrated_amharic text,
  add column if not exists short_label text;

comment on column public.calendar_cards.category is
  'Public category badge (Holiday, Angel, Fast, …). Prefer human labels over raw enums.';
comment on column public.calendar_cards.what_is_it is
  'Concise factual explanation of what the observance is.';
comment on column public.calendar_cards.why_celebrated is
  'Spiritual / traditional reason the Church commemorates it.';
comment on column public.calendar_cards.important_information is
  'Optional extra context: customs, themes, related practices.';
comment on column public.calendar_cards.scripture_references is
  'Free-text scripture references (one per line or comma-separated).';
comment on column public.calendar_cards.fasting_notes is
  'Explicit CMS fasting notes only — never inferred.';
comment on column public.calendar_cards.season_notes is
  'Where this sits in the annual church calendar.';
comment on column public.calendar_cards.image_caption is
  'Optional caption under the See more image.';
comment on column public.calendar_cards.learn_more_label is
  'Optional custom label for the See more button.';

-- Backfill category from card_type when empty (display-friendly).
update public.calendar_cards
set category = initcap(replace(card_type, '_', ' '))
where (category is null or btrim(category) = '')
  and card_type is not null;

-- Prefer summary from description when summary is empty.
update public.calendar_cards
set summary = description
where (summary is null or btrim(summary) = '')
  and description is not null
  and btrim(description) <> '';

commit;
