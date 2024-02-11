<?php
//f: két dátum összehasonlítása
    $voltHiba = false;
    $hibak = [];
    $voltSzuletes = isset($_POST["szuletes"]) && trim($_POST["szuletes"]) != "";
    $szuletesString = "";
    $szuletesDatum = [];
    $voltJogositvany = isset($_POST["jogositvany"]) && trim($_POST["jogositvany"]) != "";
    $jogositvanyString = "";
    $jogositvanyDatum = [];

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        //születési dátum megadva
        if(!$voltSzuletes){
            $voltHiba = true;
            $hibak[] = "A születési idő megadása kötelező!";
        }else{
            //születési dátum formátuma helyes
            $szuletesDatum = explode("-",$_POST["szuletes"]);
            if(count($szuletesDatum) != 3 || !checkdate($szuletesDatum[1],$szuletesDatum[2],$szuletesDatum[0])){
                $voltHiba = true;
                $hibak[] = "A születési idő formátuma helytelen!";
            }else{
                $szuletesString = $_POST["szuletes"];
            }
        }
        //jogosítvány kiállításának dátuma megadva
        if(!$voltJogositvany){
            $voltHiba = true;
            $hibak[] = "A jogosítvány kiállítási dátumának megadása kötelező!";
        }else{
            //jogosítvány kiállítási dátumának formátuma helyes
            $jogositvanyDatum = explode("-",$_POST["jogositvany"]);
            if(count($jogositvanyDatum) != 3 || !checkdate($jogositvanyDatum[1],$jogositvanyDatum[2],$jogositvanyDatum[0])){
                $voltHiba = true;
                $hibak[] = "A jogosítvány kiállítási dátumának formátuma helytelen!";
            }else{
                $jogositvanyString = $_POST["jogositvany"];
            }
        }

        if(!$voltHiba){
            //jogosítvány nincs korábban, mint a születés (egyik megoldás)
            if(
                ($szuletesDatum[0] > $jogositvanyDatum[0]) ||
                ($szuletesDatum[0] == $jogositvanyDatum[0] && $szuletesDatum[1] > $jogositvanyDatum[1]) ||
                ($szuletesDatum[0] == $jogositvanyDatum[0] && $szuletesDatum[1] == $jogositvanyDatum[1] && $szuletesDatum[2] > $jogositvanyDatum[2]) 
            ){
                $voltHiba = true;
                $hibak[] = "Nem szerezhetsz jogosítványt azelőtt, hogy megszületnél!";
            }
        }
    }
?>

<form method="POST">
    Születési dátum: <input name="szuletes" type="date" value=<?=$szuletesString?>><br>
    Jogosítvány kiállításának dátuma: <input name="jogositvany" type="date" value=<?=$jogositvanyString?>><br>
    <input type="submit">
</form>

<?php if($voltHiba): ?>
    <ul>
        <?php foreach($hibak as $hiba): ?>
            <li><?=$hiba?></li>
        <?php endforeach ?>
    </ul>
<?php elseif($_SERVER["REQUEST_METHOD"] == "POST"):
        $szulDatum  = new DateTime($szuletesString);
        $jogsiDatum = new DateTime($jogositvanyString);
        $most = new DateTime();
        $kulonbsegEvekben = date_diff($szulDatum,$jogsiDatum)->y;
        $ervenyessegHossza = $kulonbsegEvekben < 60 ? new DateInterval("P10Y") : new DateInterval("P5Y");

        $jogsiDatum->add($ervenyessegHossza);
        $lejarat = $most < $jogsiDatum ? $jogsiDatum->format("Y M d.") : "Lejárt!";
    ?>

    <div>
        Életkor jogosítvány készítésekor: <?=$kulonbsegEvekben?> <br>
        Jogosítvány lejár: <?=$lejarat?>
    </div>
<?php endif ?>