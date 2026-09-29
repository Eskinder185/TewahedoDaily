-- Calendar card optional columns only (do not change keywords TEXT type).
-- keywords remains TEXT; app stores pipe-separated values (gabriel|angel).

begin;

alter table public.synaxarium_commemorations
  add column if not exists image_path text,
  add column if not exists image_alt text,
  add column if not exists featured boolean not null default false,
  add column if not exists is_monthly boolean not null default false,
  add column if not exists image_position text;

alter table public.synaxarium_days
  add column if not exists image_path text,
  add column if not exists image_alt text;

-- If keywords was ever written as a JSON array string, leave as-is;
-- the app normalizes both pipe and comma forms on read.

comment on column public.synaxarium_commemorations.keywords is
  'Free-text keywords; preferred storage is pipe-separated (gabriel|angel).';

comment on column public.synaxarium_commemorations.featured is
  'Eligible for the public Calendar card strip when published.';

comment on column public.synaxarium_commemorations.is_monthly is
  'When true, recurs every Ethiopian month on the linked day number.';

commit;
