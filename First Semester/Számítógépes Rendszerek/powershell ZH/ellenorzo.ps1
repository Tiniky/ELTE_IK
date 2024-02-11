$nyeroszamok = 79,42,4,29,48
$talalat = 0

$input | % {
    $tipp = $_
    0..4 | % {
        if($tipp -eq $nyeroszamok[$_]){
            $talalat++
        }
    }
}

Write-Host $talalat