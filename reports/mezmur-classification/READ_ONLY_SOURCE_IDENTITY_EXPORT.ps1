param([string]$Output = 'reports/mezmur-classification/SOURCE_IDENTITY_EXPORT.csv')
$ErrorActionPreference = 'Stop'
foreach ($name in @('PGHOST','PGPORT','PGDATABASE','PGUSER','PGSSLMODE')) {
  if ([string]::IsNullOrWhiteSpace([Environment]::GetEnvironmentVariable($name))) { throw "$name must already be set." }
}
$parent = Split-Path -Parent $Output
if ($parent) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
Write-Host "Enter the database password when psql prompts; it is not stored by this script."
psql -X -W -v ON_ERROR_STOP=1 -h $env:PGHOST -p $env:PGPORT -U $env:PGUSER -d $env:PGDATABASE --csv --file reports/mezmur-classification/READ_ONLY_SOURCE_IDENTITY_EXPORT.sql | Set-Content -LiteralPath $Output -Encoding utf8
if ($LASTEXITCODE -ne 0) { throw "Read-only export failed with exit code $LASTEXITCODE." }
Write-Host "Wrote read-only identity export to $Output"
