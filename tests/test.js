
var objet = "1";

var data = "id="+objet;

var ajax = new XMLHttpRequest();
ajax.open('POST', 'test.php');
ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
ajax.addEventListener('load',  function () {
    //var reponse = JSON.parse(ajax.response);
    var reponse =ajax.response;
    console.log(reponse);
    var place_inventaire = document.getElementById("test_inventaire");
    var new_objet = document.createElement("div");
    /*for (i=0;i<reponse.length;i++){
        console.log(reponse[i][0]);

        new_objet.id = reponse[i][0];
        new_objet.style.backgroundImage = "url("+reponse[i][1]+")";
        new_objet.style.backgroundSize = "100% 100%";
        new_objet.style.height = "78px";
        new_objet.style.width = "78px";

        place_inventaire.appendChild(new_objet);
    }*/
});
ajax.send(data);