param(
        [Parameter(Position = 0, mandatory = $true)]
        $szoveg
)

$szam = Get-Random -Minimum 0 -Maximum 10

Write-Host "$szoveg $szam"