#legnagyobb közös osztó

$a=110
$b=33

$lnko=1

2..$b | % {
    if ($a % $_ -eq 0) {
        if($b % $_ -eq 0) {
            $lnko = $_
         }
     }
}
$lnko