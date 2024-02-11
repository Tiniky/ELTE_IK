$sum = 0

$targyak = Get-Content .\bemenet.txt

$targyak | % {
    $adat = $_ -split ";"
    $kredit = [int]$adat[1]
    $jegy = [int]$adat[2]

    if($jegy -gt 1){
        $sum += $jegy*$kredit


    }
}

$sum
$kreditIndex = $sum / 30
$kreditIndex