<?php
    $SERVEUR  = "localhost:3306";
    $USER     = "root";
    $PASSWORD = "";
    $BASE     = "escapeGame";

    $LINK = mysqli_connect($SERVEUR, $USER, $PASSWORD, $BASE);
    if(!$LINK){
        die("Connection échouée");
    }
    mysqli_set_charset($LINK,"utf8");
    $score = $_POST['score'];
    $log = $_POST['loggin'];
    $requete = "SELECT * FROM loggin WHERE Log LIKE ".$log;
    $objet=[];
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }

        if (sizeof($objet)==0){
            $requete="INSERT INTO loggin VALUES (".$log.",".$score.")";
            mysqli_query($LINK, $requete);
        }
        else{
            $requete="UPDATE loggin SET Best=".$score;
            echo $requete;
            mysqli_query($LINK, $requete);
        }
        header('Location:accueil.html');
        exit();

?>