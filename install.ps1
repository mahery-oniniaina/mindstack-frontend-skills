# Installe les skills front de l'équipe Mindstack dans %USERPROFILE%\.claude\skills : Claude Code
# les utilise alors dans tous les projets de l'ordinateur. Rien n'est ajouté au projet en cours.
#
#   irm https://raw.githubusercontent.com/mahery-oniniaina/mindstack-frontend-skills/main/install.ps1 | iex
#   $env:REMPLACER = '1'; irm .../install.ps1 | iex      (met à jour les skills déjà installés)
#   powershell -ExecutionPolicy Bypass -File .\install.ps1 -Remplacer   (depuis un clone du dépôt)
#
# Messages sans accents : Windows PowerShell 5 les afficherait mal.
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$repo = 'mahery-oniniaina/mindstack-frontend-skills'
$dest = Join-Path $HOME '.claude\skills'
$replace = ($args -contains '-Remplacer') -or ($env:REMPLACER -eq '1')

# Depuis un clone : les skills sont a cote du script. Sinon (lien direct) : on telecharge l'archive.
$tmp = $null
if ($PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot 'skills\impeccable\SKILL.md'))) {
  $src = Join-Path $PSScriptRoot 'skills'
} else {
  $tmp = Join-Path ([IO.Path]::GetTempPath()) ('mindstack-skills-' + [guid]::NewGuid())
  New-Item -ItemType Directory -Path $tmp | Out-Null
  Write-Host 'Telechargement des skills...'
  $zip = Join-Path $tmp 'skills.zip'
  Invoke-WebRequest -Uri "https://github.com/$repo/archive/refs/heads/main.zip" -OutFile $zip -UseBasicParsing
  Expand-Archive -Path $zip -DestinationPath $tmp -Force
  $src = Join-Path $tmp 'mindstack-frontend-skills-main\skills'
}

New-Item -ItemType Directory -Force -Path $dest | Out-Null
foreach ($skill in Get-ChildItem -Directory $src) {
  $target = Join-Path $dest $skill.Name
  if (Test-Path $target) {
    if ($replace) {
      Remove-Item -Recurse -Force $target
    } else {
      Write-Host "deja present, garde : $($skill.Name)"
      continue
    }
  }
  Copy-Item -Recurse $skill.FullName $target
  Write-Host "installe : $($skill.Name)"
}
if ($tmp) { Remove-Item -Recurse -Force $tmp }
Remove-Item Env:REMPLACER -ErrorAction SilentlyContinue
Write-Host "Termine : skills dans $dest. Redemarre Claude Code, puis tape / pour les voir."
