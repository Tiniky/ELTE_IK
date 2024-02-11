<?php

$uj_cim = $_POST["cim"];
$uj_eloado = $_POST["eloado"];
$uj_ev = intval($_POST["ev"]);
$uj_link = $_POST["link"];

$uj_zene = [
    "cim" => $uj_cim,
    "eloado" => $uj_eloado,
    "ev" => $uj_ev,
    "link" => $uj_link
];

if(file_exists('lista2.json')){
    $zene = json_decode(file_get_contents('lista2.json'));
    
    array_push($zene, $uj_zene);
    
    file_put_contents('lista2.json', json_encode($zene, JSON_PRETTY_PRINT));
}

header("location: listaStuff.php");
?>