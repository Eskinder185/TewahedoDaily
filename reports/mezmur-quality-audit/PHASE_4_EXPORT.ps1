# Read-only identity export. Run from the repository root in an authorized PowerShell session.
# The password is requested by psql -W and is never stored or printed by this script.
if ([string]::IsNullOrWhiteSpace($env:PGHOST) -or
    [string]::IsNullOrWhiteSpace($env:PGPORT) -or
    [string]::IsNullOrWhiteSpace($env:PGDATABASE) -or
    [string]::IsNullOrWhiteSpace($env:PGUSER) -or
    [string]::IsNullOrWhiteSpace($env:PGSSLMODE)) {
  throw 'PGHOST, PGPORT, PGDATABASE, PGUSER, and PGSSLMODE must already be set.'
}
Remove-Item Env:PGPASSWORD -ErrorAction SilentlyContinue
$out = 'reports/mezmur-quality-audit/PHASE_4_SOURCE_IDENTITY_EXPORT.csv'
psql -W -h $env:PGHOST -p $env:PGPORT -U $env:PGUSER -d $env:PGDATABASE --set=ON_ERROR_STOP=on --csv --file reports/mezmur-quality-audit/PHASE_4_READ_ONLY_IDENTITY_EXPORT.sql | Set-Content -LiteralPath $out -Encoding utf8
if ($LASTEXITCODE -ne 0) { throw "Read-only identity export failed with exit code $LASTEXITCODE." }
Write-Host "Saved read-only identity export to $out"
