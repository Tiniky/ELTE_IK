<?php
$id = $_GET['id'];
$recipes = json_decode(file_get_contents('recipes.json'), true);
$currentRecipe = $recipes[$id];

session_start();
$fridge = $_SESSION['fridge'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title><?php echo $id ?></title>
</head>
<body>
    <h1>Task 4: Recipe tracker</h1>

    <a href="index.php">← Back to recipes</a>
    
    <h2><?php echo $id ?></h2>

    <form action="index.php" method="POST">
        <?php $ingNum = 1 ?>
        <?php foreach($currentRecipe as $ingredient): ?>
            <input type="checkbox" id="i<?= "ingredient".$ingNum ?>" name="<?= "ingredient".$ingNum ?>" <?php in_array($ingredient, $fridge) ? 'disabled' :'' ?>>
            <label for="<?= "ingredient".$ingNum ?>"><?= $ingredient ?></label> <br>
            <?php $ingNum += 1 ?>
            <?php if(isset($_POST["ingredient".$ingNum])): ?>
                <?php $fridge[] = $ingredient ?>
            <?php endif ?>
        <?php endforeach ?>
        
        <button type="submit">Save</button>
        <?php echo json_encode($fridge) ?>
    </form>

    </body>
</html>