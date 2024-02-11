param(
        [Parameter(Position = 0, mandatory = $true)]
        [int]$szam
)

$torzsszam =""

while($szam % 5 -ne 0 -and $szam -gt 0){
    $torzsszam += "."
    $szam--
}

while($szam % 5 -eq 0 -and $szam -gt 0){
    $torzsszam += "-"
    $szam -= 5
}

$szam2 = ""

($torzsszam.Length-1)..0 | % {
    $szam2 += $torzsszam[$_]
}

Write-Host $szam2