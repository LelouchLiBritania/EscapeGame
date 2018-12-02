var listeVilles = document.getElementById("villes");
var time = document.getElementById("time");

var ville_actuelle=1;

var temps = [];
for (var i=0;i<11;i++){
    temps.push([]);
    for(var j=0;j<11;j++){
        temps[i].push(0);
    }
}



function ajouterVille(id){
    //lectureBdd
    var data = "id="+id+"&demande=ville";

    var ajax = new XMLHttpRequest();
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        var reponse = JSON.parse(ajax.response);
        var ville = document.createElement("div");
        for (i=0;i<reponse.length;i++){
            //ajout dans la liste des villes
            ville.innerHTML=reponse[0];
            ville.style.color="rgb(115, 230, 109)";
            listeVilles.appendChild(ville);
            //creation du marqueur de la ville
            
            var iconVille = L.icon({
                iconUrl: reponse[i][3],
                iconSize:     [60, 60]
            });

            var markerVille = L.marker([reponse[i][1],reponse[i][2]], {icon: iconVille}).addTo(mymap);

            //ajout de l'eventListener de deplacement
            ville.addEventListener("click",function deplacement(event){
                //déplacer la vue et la voiture
                var voiture = document.getElementById("objet4").marker._icon;
                voiture.marker.setLatLng([reponse[1]+0.00003,reponse[2]+0.00003]);
                
                //retirer le temps
                for (i=0;i<temps[ville_actuelle];[id-1]){
                    diminuer();
                };

            })
            
        }
    })
    //ajout des temps de trajet
    var data = "id="+id+"&demande=tempsTrajet";

    var ajax = new XMLHttpRequest();
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        var reponse = JSON.parse(ajax.response);
        for (i=0;i<reponse.length;i++){
            temps[i][id-1]=reponse[i];
            temps[id-1][i]=reponse[i];
        }
    })
}
