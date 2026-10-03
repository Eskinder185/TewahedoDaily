-- WEB has verses directly under chapters. Sections are reserved for actual source sections.
-- Backfill the chapter link for any verses staged under the original section-only schema.
begin;

alter table public.bible_verses add column chapter_id uuid;

update public.bible_verses v
set chapter_id = s.chapter_id
from public.bible_sections s
where v.section_id = s.id;

alter table public.bible_verses
  alter column chapter_id set not null,
  alter column section_id drop not null;

alter table public.bible_verses
  add constraint bible_verses_chapter_id_fkey
  foreign key (chapter_id) references public.bible_chapters(id) on delete cascade;

-- The existing (section_id, source_order) constraint still covers real sections.
-- Null section IDs need their own chapter-scoped source-order uniqueness rule.
create unique index bible_verses_direct_chapter_order_key
  on public.bible_verses (chapter_id, source_order)
  where section_id is null;

drop policy if exists bible_verses_public_read on public.bible_verses;
create policy bible_verses_public_read on public.bible_verses
  for select to anon, authenticated using (
    exists (select 1 from public.bible_chapters c where c.id = chapter_id)
    and (
      section_id is null
      or exists (
        select 1 from public.bible_sections s
        where s.id = section_id and s.chapter_id = chapter_id
      )
    )
  );

notify pgrst, 'reload schema';
commit;
