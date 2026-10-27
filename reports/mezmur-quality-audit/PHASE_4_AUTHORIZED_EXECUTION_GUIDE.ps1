$hostName = Read-Host 'Supabase database host'
$database = Read-Host 'Database name'
$userName = Read-Host 'Database user'
$securePassword = Read-Host 'Existing Supabase database password' -AsSecureString
if ([string]::IsNullOrWhiteSpace($hostName) -or [string]::IsNullOrWhiteSpace($database) -or [string]::IsNullOrWhiteSpace($userName)) { throw 'Database connection details are required; no action was taken.' }
$bstr = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
try {
  $env:PGPASSWORD = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
  Write-Host 'Run PHASE_4_DRAFT_REVERSION_DRY_RUN.sql in the authorized SQL Editor first.'
  Write-Host 'Do not replace ROLLBACK until every import_id, status, timestamp, and reason is verified.'
  Write-Host "Example read-only invocation: psql --host $hostName --username $userName --dbname $database --file reports/mezmur-quality-audit/PHASE_4_DRAFT_REVERSION_DRY_RUN.sql"
} finally {
  if ($bstr -ne [IntPtr]::Zero) { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr) }
  Remove-Item Env:PGPASSWORD -ErrorAction SilentlyContinue
}
