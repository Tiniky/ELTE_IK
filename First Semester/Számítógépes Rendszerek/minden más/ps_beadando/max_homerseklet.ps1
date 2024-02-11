$max = 0
$maxX = 0
$maxY = 0
$maxdat = 0
$maxora = 0
$index = 0
$homersekletek = @()

$i = 0
Get-Content .\meresek.txt | % {
    $i += 1
    $a = 0

    $_ -split ";" | % {
        $a += 1
        if($a -eq 5) {
            $homersekletek += $_
        }
    }
}

$max = ($homersekletek | measure -Maximum).Maximum
$hossz = ($homersekletek | measure -Maximum).Count -1

(0..$hossz) | % {
    if($homersekletek[$_] -eq $max) {
        $index = $_ + 1
    }
}

$i2 = 0
Get-Content .\meresek.txt | % {
    $i2 += 1
    $b = 0

    $_ -split ";" | % {
        $b += 1
        if($i2 -eq $index) {
            if($b -eq 1) {
                $maxX = $_
            }

            if($b -eq 2) {
                $maxY = $_
            }

            if($b -eq 3) {
                $maxdat = $_
            }

            if($b -eq 4) {
                $maxora = $_
            }
        }
    }
}

Write-Output "A(z) $maxX, $maxY koordinátákon volt, $maxdat $maxora -kor a legmelegebb ($max fok)"