param(
        [Parameter(Position = 0, mandatory = $true)]
        [int]$sebzes
)

$lista = Import-Csv -Path .\Harc.csv -Header "Név","Választott támadás","Kockák" -Delimiter ','

$dobott = 0

$lista | % {
    $kocka = $_.Kockák
    $kocka = $kocka -split "d"
    $n = $kocka[0]
    $m = $kocka[1]
    
    1..$n | % {
        $dobas = Get-Random -Minimum 1 -Maximum $m
        $dobott += $dobas
    }
}

$sebzes -= $dobott

if($sebzes -le 0){
    Write-Host $true
} else {
    Write-Host $false
}