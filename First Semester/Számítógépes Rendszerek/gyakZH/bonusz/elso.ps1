Get-Content .\kávé.txt | % {
    $sum = 0
    $adat = $_ -split ";"
    $nev = $adat[0]
    $kave = $adat[1]
    
    $kave -split " " | % {
        $sum += [int]$_
    }
    
    $kimenet = "$nev : $sum"
    $kimenet.Replace(" :",":")
}