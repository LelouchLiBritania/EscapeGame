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
    $requete = "SELECT image,descriptif,objet_debloque FROM objet WHERE name LIKE '" . $_POST["objet"] . "'";
    if ($result = mysqli_query($LINK, $requete)) {
        while ($ligne = mysqli_fetch_row($result)) {
            $objet[]=$ligne;
            
        }
    }
    echo json_encode($objet);
?>