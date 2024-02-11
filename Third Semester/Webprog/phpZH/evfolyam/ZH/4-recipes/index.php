<?php
session_start();
if (!isset($_SESSION['fridge']))
    $_SESSION['fridge'] = [];
$fridge = $_SESSION['fridge'];

$recipes = json_decode(file_get_contents('recipes.json'), true);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>Task 4</title>
</head>
<body>
    <h1>Task 4: Recipe tracker</h1>
    
    <h2>List of recipes</h2>
    <ul>
        <?php foreach(array_keys($recipes) as $recipe): ?>
            <li><a href=<?='details.php?id='.rawurlencode($recipe)?>><?= $recipe ?></a></li>
        <?php endforeach ?>
    </ul>

    <h2>Fridge contents</h2>
    <?php foreach($fridge as $ingredient): ?>
        <li>$ingredient</li>
    <?php endforeach ?>
    
</body>
</html>
