<?php
//f: beolvasás json fileból, 
$formak = json_decode(file_get_contents("f2.json"));
?>
<svg style="border: 1px solid black">
    <?php foreach($formak as $forma): ?>
        <?php if($forma->type == "ellipse"): ?>
            <ellipse
                cx = "<?=$forma->x?>"
                cy = "<?=$forma->y?>"
                rx = "<?=$forma->rx?>"
                ry = "<?=$forma->ry?>"
            ></ellipse>
        <?php elseif($forma->type == "circle"): ?>
            <circle
                fill = "white"
                cx = "<?=$forma->x?>"
                cy = "<?=$forma->y?>"
                r = "<?=$forma->r?>"
            ></circle>
        <?php elseif($forma->type == "polyline" && count($forma->points) > 5): ?>
            <?php
                $pontok = "";
                foreach($forma->points as $pont){
                    $pontok .= $pont->x . "," . $pont->y . " ";
                }
            ?>
            <polyline points="<?=$pontok?>"></polyline>
        <?php endif ?>
    <?php endforeach ?>
</svg>