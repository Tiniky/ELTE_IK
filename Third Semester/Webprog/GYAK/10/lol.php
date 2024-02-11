<?php

$charachters = [
    [
        "name"=> "Powder",
        "affiliation"=> "Zaun"
    ],
    [
        "name"=> "Ekko",
        "affiliation"=> "Zaun"
    ],
    [
        "name"=> "Silco",
        "affiliation"=> "Zaun"
    ],
    [
        "name"=> "Vander",
        "affiliation"=> "Zaun"
    ],
    [
        "name"=> "Viktor",
        "affiliation"=> "Zaun"
    ],
    [
        "name"=> "Jayce",
        "affiliation"=> "Piltover"
    ],
    [
        "name"=> "Heimerdinger",
        "affiliation"=> "Piltover"
    ],
    [
        "name"=> "Cupcake",
        "affiliation"=> "Piltover"
    ],
    [
        "name"=> "Vi",
        "affiliation"=> "Piltover"
    ]
];

$errors = [];

if(isset($_GET)){
    if(!isset($_GET["name"])){
        if(empty($_GET["name"])){
            $errors[] = "Name is empty";
        }
    }

    if(!isset($_GET["affiliation"])){
        if(empty($_GET["affiliation"])){
            $errors[] = "Affiliation is empty";
        }
    }

    if(empty($errors)){
        $charachters[] = [
            "name" => $_GET["name"],
            "affiliation" => $_GET["affiliation"]
        ];
    }
}


$piltover = array_filter($charachters, function($charachter){
    return $charachter["affiliation"] == "Piltover";
});

$zaun = array_filter($charachters, function($charachter){
    return $charachter["affiliation"] == "Zaun";
});

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>League of Legends</title>
</head>
<style>
    .flex{
        display: flex;
        flex-direction: row;
    }
</style>
<body>
    <div class="flex">
        <div>
            <table>
                <tr>
                    <th>NAME</th>
                </tr>
                <?php foreach($charachters as $charachter): ?>
                    <tr>
                        <td style="color:<?=$charachter["affiliation"] == "Piltover" ? "blue" : "green"?>;"><?=$charachter["name"] ?></td>
                    </tr>
                <?php endforeach ?>
            </table>
            <p>Piltover: <?= count($piltover)?></p>
        </div>
        <div>
            <table>
                <tr>
                    <th>NAME</th>
                </tr>
                <?php foreach($charachters as $charachter): ?>
                    <tr>
                        <td style="color:<?=$charachter["affiliation"] == "Piltover" ? "blue" : "green"?>;"><?=$charachter["name"] ?></td>
                    </tr>
                <?php endforeach ?>
            </table>
            <p>Zaun: <?= count($zaun)?></p>
        </div>
    </div>
    <form method="get">
        <input type="text" name="name" placeholder="Name" value="<?=isset($_GET["name"]) ? $_GET["name"] : '' ?>">
        <input type="radio" name="affiliation" value="Piltover" <?=$_GET["affiliation"] == "Piltover" ? 'checked' : ''?>> Piltover
        <input type="radio" name="affiliation" value="Zaun" <?=$_GET["affiliation"] == "Zaun" ? 'checked' : ''?>> Zaun
        <button type="submit">Add</button>
    </form>
    <ul>
        <?php foreach($errors as $error): ?>
            <li style="color:red;"><?= $error ?></li>
        <?php endforeach ?>
    </ul>
</body>
</html>