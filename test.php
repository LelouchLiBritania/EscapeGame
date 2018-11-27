
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

    <?php
        $objet="reveil";
        $requete = "SELECT image,descriptif,objet_debloque FROM objet WHERE name ILIKE \' " . $objet . "\'";
        echo $requete;
    ?>
    
</body>
</html>
