<#
.SYNOPSIS
  Setup otomatis SawitReport di Windows Server 2022 (fresh VPS)
.DESCRIPTION
  Install Node.js, Git, PostgreSQL, clone repo, build, dan jalankan app.
  Jalankan sebagai ADMINISTRATOR.
#>

$ErrorActionPreference = "Stop"
$logFile = "$env:TEMP\setup-sawitreport.log"

function Log {
  param([string]$msg)
  $line = "[$(Get-Date -Format 'HH:mm:ss')] $msg"
  Write-Host $line -ForegroundColor Cyan
  Add-Content -Path $logFile -Value $line
}

# ────────────────────────────── CEK ADMIN ──────────────────────────────
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
  Write-Host "Jalankan script ini sebagai ADMINISTRATOR!" -ForegroundColor Red
  exit 1
}

Log "=== SAWITREPORT SETUP ==="

# ────────────────────────────── 1. Node.js ──────────────────────────────
Log "Menginstall Node.js v20 LTS..."
$nodeInstaller = "$env:TEMP\node-installer.msi"
Invoke-WebRequest -Uri "https://nodejs.org/dist/v20.19.1/node-v20.19.1-x64.msi" -OutFile $nodeInstaller
Start-Process msiexec.exe -Wait -ArgumentList "/i `"$nodeInstaller`" /qn ADDLOCAL=ALL"
Remove-Item $nodeInstaller -Force
$env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine")
Log "Node.js $(node --version) terinstall"

# ────────────────────────────── 2. Git ──────────────────────────────
Log "Menginstall Git..."
$gitInstaller = "$env:TEMP\git-installer.exe"
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.48.1.windows.1/Git-2.48.1-64-bit.exe" -OutFile $gitInstaller
Start-Process $gitInstaller -Wait -ArgumentList "/VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS=`"ext,ext\shellhere,assoc,assoc_sh`""
Remove-Item $gitInstaller -Force
$env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine")
Log "Git $(git --version) terinstall"

# ────────────────────────────── 3. PostgreSQL ──────────────────────────────
$pgPass = "SawitReport#2025"
Log "Menginstall PostgreSQL 16 (password: $pgPass)..."
$pgInstaller = "$env:TEMP\pg-installer.exe"
Invoke-WebRequest -Uri "https://get.enterprisedb.com/postgresql/postgresql-16.8-1-windows-x64.exe" -OutFile $pgInstaller
Start-Process $pgInstaller -Wait -ArgumentList "--mode unattended --superpassword `"$pgPass`" --prefix `"$env:ProgramFiles\PostgreSQL\16`" --datadir `"$env:ProgramFiles\PostgreSQL\16\data`""
Remove-Item $pgInstaller -Force

$pgBin = "$env:ProgramFiles\PostgreSQL\16\bin"
$env:Path += ";$pgBin"
[Environment]::SetEnvironmentVariable("Path", $env:Path, "Machine")

Start-Sleep -Seconds 10
Log "PostgreSQL terinstall"

# ────────────────────────────── 4. Buat Database ──────────────────────────────
Log "Membuat database sawitreport..."
& "$pgBin\psql.exe" -U postgres -c "CREATE DATABASE sawitreport;" 2>$null | Out-Null
Log "Database sawitreport siap"

# ────────────────────────────── 5. Clone Repo ──────────────────────────────
$appDir = "C:\sawitreport"
Log "Clone repo ke $appDir ..."
if (Test-Path $appDir) { Remove-Item -Recurse -Force $appDir }
git clone https://github.com/Disunjun/sawitreport.git $appDir
Set-Location -LiteralPath $appDir

# ────────────────────────────── 6. Buat .env ──────────────────────────────
Log "Membuat .env ..."
@"
DATABASE_URL="postgresql://postgres:$pgPass@localhost:5432/sawitreport?schema=public"
AUTH_SECRET="a56675dec38772a2bf129f3d951a744e5511649872c36b1a6ebe4bac32aaa3e7"
"@ | Out-File -FilePath "$appDir\.env" -Encoding UTF8

# ────────────────────────────── 7. npm install & build ──────────────────────────────
Log "npm install ..."
npm install
Log "npm run build ..."
npm run build

# ────────────────────────────── 8. Migrate Database ──────────────────────────────
Log "Jalankan prisma migrate ..."
npx prisma migrate deploy

# ────────────────────────────── 9. Seed (user awal) ──────────────────────────────
Log "Seed database ..."
npx tsx prisma/seed.ts

# ────────────────────────────── 10. PM2 ──────────────────────────────
Log "Install PM2 & jalankan app ..."
npm install -g pm2
pm2 start npm --name "sawitreport" -- start
pm2 save
pm2 startup | Out-Null

# ────────────────────────────── 11. Firewall ──────────────────────────────
Log "Buka firewall port 3000 ..."
netsh advfirewall firewall add rule name="SawitReport" dir=in action=allow protocol=TCP localport=3000

# ────────────────────────────── 12. Test ──────────────────────────────
Start-Sleep -Seconds 5
try {
  $res = Invoke-WebRequest -Uri "http://localhost:3000" -TimeoutSec 10 -UseBasicParsing
  Log "✅ App merespon dengan status $($res.StatusCode)"
} catch {
  Log "⚠️  App belum merespon, cek dengan: pm2 logs"
}

# ────────────────────────────── SELESAI ──────────────────────────────
Write-Host @"

============================================
  ✅  SAWITREPORT SIAP DIGUNAKAN!
============================================
  Akses    : http://localhost:3000
  Login    : sawitreport@gmail.com
  Password : SawitReport#2025
  PIN      : Login=123456, Master=111111
             Input=222222, Report=333333
  Folder   : $appDir
  Log      : $logFile
============================================
"@ -ForegroundColor Green
