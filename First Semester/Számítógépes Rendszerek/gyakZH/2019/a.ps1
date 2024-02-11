param(
        [Parameter(Position = 0, mandatory = $true)]
        [int]$darab
)

$a = 0
$szam = 0

1..$darab | % {
    $a++
    if($a -eq 1){
        $szam = Get-Random -Minimum 0 -Maximum 9
        $szam
    } else{
        $szam = Get-Random -Minimum $szam -Maximum ($szam + 9)
        $szam

    }
}