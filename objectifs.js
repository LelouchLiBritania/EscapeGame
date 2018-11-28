var objectifs = document.getElementById("Objectifs");
var objectif = document.getElementById("Objectif");
var objectifd1 = document.createElement("div");
var objectifd2 = document.createElement("div");
var score_total = document.getElementById("score");
objectifd1.id = "od1";
objectifd1.innerHTML= "<p> - Cliquez sur le réveil pour réveiller la coloc'. <p>";
objectifd2.id = "od2";
objectifd2.innerHTML = "<p> - Trouvez la clé de la coloc' pour fermer la maison avant de partir. <p>";

objectif.appendChild(objectifd1);

var reveil = document.getElementById("reveil");
markerd1 = reveil.marker;
markerd1.on("click", 
    function fonction(event){
        objectif.appendChild(objectifd2);
        d2 = true;
        markerd3.addTo(mymap);
        markerd1.remove(mymap);
})

objectifs.appendChild(objectif);

function appeler_objectif(id){
    var data = "id="+id+"&demande=objectif";

    var ajax = new XMLHttpRequest();
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        var reponse = JSON.parse(ajax.response);
        var new_objet = document.createElement("div");
        for (i=0;i<reponse.length;i++){


           

            
        }
    });
    ajax.send(data);
}

function creer_evenement(evt,obj1,obj2,objectif_a_accomplir){
    if(evt=="click"){
        obj1.addEventListener("click",function fonction(event){
            var intitule = document.getElementById("intitutlé"+objectif_a_accomplir.id);
            intitule.innerHTML = "<strike>"+intitule.innerHTML+"</strike>";
            if (objectif.nb_obj==4){
                objectif.innerHTML="";
            }
            //ajout à l'inventaire
            var newobjet = document.createElement("div");
            newobjet.id = obj1.id;
            newobjet.style.backgroundImage = "url("+obj1.marker.icon.iconUrl+")";
            newobjet.style.backgroundSize = "100% 100%";
            newobjet.style.height = "78px";
            newobjet.style.width = "78px";
            objet.appendChild(newobjet);//objet est défini dans inventaire

            //retire les marqueurs des objets si besoin
            newobjet.marker.remove(mymap);

            valider_objectif(objectif_a_accomplir);
        })
    }
}

function valider_objectif(objectif_a_accomplir){
    //ajouter le score au score total
    score_total.innerHTML=score_total.innerHTML+objectif_a_accomplir.score;

    //debloquer objets
    var data = "id="+objectif_a_accomplir.id_bdd+"&demande=debloquer_objets";

    var ajax = new XMLHttpRequest();
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        var reponse = JSON.parse(ajax.response);
        var new_objet = document.createElement("div");
        for (i=0;i<reponse.length;i++){
            afficher(reponse[i][0]);
        }

    //debloquer nouvel objectif
    appeler_objectif(objectif_a_accomplir.objectif_suivant);
}