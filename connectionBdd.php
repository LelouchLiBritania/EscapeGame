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

    if ($_POST["demande"]=="affichage"){
        $objet = [];
        $requete = "SELECT name,image,lat,lon,descriptif,Ville,zoom_affichage FROM objet WHERE id = " . $_POST["id"];
        
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);
    }

    if ($_POST["demande"]=="objectif"){
        $objet = [];
        $requete = "SELECT * FROM objectif WHERE id = " . $_POST["id"];
        
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);
    }

    if ($_POST["demande"]=="ennigme"){
        $objet = [];
        $requete = "SELECT * FROM ennigme WHERE id = " . $_POST["id"];
        
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);
    }

    if($_POST["demande"]=="bonus"){
        $objet = [];
        $requete = "SELECT id FROM objectif WHERE bonus = 1";
        echo $requete;
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);
    }

    if($_POST["demande"]=="debloquer_objets"){
        $objet = [];
        $requete = "SELECT id_objet FROM objet_a_debloquer WHERE id_objectif = " . $_POST["id"];
        
        
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);

    }

    if($_POST["demande"]=="villes"){
        $objet = [];
        $requete = "SELECT Name,lat,lon,Image FROM villes WHERE id = " . $_POST["id"] ." ORDER BY id";
        
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);

    }

    if($_POST["demande"]=="tempsTrajet"){
        $objet = [];
        $requete = "SELECT * FROM trajet";
        
        
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);

    }
    if($_POST["demande"]=="scores"){
        $objet = [];
        $requete = "SELECT Log, Best FROM loggin ORDER BY best DESC LIMIT 10";

        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);
    }

    if($_POST["demande"]=="score_max"){
        $objet = [];
        $requete = "SELECT SUM(gain) FROM objectif";

        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);
    }

     

   
?>