<?php

$shop = [
  [ "brand" => "Homemade", "type"  => "Dark chocolate", "price" => 2000 ],
  [ "brand" => "Grandma's", "type"  => "Milk chocolate", "price" => 1500 ],
  [ "brand" => "Worldsweet", "type"  => "Milk chocolate", "price" => 3000 ],
  [ "brand" => "Worldsweet", "type"  => "Dark chocolate", "price" => 4000 ],
  [ "brand" => "Worldsweet", "type"  => "Orange essence", "price" => 4000 ],
  [ "brand" => "Homemade", "type"  => "Milk chocolate", "price" => 1000 ],
  [ "brand" => "Speziale", "type"  => "Apple & Cinnamon", "price" => 1000 ]
];

$types = [];
foreach($shop as $type){
  if(!in_array($type['type'], $types)){
    $types[] = $type['type'];
  }
}
sort($types);

$brands = [];
foreach($shop as $brand){
  if(!in_array($brand['brand'], $brands)){
    $brands[] = $brand['brand'];
  }
}
sort($brands);

$prices = [];
foreach($shop as $price){
  if(!in_array($price['price'], $price)){
    $prices[] = $price['price'];
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
  <title>Task 1</title>
</head>
<body>
  <h1>Task 1: Candies</h1>
  <table>
    <tr>
      <th></th>
      <?php foreach($types as $type): ?>
        <th><?= $type ?></th>
      <?php endforeach ?>
    </tr>

    <?php foreach($brands as $brand): ?>
      <tr></tr>
      <td><?= $brand ?></td>
      <?php $lastfound = 0; ?>
      <?php foreach($shop as $price): ?>
        <?php if($price['brand'] === $brand): ?>
          <?php for($i = $lastfound; $i<count($types); $i++): ?>
            <?php if($price['type'] === $types[$i]): ?>
              <?php if($price['price'] === $minPrice): ?>
                <td style="lowest"><?= $price['price'] ?></td>
              <?php elseif($price['price'] === $maxPrice): ?>
                <td style="largest"><?= $price['price'] ?></td>
              <?php else: ?>
                <td><?= $price['price'] ?></td>
              <?php endif ?>
              <?php $lastfound = $i+1 ?>
            <?php else: ?>
              <?php if($lastfound <= $i): ?>
                <td></td>
              <?php endif ?>
            <?php endif ?>
          <?php endfor ?>
        <?php endif ?>
      <?php endforeach ?>

    <?php endforeach ?>
  </table>
</body>
</html>