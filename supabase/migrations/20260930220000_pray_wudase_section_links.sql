-- Pray data integrity repairs (safe, additive).
-- 1) Link Wudase Mariam weekday prayers to their weekday sections.
-- 2) Does not invent prayer body text.

begin;

-- Link prayers like wudase-mariam-monday → section slug monday (same collection).
update public.prayers p
set
  section_id = s.id,
  section_slug = s.slug,
  updated_at = now()
from public.prayer_sections s
join public.prayer_collections c on c.id = s.collection_id
where c.slug = 'wudase-mariam'
  and p.collection_id = c.id
  and p.section_id is null
  and (
    p.slug = 'wudase-mariam-' || s.slug
    or p.slug = s.slug
    or p.section_slug = s.slug
  );

-- Ensure collection_slug matches linked collection where blank/mismatched.
update public.prayers p
set
  collection_slug = c.slug,
  updated_at = now()
from public.prayer_collections c
where p.collection_id = c.id
  and (p.collection_slug is null or p.collection_slug <> c.slug);

-- Ensure section_slug matches linked section where blank/mismatched.
update public.prayers p
set
  section_slug = s.slug,
  updated_at = now()
from public.prayer_sections s
where p.section_id = s.id
  and (p.section_slug is null or p.section_slug <> s.slug);

commit;
