$ar = 40
$max = 0
$input | % {
    $adat = $_ -split ":"
    $nev = $adat[0]
    $kave = $adat[1]
    
    $fizet = [int]$kave * $ar
    if($fizet -gt $max) {
        $max = $fizet
        $kimenet = "$nev $fizet"
    }
}
Write-Host "$kimenet"

$input | % {
    $adat = $_ -split ":"
    $nev = $adat[0]
    $kave = $adat[1]
    
    $fizet = [int]$kave * $ar
    if($fizet -ne $max) {
        $kimenet = "$nev $fizet"
    }
    Write-Host "$kimenet"
}