Get-Content .\jegyek.txt | % {
    $hossz = 0
    $adat = $_ -split ";"
    $nev = $adat[0]
    $jegyek = $adat[1]
    
    $jegyek -split " " | % {
        $sum += $_
        $hossz++
    }
    if($hossz -lt 5){
        $nev
    }
}

Get-Content .\jegyek.txt | % {
    $sum = 0
    $hossz = 0
    $adat = $_ -split ";"
    $nev = $adat[0]
    $jegyek = $adat[1]
    $megVanAzOtJegy = $false
    
    $jegyek -split " " | % {
        $sum += $_
        $hossz++
    }
    
    $atlag = $sum / $hossz

    if($hossz -ge 5){
        Write-Host "$nev;$atlag;$jegyek"
    }
}