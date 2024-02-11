#fájl szétszedése páros és páratlan sorokra

$EgyFile = "input.ps1"
$parity = 0
if (Test-Path $EgyFile)
{
    Get-Content $EgyFile | % {
        if ($parity -eq 0) {
            $_ | Out-File -FilePath paratlan.txt -Append
        } else {
            $_ | Out-File -FilePath paros.txt -Append
        }
        $parity = ($parity + 1) % 2
     }
} else {
    Write-Error "Nincs ilyen file"
    }