# Synthetic loopback PostgreSQL ONLY. Does not load .env, Supabase links or URLs.
$ErrorActionPreference = 'Stop'
$repo = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$pgBin = Split-Path (Get-Command initdb.exe -ErrorAction Stop).Source -Parent
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\','/')
$runRoot = Join-Path $tempRoot ('tewahedo-faith-sql-' + [guid]::NewGuid().ToString('N'))
$data = Join-Path $runRoot 'data'
$port = Get-Random -Minimum 45000 -Maximum 60000
$serverProcess = $null
$success = $false
$stopped = $false
$savedPg = @{}
Get-ChildItem Env: | Where-Object Name -Like 'PG*' | ForEach-Object { $savedPg[$_.Name] = $_.Value }
function Invoke-LocalSql($database, $file, $commit = $false, $fixed = 'true') {
  $argsForPsql = @('-X','--no-password','-v','ON_ERROR_STOP=1','-h','127.0.0.1','-p',"$port",'-U','postgres','-d',$database,'-v',"expect_fixed=$fixed",'-f',$file)
  if ($commit) { $argsForPsql += @('-c','commit;') }
  & (Join-Path $pgBin 'psql.exe') @argsForPsql
  if ($LASTEXITCODE -ne 0) { throw "Local SQL test failed ($database); no hosted connection was attempted." }
}
try {
  # Clear service/host-address/options overrides, then use ONLY explicit loopback.
  Get-ChildItem Env: | Where-Object Name -Like 'PG*' | ForEach-Object { Remove-Item -LiteralPath ('Env:' + $_.Name) }
  New-Item -ItemType Directory -Path $runRoot | Out-Null
  $password = [Convert]::ToHexString([Security.Cryptography.RandomNumberGenerator]::GetBytes(24))
  $passwordFile = Join-Path $runRoot 'password'
  [IO.File]::WriteAllText($passwordFile, $password + "`n", [Text.UTF8Encoding]::new($false))
  & (Join-Path $pgBin 'initdb.exe') -D $data --auth-host=scram-sha-256 --auth-local=scram-sha-256 --username=postgres --encoding=UTF8 --no-locale --pwfile=$passwordFile | Out-Null
  if ($LASTEXITCODE -ne 0) { throw 'Disposable initdb failed.' }
  $serverProcess = Start-Process -FilePath (Join-Path $pgBin 'postgres.exe') `
    -ArgumentList @('-D',('"' + $data + '"'),'-p',"$port",'-h','127.0.0.1') -WindowStyle Hidden `
    -RedirectStandardOutput (Join-Path $runRoot 'postgres.log') -RedirectStandardError (Join-Path $runRoot 'postgres-error.log') -PassThru
  $env:PGPASSWORD = $password
  $env:PGCONNECT_TIMEOUT = '3'
  $ready = $false
  for ($attempt=0; $attempt -lt 80; $attempt++) {
    if ($serverProcess.HasExited) { throw 'Disposable PostgreSQL exited during startup.' }
    if (Test-Path -LiteralPath (Join-Path $data 'postmaster.pid')) {
      $pidLines = Get-Content -LiteralPath (Join-Path $data 'postmaster.pid')
      if ($pidLines[0] -ne "$($serverProcess.Id)") { throw 'Disposable server identity mismatch.' }
      & (Join-Path $pgBin 'pg_isready.exe') -q -h 127.0.0.1 -p $port
      if ($LASTEXITCODE -eq 0) { $ready=$true; break }
    }
    Start-Sleep -Milliseconds 100
  }
  if (-not $ready) { throw 'Disposable PostgreSQL readiness timed out.' }
  $identity = & (Join-Path $pgBin 'psql.exe') -X --no-password -At -h 127.0.0.1 -p $port -U postgres -d postgres -c "select current_setting('data_directory');"
  if ($LASTEXITCODE -ne 0 -or [IO.Path]::GetFullPath($identity) -ne [IO.Path]::GetFullPath($data)) { throw 'Connected to an unexpected local cluster.' }
  $proposal = Join-Path $repo 'docs/ai/proposed-migrations/20261102_faith_challenges_live_reconciliation.sql'
  $fixedSql = [IO.File]::ReadAllText($proposal).Replace("`r`n","`n")
  $uuidGuard = "if old.id is distinct from new.id or`n     old.question_id"
  $modeGuard = "coalesce(p_payload->>'mode','') not in"
  if (-not $fixedSql.Contains($uuidGuard) -or -not $fixedSql.Contains($modeGuard)) { throw 'Expected two guard fixes were not found.' }
  # Reconstruct ONLY the two old defects in a disposable copy to reproduce them.
  $oldSql = $fixedSql.Replace($uuidGuard,'if old.question_id').Replace($modeGuard,"p_payload->>'mode' not in")
  $oldProposal = Join-Path $runRoot 'previous-guards.sql'
  [IO.File]::WriteAllText($oldProposal,$oldSql,[Text.UTF8Encoding]::new($false))
  foreach ($database in @('faith_before','faith_fixed')) {
    & (Join-Path $pgBin 'createdb.exe') -h 127.0.0.1 -p $port -U postgres $database
    if ($LASTEXITCODE -ne 0) { throw 'Disposable createdb failed.' }
    Invoke-LocalSql $database (Join-Path $repo 'supabase/tests/faith_challenges_local_baseline.sql')
    if ($database -eq 'faith_before') {
      Invoke-LocalSql $database $oldProposal $true
      Invoke-LocalSql $database (Join-Path $repo 'supabase/tests/faith_challenges_validation_regressions.sql') $false 'false'
      Write-Output 'PASS: both original weaknesses reproduced in disposable PostgreSQL.'
    } else {
      Invoke-LocalSql $database $proposal $true
      Invoke-LocalSql $database $proposal $true
      Invoke-LocalSql $database (Join-Path $repo 'supabase/tests/faith_challenges_validation_regressions.sql')
      Write-Output 'PASS: corrected proposal applied twice; PostgreSQL negative regressions passed.'
    }
  }
  $success=$true
} finally {
  if ($serverProcess -and -not $serverProcess.HasExited) {
    & (Join-Path $pgBin 'pg_ctl.exe') -D $data stop -m fast -w -t 10 | Out-Null
    $stopped = $LASTEXITCODE -eq 0
  } else { $stopped=$true }
  Get-ChildItem Env: | Where-Object Name -Like 'PG*' | ForEach-Object { Remove-Item -LiteralPath ('Env:' + $_.Name) }
  foreach ($name in $savedPg.Keys) { Set-Item -LiteralPath ('Env:' + $name) -Value $savedPg[$name] }
  if ($success -and $stopped) {
    # Delete only this invocation's fresh absolute directory, after confirmed stop.
    $resolved=[IO.Path]::GetFullPath($runRoot)
    if ((Split-Path $resolved -Parent) -ne $tempRoot -or (Split-Path $resolved -Leaf) -notmatch '^tewahedo-faith-sql-[a-f0-9]{32}$' -or
        ((Get-Item -LiteralPath $resolved).Attributes -band [IO.FileAttributes]::ReparsePoint)) { throw 'Cleanup boundary rejected.' }
    Remove-Item -LiteralPath $resolved -Recurse -Force
  } elseif (Test-Path -LiteralPath $runRoot) {
    Write-Output "Disposable test artifacts retained for diagnosis: $runRoot"
  }
  if (-not $stopped) { throw 'Local server stop unconfirmed; artifacts preserved.' }
}
