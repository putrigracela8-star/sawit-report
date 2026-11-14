$ErrorActionPreference = "Stop"

$extensions = @(
  "*.ts","*.tsx","*.js","*.jsx","*.json","*.sql","*.prisma","*.md","*.yml","*.yaml"
)

$excludeRegex = "\\\\node_modules\\\\|\\\\.next\\\\|\\\\dist\\\\|\\\\build\\\\"

Get-ChildItem -Path . -Recurse -File -Include $extensions |
  Where-Object { $_.FullName -notmatch $excludeRegex } |
  ForEach-Object {
    $path = $_.FullName

    $bytes = [System.IO.File]::ReadAllBytes($path)
    $text = [System.Text.Encoding]::UTF8.GetString($bytes)

    if ($text.Contains("`r`n")) {
      $new = $text.Replace("`r`n", "`n")
      [System.IO.File]::WriteAllText($path, $new, (New-Object System.Text.UTF8Encoding($false)))
      Write-Host "Normalized:" $path
    }
  }
