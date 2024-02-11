param(
        [Parameter(Position = 0, mandatory = $true)][int]$lomb,
        [Parameter(Position = 0, mandatory = $true)][int]$torzs

)

$db = 0

1..$lomb | % {
    if($_ -eq 1) {
        $db = 1
    } else {
        $db += 2
    }

    $maxDB = $db
}

$kozep = [math]::Ceiling(9/2)

1..$lomb | % {
    if($_ -eq 1) {
        $db = 1
    } else {
        $db += 2
    }

    $ures = $maxDB - $db
    $spacek = " " * ($ures/2)
    $fa = "#" * $db
    if($ures -ne 0) {
        $kimenet = "$spacek $fa $spacek"
    } else {
        $kimenet =" $fa"
    }
    
    Write-Host "$kimenet" -ForegroundColor Green
}

1..$torzs | % {
    $ures = $maxDB - 1
    $spacek = " " * ($ures/2)
    $fa = "#"
    $kimenet = "$spacek $fa $spacek"
    Write-Host "$kimenet" -ForegroundColor Gray
}