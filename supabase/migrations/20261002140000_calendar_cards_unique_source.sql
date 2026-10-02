-- Unique linked Calendar Card per structured source (non-manual, non-archived).
-- Apply ONLY after duplicate leftovers are archived (see FIX_CALENDAR_CARDS_IMAGE_SYNC.sql).

begin;

drop index if exists calendar_cards_unique_linked_source_id_idx;
create unique index calendar_cards_unique_linked_source_id_idx
  on public.calendar_cards (source_type, source_id)
  where source_id is not null
    and coalesce(source_type, 'manual') <> 'manual'
    and lower(coalesce(status, '')) <> 'archived';

comment on index public.calendar_cards_unique_linked_source_id_idx is
  'One active presentation card per linked structured source (source_type + source_id).';

commit;
