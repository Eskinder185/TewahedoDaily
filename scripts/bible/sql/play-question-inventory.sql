-- READ-ONLY. SELECT statement only: no writes, no DDL.
-- Purpose: existing Faith Challenges question inventory for duplicate detection.
-- Includes every editorial status (draft, approved, rejected, published) so new drafts
-- do not duplicate questions that are still in review. Run in the Supabase SQL Editor
-- (anon/REST reads only see published rows because of RLS), then export:
--   * "Download CSV"  -> play-question-inventory.csv, or
--   * "Copy as JSON"  -> play-question-inventory.json
-- No user IDs or audit columns are exported.
select jsonb_build_object(
  'stable_id', stable_id,
  'question_id', question_id,
  'status', status,
  'game_type', game_type,
  'category', category,
  'source', payload -> 'source',
  'prompt', payload -> 'prompt',
  'source_references', source_references
) as question
from public.play_content_items
order by stable_id;

