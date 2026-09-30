-- Calendar Cards: public “Why this day?” explanation fields.
-- Safe additive migration; does not delete or rewrite existing card data.

begin;

alter table public.calendar_cards
  add column if not exists summary text,
  add column if not exists summary_amharic text,
  add column if not exists why_celebrated text,
  add column if not exists why_celebrated_amharic text,
  add column if not exists short_label text;

comment on column public.calendar_cards.summary is
  'Short 1–2 sentence public explanation (English / default).';
comment on column public.calendar_cards.summary_amharic is
  'Short public explanation in Amharic; falls back to summary when empty.';
comment on column public.calendar_cards.why_celebrated is
  'Longer “why we celebrate” copy for the Why this day? modal (English / default).';
comment on column public.calendar_cards.why_celebrated_amharic is
  'Amharic why-we-celebrate copy; falls back to why_celebrated when empty.';
comment on column public.calendar_cards.short_label is
  'Optional short public label (eyebrow / badge).';

commit;
