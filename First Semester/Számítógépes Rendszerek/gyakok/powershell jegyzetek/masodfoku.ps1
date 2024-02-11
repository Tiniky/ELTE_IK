#másodfokú megoldás

param(
        [Parameter(mandatory = $true)][int]$a,
        [Parameter(mandatory = $true)][int]$b,
        [Parameter(mandatory = $true)][int]$c
    )

$x1 = (( -$b + [math]::Sqrt($b*$b - 4*$a*$c)) / (2*$a))
$x2 = (( -$b - [math]::Sqrt($b*$b - 4*$a*$c)) / (2*$a))

Write-Host "x1,2 = $x1 és $x2"