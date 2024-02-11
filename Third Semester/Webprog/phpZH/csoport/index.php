<?php

$crew = json_decode(file_get_contents('crew.json'));

$errors = [];

if(isset($_GET)) {
    if(!isset($_GET['nameNew'])) {
        if(empty($_GET['nameNew'])) {
            $errors[] = 'Name is empty';
        }
    }

    if(!isset($_GET['titleNew'])) {
        if(empty($_GET['titleNew'])) {
            $errors[] = 'Title is empty';
        }
    }

    if(!isset($_GET['affiliationNew'])) {
        if(empty($_GET['affiliationNew'])) {
            $errors[] = 'Affiliation is empty';
        }
    }

    if(empty($errors)) {
        $new_member = [
            "name"=> $_GET['nameNew'],
            "title" => $_GET['titleNew'],
            "affiliation"=> $_GET['affiliationNew']
        ];

        array_push($crew, $new_member);

        file_put_contents('crew.json', json_encode($crew, JSON_PRETTY_PRINT));
    }
}

$human = array_filter($crew, function($crew) {
    return $crew->affiliation == "human";
});

$hibrid = array_filter($crew, function($crew) {
    return $crew->affiliation == "hibrid";
});

$cultist = array_filter($crew, function($crew) {
    return $crew->affiliation == "cultist";
});

function szinez($member){
    if($member->affiliation == "human"){
        return "green";
    } elseif($member->affiliation == "hibrid"){
        return "purple";
    } else{
        return "red";
    }
}

function tartalmaz($name, $namePart){
    return strpos($name, $namePart) !== false;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShipCrew</title>
</head>
<body>
    
    <form method="get">
        Name (part): <input type="text" name="namePart"> <br>
        <input type="checkbox" name="affiliation" value="human"> Human <br>
        <input type="checkbox" name="affiliation" value="hibrid"> Hibrid <br>
        <input type="checkbox" name="affiliation" value="cultist"> Cultist <br>
        <button type="submit">Search!</button>
    </form>

    <table>
        <tr>
            <th>Name</th>
            <th>Title</th>
            <th>Affiliation</th>
        </tr>
        <?php foreach($crew as $member): ?>
            <tr style="background-color: <?= szinez($member) ?> ;">
                <td><?=$member->name?></td>
                <td><?=$member->title?></td>
                <td><?=$member->affiliation?></td>
            </tr>
        <?php endforeach ?>
    </table>
    <ul>
        <?php if(count($human) > 0):?>
            <li>human: <?=count($human)?></li>
        <?php endif ?>
        <?php if(count($hibrid) > 0):?>
            <li>hibrid: <?=count($hibrid)?></li>
        <?php endif ?>
        <?php if(count($cultist) > 0):?>
            <li>cultist: <?=count($cultist)?></li>
        <?php endif ?>
    </ul>
    <br><br>
    <form method="get">
        <p>Add new: </p>
        Name: <input type="text" name="nameNew"> <br>
        Title: <input type="text" name="titleNew"> <br>
        <input type="checkbox" name="affiliationNew" value="human"> Human <br>
        <input type="checkbox" name="affiliationNew" value="hibrid"> Hibrid <br>
        <input type="checkbox" name="affiliationNew" value="cultist"> Cultist <br>
        <button type="submit">ADD</button>
    </form>
</body>
</html>

