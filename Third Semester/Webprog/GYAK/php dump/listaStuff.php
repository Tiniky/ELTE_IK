<?php

/*echo file_get_contents('test.txt');

file_put_contents('test.txt', 'Szöveg');

echo '<br><br>';
echo file_get_contents('test.txt');


$adatok = json_decode(file_get_contents('lista.json'));

var_dump($adatok);

$adatok[0] = (object)[
    'nev' => "asd",
    'targykod' => "2"
];

file_put_contents('lista.json', json_encode($adatok, JSON_PRETTY_PRINT));*/


$zene = json_decode(file_get_contents('lista2.json'));
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lejátszási Lista</title>
</head>
<body>
    <h1>Lejátszási Lista</h1>
    <table>
        <tr><th>Cím</th><th>Előadó</th><th>Év</th><th>Link</th></tr>
        <?php foreach($zene as $szam): ?>
            <tr><td><?=$szam->cim?></td><td><?=$szam->eloado?></td><td><?=$szam->ev?></td><td><a href="<?=$szam->link?>">🏳‍🌈</a></td></tr>
        <?php endforeach?>
    </table>
    <button onclick="window.location.href='addmusic.php'">Adj hozzá zenét!</button>
</body>
</html>