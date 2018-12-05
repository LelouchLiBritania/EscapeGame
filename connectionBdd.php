<?php
    //connection à la BDD
     $SERVEUR  = "localhost:3306";
     $USER     = "root";
     $PASSWORD = "";
     $BASE     = "escapeGame";

     $LINK = mysqli_connect($SERVEUR, $USER, $PASSWORD, $BASE);
     if(!$LINK){
         die("Connection échouée");
     }
     mysqli_set_charset($LINK,"utf8");

     //requete pour l'affichage d'un objet
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

    //requete pour l'ajout d'un objectif
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

    //requete pour la création d'une énigme
    if ($_POST["demande"]=="ennigme"){
        $objet = [];
        $requete = "SELECT message, reponse FROM ennigmes WHERE objectif = " . $_POST["id"];
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);
    }

    //requete pour obtenir les objectifs bonus
    if($_POST["demande"]=="bonus"){
        $objet = [];
        $requete = "SELECT id FROM objectif WHERE bonus = 1";
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);
    }

    //requete pour obtenir les id des objets débloqués lors de la réussite d'un objectif
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

    //requete pour la création des villes
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

    //requete pour obtenir les temps de trajet entre les villes
    if($_POST["demande"]=="tempsTrajet"){
        $objet = [];
        $requete = "SELECT * FROM trajet";
        
        
        if ($result = mysqli_query($LINK, $requete)) {
            while ($ligne = mysqli_fetch_row($result)) {
                $objet[]=$ligne;
            }
        }
        echo json_encode($objet);

    //requete pour obtenir les 10 meilleurs scores
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

    //requete pour obtenir le score maximal pouvant être atteint
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