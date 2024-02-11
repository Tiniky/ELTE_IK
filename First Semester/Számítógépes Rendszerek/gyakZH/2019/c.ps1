param(
        [Parameter(Position = 0, mandatory = $true)]
        $nev
)

$nev = $nev.replace("á","a").replace("é","e").replace("í","i").replace("ó","o").replace("ö","o").replace("ő","o").replace("ú","u").replace("ü","u").replace("ű","u").replace(" ","")
$nev = $nev.ToLower()

$email = $nev + "@szervezet.elte.hu"
$email