-- MEZMUR_STABLE_ID_DRY_RUN.sql
--
-- Deterministic identifier plan for the current text mezmur_id column.
-- Default outcome is ROLLBACK. Review every result and change only the final
-- ROLLBACK to COMMIT during an explicitly approved maintenance window.

begin;

do $$
declare
  duplicate_groups integer;
begin
  select count(*) into duplicate_groups
  from (
    select lower(trim(slug))
    from public.mezmur_data_import
    where nullif(trim(slug), '') is not null
    group by lower(trim(slug))
    having count(*) > 1
  ) duplicates;

  if duplicate_groups > 0 then
    raise exception
      'Stable-ID plan blocked: resolve % duplicate normalized slug groups first.',
      duplicate_groups;
  end if;
end $$;

-- Slug is normalized and namespaced so reruns produce the same identifier.
-- Existing nonblank IDs are preserved.
update public.mezmur_data_import
set mezmur_id = 'td-mezmur:v1:' || lower(trim(slug))
where nullif(trim(mezmur_id), '') is null
  and nullif(trim(slug), '') is not null;

create unique index if not exists mezmur_data_import_mezmur_id_uidx
  on public.mezmur_data_import (mezmur_id);
create unique index if not exists mezmur_data_import_slug_normalized_uidx
  on public.mezmur_data_import (lower(trim(slug)));

select
  count(*) as row_count,
  count(*) filter (where nullif(trim(mezmur_id), '') is null) as blank_mezmur_ids,
  count(distinct mezmur_id) as distinct_mezmur_ids,
  count(distinct lower(trim(slug))) as distinct_normalized_slugs
from public.mezmur_data_import;

-- SAFE DEFAULT. Replace with COMMIT only after explicit approval and review.
rollback;
