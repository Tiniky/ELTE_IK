<?php
$errors[] = [];

if($_GET){
    if(!isset($_GET['fullname']) || trim($_GET['fullname']) === '' || count(explode(" ",$_GET['fullname']))<2){
        $errors[] = 'Fullname';
    } else{
        $fullname = $_GET['fullname'];
    }

    if(!isset($_POST['email']) || filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
        $errors[] = 'E-mail';
    } else{
        $email = $_GET['email'];
    }

    $colors = ["black", "white", "pink", "gold", "blue"];
    if (!isset($_GET['colour']) || !in_array('colour', $colors)) {
        $errors[] = 'Colour';
    } else{
        $colour = $_GET['colour'];
    }
        
    if (!isset($_GET['cardnumber'])) {
        $errors[] = 'Cardnum';
    } else if(strlen(trim($_GET['cardnumber']))!=19){
        $errors[] = 'chars';
    } else{
        $cardnum = $_GET['cardnumber'];
        $nums = explode("-", $cardnum);

        foreach($nums as $num){
            if(!filter_var($num, FILTER_VALIDATE_INT)){
                $errors[] = 'Cardnum';
            }
        }
        
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>Task 2</title>
</head>
<body>
    <h1>Task 2: You've just won a new phone!</h1>
    <form action="index.php" method="get" novalidate>
        <label for="i1">Your full name:</label> <input type="text" name="fullname" id="i1" value="<?=isset($_GET["fullname"]) ? $_GET["fullname"] : ''?>">
        <?php if(in_array('Fullname', $errors)): ?>
            <?php echo 'Full name is required!' ?>
        <?php endif ?>
        <br>
        <label for="i2">Your e-mail address:</label> <input type="text" name="email" id="i2" value="<?=isset($_GET["email"]) ? $_GET["email"] : ''?>">
        <?php if(in_array('E-mail', $errors)): ?>
            <?php echo 'E-mail address is required!'?>
        <?php endif ?>
        <br>
        <label>Choose colour:</label>
        <?php if(in_array('Colour', $errors)): ?>
            <?php echo 'Colour is required!' ?>
        <?php endif ?>
        <br>
        <input type="radio" name="colour" value="black" id="i3a"> <label for="i3a">black</label><br>
        <input type="radio" name="colour" value="white" id="i3b"> <label for="i3b">white</label><br>
        <input type="radio" name="colour" value="gold" id="i3c"> <label for="i3c">gold</label><br>
        <input type="radio" name="colour" value="pink" id="i3d"> <label for="i3d">pink</label><br>
        <input type="radio" name="colour" value="blue" id="i3e"> <label for="i3e">blue</label><br>
        <label for="i4">Your credit card number:</label>
        <input type="text" name="cardnumber" id="i4" value="<?=isset($_GET["cardnumber"]) ? $_GET["cardnumber"] : ''?>">
        <?php if(in_array('Cardnum', $errors)): ?>
            <?php echo 'Card number is required!' ?>
        <?php elseif(in_array('chars', $errors)): ?>
            <?php echo 'Card number must be 19 characters long!' ?>
        <?php endif ?>
        <br>
        <button type="submit">Click here to get your free phone today!</button>
    </form>

    <?php if(count($errors) == 0): ?>
        <div id="success">
            <h2></h2>
            <div id="progress-bar">
                <div id="progress-bar-fill"></div>
            </div>
        </div>
    <?php endif ?>

    <h2>Hyperlinks for testing</h2>
    <a href="index.php?fullname=&email=&cardnumber=">fullname=&email=&cardnumber=</a><br>
    <a href="index.php?fullname=Grandma&email=&cardnumber=">fullname=Grandma&email=&cardnumber=</a><br>
    <a href="index.php?fullname=Lovely+Grandma&email=&cardnumber=">fullname=Lovely+Grandma&email=&cardnumber=</a><br>
    <a href="index.php?fullname=Lovely+Grandma&email=nagyi&cardnumber=">fullname=Lovely+Grandma&email=nagyi&cardnumber=</a><br>
    <a href="index.php?fullname=Lovely+Grandma&email=nagyi%40webprog.hu&cardnumber=">fullname=Lovely+Grandma&email=nagyi%40webprog.hu&cardnumber=</a><br>
    <a href="index.php?fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=red&cardnumber=">fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=red&cardnumber=</a><br>
    <a href="index.php?fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=pink&cardnumber=">fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=pink&cardnumber=</a><br>
    <a href="index.php?fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=pink&cardnumber=1234">fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=pink&cardnumber=1234</a><br>
    <a href="index.php?fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=pink&cardnumber=1234.5678.1234.5678">fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=pink&cardnumber=1234.5678.1234.5678</a><br>
    <a href="index.php?fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=pink&cardnumber=1234-5678-1234-5678"><span style="color: green">Correct input: </span>fullname=Lovely+Grandma&email=nagyi%40webprog.hu&colour=pink&cardnumber=1234-5678-1234-5678</a><br>

    <script src="index.js"></script>
    </body>
</html>
