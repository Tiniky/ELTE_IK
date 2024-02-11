$penz = Read-Host

$lista = Import-Csv -Path .\bevasarlolista.csv -Header "Mit","DB","Ar" -Delimiter ';'
$lista | % {
    $ar = [int]$_.Ar * $_.DB
    if($penz -ge $ar) {
        $_.Mit
        $penz-=$ar
    } else {
        $penz
    }
}