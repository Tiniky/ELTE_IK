#faktoriális fg

function Fakt{
    param(

        [Parameter(Position = 0, mandatory = $true)]
        [int]$szam
    )

    if ($szam -eq 0){
        return 1
    } else {
        $fakt = 1
        1..$szam | % {
            $fakt = $_*$fakt
        }

        return $fakt
    }
}