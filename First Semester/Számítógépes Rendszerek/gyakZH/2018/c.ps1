param(
        [Parameter(Position = 0, mandatory = $true)]
        [int]$n
)

$sorIndex = 0

Get-Content .\bemenet.txt | % {
    $sorIndex++

    $adat = $_ -split ";"
    $nev = $adat[0]
    $szam1 = $adat[1]
    $szam2 = $adat[2]

    if($sorIndex % $n -eq 0){
        if($szam1 -gt $szam2){
            $kimenet = "$nev $szam1"    
        } else {
            $kimenet = "$nev $szam2"
        }
    } else {
        if($szam1 -lt $szam2){
            $kimenet = "$nev $szam1"    
        } else {
            $kimenet = "$nev $szam2"
        }
    }

    $kimenet.Replace(" ",": ")
}