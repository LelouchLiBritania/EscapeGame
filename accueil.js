var data = "demande=scores";
var tab = document.getElementById("tab_score");
var ajax = new XMLHttpRequest();
ajax.open('POST', 'connectionBdd.php');
ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
ajax.addEventListener('load',  function () {
    console.log(ajax.response);
    var reponse = JSON.parse(ajax.response);
    
    for (i=0;i<reponse.length;i++){
        //On enregistre dans la div les données relatives à l'objectif
        ligne=document.createElement("li");
        tab.appendChild(ligne);
        ligne.innerHTML = reponse[i][0]+" | "+reponse[i][1];
        console.log(reponse[i][0]+" | "+reponse[i][1]);
    }
});
ajax.send(data);