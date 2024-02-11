<?php
$family = json_decode(file_get_contents('family.json'), true);

$write = false;
if (count($_POST) > 0){
    $member = [
        "name" => $_POST['name']
    ];

    $family[] = $member;
    $write = true;
}

if ($write) {
  file_put_contents('family.json', json_encode($family, JSON_PRETTY_PRINT));
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Task 3</title>
  <link rel="stylesheet" href="index.css">
</head>
<body>
  <h1>Task 3: Gift list</h1>
  <h2>My family members</h2>
  <form action="" method="post">
    Name: <input type="text" name="name" required>
    <button type="submit">Add</button>
  </form>
  <ul>
    <?php foreach($family as $member): ?>
      <li><a href=<?='member.php?id='.urldecode($member['name'])?>><?=$member['name'] ?></a></li>
    <?php endforeach ?>
  </ul>
</body>
</html>