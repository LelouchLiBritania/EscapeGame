var data = "demande=scores";
var tab = document.getElementById("tab_score");
var ajax = new XMLHttpRequest();
ajax.open('POST', 'connectionBdd.php');
ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
ajax.addEventListener('load',  function () {
    var reponse = JSON.parse(ajax.response);
    
    for (i=0;i<reponse.length;i++){
        //On enregistre dans la div les données relatives à l'objectif
        var ligne=document.createElement("tr");
        tab.appendChild(ligne);
        var nom = document.createElement("td");
        var score = document.createElement("td");
        nom.innerHTML = reponse[i][0];
        score.innerHTML = reponse[i][1];
        ligne.appendChild(nom);
        ligne.appendChild(score);
    }
});
ajax.send(data); 