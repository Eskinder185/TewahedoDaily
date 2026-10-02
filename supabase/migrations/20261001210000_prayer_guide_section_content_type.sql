-- Lightweight content_type for prayer guide section layout (instruction | prayer | article).
-- Safe to run multiple times.

begin;

alter table public.prayer_guide_sections
  add column if not exists content_type text;

do $$
begin
  if not exists (
    select 1
    from pg_constraint
    where conname = 'prayer_guide_sections_content_type_check'
  ) then
    alter table public.prayer_guide_sections
      add constraint prayer_guide_sections_content_type_check
      check (
        content_type is null
        or content_type in ('instruction', 'prayer', 'article')
      );
  end if;
end $$;

-- Backfill Learn How to Pray section types by known slugs / sort order.
update public.prayer_guide_sections s
set content_type = case
  when s.slug in ('church-greeting', 'thanksgiving', 'supplication') then 'prayer'
  when s.sort_order <= 7 then 'instruction'
  else 'article'
end
from public.prayer_guides g
where s.guide_id = g.id
  and g.slug = 'learn-how-to-pray'
  and (s.content_type is null or s.content_type = '');

create index if not exists prayer_guide_sections_content_type_idx
  on public.prayer_guide_sections (content_type);

commit;
