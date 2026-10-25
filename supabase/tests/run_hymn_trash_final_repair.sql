\set ON_ERROR_STOP on
\ir hymn_trash_schema_baseline.sql
\ir ../migrations/20261024180000_mezmur_two_state_publication_final.sql
\ir ../migrations/20261024220000_hymn_trash_final_repair.sql
-- Simulate a partially installed UUID column. This UPDATE touches an already
-- published historical row with missing lyrics and must not invoke unrelated
-- publication eligibility validation.
alter table public.mezmur_data_import alter column import_id drop not null;
update public.mezmur_data_import
set import_id = null
where mezmur_id = 'historical-published';

-- Recovery/idempotence: the exact repair can be run a second time, backfill
-- the partial NULL safely, and avoid duplicate policies/triggers/overloads.
\ir ../migrations/20261024220000_hymn_trash_final_repair.sql
\ir hymn_trash_final_repair_test.sql
