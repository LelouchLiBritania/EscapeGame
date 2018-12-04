var liste_villes = document.getElementById("villes");
var id_ville_actuelle = 2;
var temps_trajet = [];





var data = "demande=tempsTrajet";
var ajax = new XMLHttpRequest();
ajax.open('POST', 'connectionBdd.php');
ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
ajax.addEventListener('load',  function () {
    var reponse = JSON.parse(ajax.response);
    for (i=0;i<reponse.length;i++){
        temps_trajet.push([]);
        for (var j=1;j<=12;j++){
            temps_trajet[i].push(reponse[i][j]);
        }

    }
})
ajax.send(data);

for (var id=0;id<=11;id++){
    ajouterVille(id);
    
}
afficher(4);
var voiture;
//Il faut attendre que l'objet voiture soit bien créé
setTimeout(function f(){voiture = document.getElementById("objet4");},2000); 
//On ne pet ajouter ces eventListener qu'après avoir créé la voiture, qui ne peut être créée qu'après la création de Fontienne
setTimeout(function f2(){
    for (var id=1;id<=11;id++){
        ville = document.getElementById("ville"+id);
        ville.addEventListener("click",function f(event){
            var ville_actuelle = document.getElementById("ville"+id_ville_actuelle);
            ville_actuelle.couche.remove();
            
            for (var j=0;i<temps_trajet[id_ville_actuelle][ville.id-1];j++){
                diminuer();
            }
            id_ville_actuelle=ville.idBdd-1;
            voiture.marker.setLatLng([parseFloat(ville.lat)+0.00003,parseFloat(ville.lng)+0.00003]);
            ville_actuelle.couche.removeLayer(voiture.marker);
            ville.couche.addLayer(voiture.marker);
            ville.couche.addTo(mymap);

        })
    }
}
,10000)

function ajouterVille(id){
    var ville = document.createElement("li");

    var data = "id="+id+"&demande=villes";
    var ajax = new XMLHttpRequest();
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        var reponse = JSON.parse(ajax.response);
        ville.id="ville"+id;
        ville.idBdd=id;
        for (i=0;i<reponse.length;i++){
            ville.className ="ville";
            ville.innerHTML=reponse[i][0];
            ville.lat=reponse[i][1];
            ville.lng=reponse[i][2];
            ville.couche = L.layerGroup();

            var iconVille = L.icon({
                iconUrl: reponse[i][3],
                iconSize:     [60, 60]
            });
            ville.marker=L.marker([ville.lat,ville.lng], {icon: iconVille}).addTo(mymap);
            ville.marker.bindPopup(ville.innerHTML);
            liste_villes.appendChild(ville);
            
            

        }
    
    })
    ajax.send(data);
}