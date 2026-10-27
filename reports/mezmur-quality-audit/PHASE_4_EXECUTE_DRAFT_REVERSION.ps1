param(
  [ValidateSet('DryRun', 'Execute')]
  [string]$Mode = 'DryRun'
)

# Phase 4 changes only the reviewed immutable import_id plan.
# DryRun performs the complete update inside a transaction and rolls back.
# Execute commits only after all preconditions and row counts pass.
$ErrorActionPreference = 'Stop'
foreach ($name in @('PGHOST','PGPORT','PGDATABASE','PGUSER','PGSSLMODE')) {
  $value = [Environment]::GetEnvironmentVariable($name)
  if ([string]::IsNullOrWhiteSpace($value)) { throw "$name must already be set." }
}
Remove-Item Env:PGPASSWORD -ErrorAction SilentlyContinue
$plan = (Resolve-Path 'reports/mezmur-quality-audit/PHASE_4_VERIFIED_DRAFT_PLAN.csv').Path
$stamp = Get-Date -Format 'yyyyMMdd_HHmmss'
$backup = Join-Path (Split-Path $plan) "PHASE_4_BACKUP_$stamp.csv"
$backupSqlFile = [IO.Path]::GetTempFileName()
$changeSqlFile = [IO.Path]::GetTempFileName()
$planPath = $plan.Replace('\', '/')
$backupPath = $backup.Replace('\', '/')

# The plan has four CSV columns. Import all four so PostgreSQL never shifts
# reason/timestamp values into the wrong column.
$backupSql = @"
\set ON_ERROR_STOP 1
begin;
create temporary table phase4_backup_plan (import_id uuid primary key, expected_status text not null, reason text not null, expected_updated_at text not null);
\copy phase4_backup_plan from '$planPath' with (format csv, header true);
do `$$ begin
  if not exists (select 1 from phase4_backup_plan) then raise exception 'Empty plan; no records changed.'; end if;
end `$$;
\copy (select m.* from public.mezmur_data_import m join phase4_backup_plan p on p.import_id=m.import_id order by m.import_id) to '$backupPath' with (format csv, header true);
do `$$ begin
  if (select count(*) from public.mezmur_data_import m join phase4_backup_plan p on p.import_id=m.import_id) <> (select count(*) from phase4_backup_plan) then raise exception 'Backup count mismatch; no records changed.'; end if;
end `$$;
commit;
"@

$commitSql = if ($Mode -eq 'Execute') { 'commit;' } else { 'rollback;' }
$changeSql = @"
\set ON_ERROR_STOP 1
begin;
create temporary table phase4_plan (import_id uuid primary key, expected_status text not null check (expected_status = 'published'), reason text not null, expected_updated_at text not null);
\copy phase4_plan from '$planPath' with (format csv, header true);
do `$$ begin
  if not exists (select 1 from phase4_plan) then raise exception 'Empty plan; no records changed.'; end if;
  if not exists (select 1 from pg_trigger where tgrelid='public.mezmur_data_import'::regclass and tgname='mezmur_data_import_publication_guard' and not tgisinternal) then raise exception 'Publication guard is missing; no records changed.'; end if;
end `$$;
create temporary table phase4_before on commit drop as select m.* from public.mezmur_data_import m join phase4_plan p on p.import_id=m.import_id;
do `$$ begin
  if (select count(*) from phase4_before) <> (select count(*) from phase4_plan) then raise exception 'Missing import_id; transaction aborted.'; end if;
  if exists (select 1 from phase4_before m join phase4_plan p on p.import_id=m.import_id where m.status is distinct from p.expected_status or m.updated_at::text is distinct from p.expected_updated_at or m.deleted_at is not null) then raise exception 'Published/status/timestamp/deletion precondition failed; transaction aborted.'; end if;
end `$$;
create temporary table phase4_changed as select * from phase4_before with no data;
with changed as (
  update public.mezmur_data_import m
     set status = 'draft'
    from phase4_plan p
   where m.import_id = p.import_id
     and m.status = 'published'
     and m.updated_at::text = p.expected_updated_at
  returning m.*
)
insert into phase4_changed select * from changed;
do `$$ begin
  if (select count(*) from phase4_changed) <> (select count(*) from phase4_plan) then raise exception 'Not every expected record changed; transaction aborted.'; end if;
end `$$;
select count(*) as backed_up_source_rows from phase4_before;
select count(*) as changed_rows from phase4_changed;
select count(*) as still_published_source_rows from public.mezmur_data_import m join phase4_plan p on p.import_id=m.import_id where m.status='published';
select count(*) as still_visible_by_legacy_id from phase4_changed c join public.mezmur_public v on c.mezmur_id is not null and v.mezmur_id=c.mezmur_id;
$commitSql
"@

try {
  [IO.File]::WriteAllText($backupSqlFile, $backupSql, [Text.UTF8Encoding]::new($false))
  [IO.File]::WriteAllText($changeSqlFile, $changeSql, [Text.UTF8Encoding]::new($false))
  Write-Host "Backing up the verified plan rows to $backup"
  psql -X -W -v ON_ERROR_STOP=1 -h $env:PGHOST -p $env:PGPORT -U $env:PGUSER -d $env:PGDATABASE --file $backupSqlFile
  if ($LASTEXITCODE -ne 0) { throw 'Backup failed; no status transaction was attempted.' }
  Write-Host "Backup completed. Starting $Mode transaction. psql will prompt for the password."
  psql -X -W -v ON_ERROR_STOP=1 -h $env:PGHOST -p $env:PGPORT -U $env:PGUSER -d $env:PGDATABASE --file $changeSqlFile
  if ($LASTEXITCODE -ne 0) { throw "Phase 4 $Mode transaction failed; PostgreSQL rolled it back." }
  Write-Host "Phase 4 $Mode completed. Backup: $backup"
} finally {
  Remove-Item -LiteralPath $backupSqlFile, $changeSqlFile -Force -ErrorAction SilentlyContinue
  Remove-Item Env:PGPASSWORD -ErrorAction SilentlyContinue
}
