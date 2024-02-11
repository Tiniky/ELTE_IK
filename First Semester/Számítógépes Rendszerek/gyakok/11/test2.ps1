#összes paraméter összege

$sum = 0

$args | % {
    $sum += $_ 
}

$sum