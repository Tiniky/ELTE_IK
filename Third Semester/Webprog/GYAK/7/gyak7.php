<?php

$logikai = true;

$valtozo = '';

if($logikai){
    $valtozo = 'almafa';
} else{
    $valtozo = 'szilvafa';
}

echo '<h style="font-size: 27px">Hello World<h>';

for($i = 0; $i<10; $i++){
    echo '<p style="font-size: ' . ($i*10) . '"10px;>$valtozo</p>';
}

$tomb1 = ['alma', 1, 2, [3,4,5]];
$tomb1[] = 'ujelem';

var_dump($tomb1);

$elte = [
    'nev' => 'Eötvös Loránd Tudományegyetem',
    'oktatas' => true,
    'hallgatokszama' => 42000,
    'karok' =>[
        'ÁJK', 'BgGyK', 'BTK', 'IK', 'GTK', 'PPK', 'TTK', 'TáTK'
    ]
];
$elte['karok'][] = 'TÓK';
$elte['cim'] = '1027 Nekeresd utca 69.';

echo $elte["nev"];
var_dump($elte);
echo '<br>';

$elteObj = (object)$elte;

echo $elteObj->nev . '<br>';

function fugv($p1, $p2){
    return $p1*$p2;
}
echo fugv(2,3);

function fugv2(&$p1, $p2){
    $p1 = $p1*$p2;
    $p2 = $p1*$p2;
    return $p1;
}

$v1 = 2;
$v2 = 3;
echo fugv($v1, $v2) . '<br>';
echo fugv2($v1, $v2) . '<br>';
echo $v1 . '<br>';
echo $v2 . '<br>';

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>GYAK 7</title>
</head>
<body>
    <br><br> Webprog uwu <br><br>
    <?=$valtozo?>
    <br><br>
    <?php if($elteObj->oktatas): ?>
        Karok:
        <ul>
            <?php foreach($elteObj->karok as $kar): ?>
                <li><b><?php=$kar?></b></li>
            <?php endforeach ?>
        </ul>
    <?php endif ?>
</body>
</html>