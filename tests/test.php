<?php
     $SERVEUR  = "localhost:3306";
     $USER     = "root";
     $PASSWORD = "";
     $BASE     = "escapeGame";

     $LINK = mysqli_connect($SERVEUR, $USER, $PASSWORD, $BASE);
     if(!$LINK){
         die("Connection échouée");
     }


    $objet = [];
    $requete = "SELECT name,image,lat,lon,descriptif FROM objet WHERE id = " . $_POST["id"];
    echo $requete;
    if ($result = mysqli_query($LINK, $requete)) {
        while ($ligne = mysqli_fetch_row($result)) {
            $objet[]=$ligne;
        }
    }
    echo json_encode($objet);
?>
