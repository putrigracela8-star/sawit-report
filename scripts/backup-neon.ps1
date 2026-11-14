param(
  [string]$DatabaseUrl = $env:SR_DATABASE_URL,
  [string]$BackupDir = $env:SR_BACKUP_DIR,
  [int]$RetentionDays = 30
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($DatabaseUrl)) {
  throw "DatabaseUrl is required. Set SR_DATABASE_URL env var or pass -DatabaseUrl."
}

if ([string]::IsNullOrWhiteSpace($BackupDir)) {
  $BackupDir = "$PSScriptRoot\..\backups"
}

$pgDump = (Get-Command pg_dump -ErrorAction SilentlyContinue)
if (-not $pgDump) {
  throw "pg_dump not found in PATH. Install PostgreSQL client tools and ensure pg_dump is available."
}

New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null

$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$baseName = "sawitreport_neon_${timestamp}"
$dumpPath = Join-Path $BackupDir ("${baseName}.dump")
$zipPath = Join-Path $BackupDir ("${baseName}.zip")
$logPath = Join-Path $BackupDir "backup.log"

$startLine = "[{0}] START backup -> {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $zipPath
Add-Content -Path $logPath -Value $startLine

& $pgDump.Source $DatabaseUrl --format=custom --no-owner --no-acl --file $dumpPath
if ($LASTEXITCODE -ne 0) {
  throw "pg_dump failed with exit code $LASTEXITCODE"
}

if (Test-Path $zipPath) {
  Remove-Item -Force $zipPath
}

Compress-Archive -Path $dumpPath -DestinationPath $zipPath -CompressionLevel Optimal
Remove-Item -Force $dumpPath

$cutoff = (Get-Date).AddDays(-1 * [Math]::Abs($RetentionDays))
Get-ChildItem -Path $BackupDir -Filter "sawitreport_neon_*.zip" -File |
  Where-Object { $_.LastWriteTime -lt $cutoff } |
  Remove-Item -Force

$endLine = "[{0}] OK backup -> {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $zipPath
Add-Content -Path $logPath -Value $endLine
