param(
        [Parameter(Position = 0, mandatory = $true)]
        $szoveg
)

$hossz = $szoveg.Length + 4
$csillagok = "*"*$hossz

$csillagok
Write-Host "* $szoveg *"
$csillagok 