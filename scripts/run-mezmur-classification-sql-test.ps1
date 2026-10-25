$ErrorActionPreference = 'Stop'

$pgBin = 'C:\Program Files\PostgreSQL\17\bin'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$cluster = Join-Path $tempRoot ('tewahedodaily-classification-' + [guid]::NewGuid().ToString('N'))
$port = Get-Random -Minimum 55432 -Maximum 55999
$serverLog = Join-Path $cluster 'postgres.log'
$started = $false
$serverProcess = $null

try {
  New-Item -ItemType Directory -Path $cluster | Out-Null
  Write-Output 'Initializing isolated PostgreSQL cluster...'
  & (Join-Path $pgBin 'initdb.exe') -D $cluster --auth=trust --username=postgres --encoding=UTF8 --no-locale | Out-Null
  if ($LASTEXITCODE -ne 0) { throw 'initdb failed' }

  Write-Output "Starting isolated PostgreSQL on port $port..."
  $serverProcess = Start-Process -FilePath (Join-Path $pgBin 'postgres.exe') `
    -ArgumentList @('-D', $cluster, '-p', $port, '-h', '127.0.0.1') `
    -WindowStyle Hidden -RedirectStandardOutput $serverLog `
    -RedirectStandardError (Join-Path $cluster 'postgres-error.log') -PassThru
  for ($attempt = 0; $attempt -lt 80; $attempt++) {
    & (Join-Path $pgBin 'pg_isready.exe') -q -h 127.0.0.1 -p $port
    if ($LASTEXITCODE -eq 0) { $started = $true; break }
    Start-Sleep -Milliseconds 250
  }
  if (-not $started) { throw "PostgreSQL did not become ready on port $port" }

  & (Join-Path $pgBin 'createdb.exe') -h 127.0.0.1 -p $port -U postgres tewahedodaily_test
  if ($LASTEXITCODE -ne 0) { throw 'createdb failed' }

  $files = @(
    'supabase/tests/mezmur_bulk_classification_baseline.sql',
    'supabase/migrations/20261025020000_mezmur_bulk_classification.sql',
    # A second execution proves the forward migration is safely repeatable.
    'supabase/migrations/20261025020000_mezmur_bulk_classification.sql',
    'supabase/tests/mezmur_bulk_classification_test.sql'
  )
  foreach ($file in $files) {
    Write-Output "Applying $file"
    & (Join-Path $pgBin 'psql.exe') -X -v ON_ERROR_STOP=1 -h 127.0.0.1 -p $port -U postgres -d tewahedodaily_test -f (Join-Path $repo $file)
    if ($LASTEXITCODE -ne 0) { throw "psql failed for $file" }
  }
  Write-Output 'PASS: migration executed twice and all PostgreSQL integration assertions passed.'
} finally {
  if ($started) {
    Stop-Process -Id $serverProcess.Id -Force -ErrorAction SilentlyContinue
    Wait-Process -Id $serverProcess.Id -Timeout 10 -ErrorAction SilentlyContinue
  }
  $resolvedCluster = [IO.Path]::GetFullPath($cluster)
  if ($resolvedCluster.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -and
      (Split-Path $resolvedCluster -Leaf).StartsWith('tewahedodaily-classification-')) {
    Remove-Item -LiteralPath $resolvedCluster -Recurse -Force -ErrorAction SilentlyContinue
  }
}
