<?php

    $hibak = [];
    
    if(isset($_POST["name"]) && isset($_POST["email"]) && isset($_POST["age"])){
        $name = $_POST["name"];
        $email = $_POST["email"];
        $age = $_POST["age"];

        if(count(explode(" ", $name)) < 2){
        $hibak[] = "Teljes név megadása kötelező!";
        }

        if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $hibak[] = "Hibás email cím!";
        }

        if(!is_numeric($age)){
            $hibak[] = "Hibás életkor!";
        }

        if(intval($age) < 18){
            $hibak[] = "A kor nem lehet kisebb, mint 18!";
        }
    } else {
        $hibak[] = "Nem töltötted ki az összes mezőt!";
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gyak10</title>
</head>
<body>
    <form action="" method="post">
        <input type="text" name="name" value="<?=isset($_POST["name"]) ? $_POST["name"] : '' ?>"> </br>
        <input type="text" name="email" value="<?=isset($_POST["email"]) ? $_POST["email"] : '' ?>"> </br>
        <input type="text" name="age" value="<?=isset($_POST["age"]) ? $_POST["age"] : '' ?>"> </br>
        <input type="submit" value="Küldés">
    </form>
    <ul>
        <?php if(count($hibak) == 0): ?>
            <li style="color:green;">ALL GOOD</li>
        <?php else: ?>
            <?php foreach($hibak as $hiba): ?>
                <li style="color:red;"><?= $hiba ?></li>
            <?php endforeach ?>
        <?php endif ?>
    </ul>
</body>
</html>