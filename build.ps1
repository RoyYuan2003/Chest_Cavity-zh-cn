# Build the resource packs: one zip per Minecraft version under dist/.
# Usage:  powershell -ExecutionPolicy Bypass -File build.ps1
# NOTE: keep this file pure ASCII -- Windows PowerShell 5.1 reads BOM-less
#       scripts as ANSI, so non-ASCII literals here would be corrupted.
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot

# version -> @(pack_format, ascii label appended to the pack description)
$targets = [ordered]@{
    '1.16'   = @(6,  '1.16.2-1.16.5')
    '1.18'   = @(8,  '1.18-1.18.2')
    '1.19'   = @(9,  '1.19-1.19.2')
    '1.20.1' = @(15, '1.20-1.20.1')
}

# The pack description (with section signs and Chinese) lives in the root
# pack.mcmeta so that no non-ASCII text is needed inside this script.
$template = Get-Content (Join-Path $root 'pack.mcmeta') -Raw -Encoding UTF8

New-Item -ItemType Directory -Force -Path (Join-Path $root 'dist') | Out-Null
$tmp = Join-Path $env:TEMP ('cczh-build-' + [guid]::NewGuid())
New-Item -ItemType Directory -Force -Path $tmp | Out-Null

try {
    foreach ($name in $targets.Keys) {
        $fmt, $label = $targets[$name]

        Get-ChildItem $tmp -Force | Remove-Item -Recurse -Force
        Copy-Item (Join-Path $root 'assets') $tmp -Recurse
        Copy-Item (Join-Path $root 'pack.png') $tmp

        $meta = $template | ConvertFrom-Json
        $meta.pack.pack_format = [int]$fmt
        $meta.pack.description = $meta.pack.description + ' [' + $label + ']'
        $json = $meta | ConvertTo-Json -Depth 5

        # UTF-8 without BOM, otherwise some JSON parsers choke on the header.
        $mcPath = Join-Path $tmp 'pack.mcmeta'
        [System.IO.File]::WriteAllText($mcPath, $json, (New-Object System.Text.UTF8Encoding($false)))

        $zip = Join-Path $root ("dist/ChestCavity-zh_cn-$name.zip")
        if (Test-Path $zip) { Remove-Item $zip -Force }
        Compress-Archive -Path (Join-Path $tmp '*') -DestinationPath $zip -CompressionLevel Optimal
        Write-Host ("built {0,-8} pack_format={1,-2} {2} bytes" -f $name, $fmt, (Get-Item $zip).Length)
    }
}
finally {
    Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
}
Write-Host 'done.'
