var mymap = L.map('carte').setView([44.00853,5.79356],30);
L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 22,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw'
}).addTo(mymap);
mymap.setZoom(20);

var marker = L.marker([43.962406,5.774013]).addTo(mymap);
marker.bindPopup("Bienvenue au centre IGN de Forcalquier.");

afficher(1);

var iconcle = L.icon({
    iconUrl: 'images/cles.png',
    iconSize: [30,30]
});

var iconporte_ouverte = L.icon({
    iconUrl: 'images/door_open.png',
    iconSize: [50,50]
});



d2=false
     
var markerd2 = L.marker([44.00848,5.7936], {icon: iconcle});

var markerd3 = L.marker([44.00848, 5.79357], {icon: iconporte_ouverte})

window.setInterval(devoile,100);
function devoile(event){
    //fonction permettant de dévoiler un marker à un certain zoom
    //b est le booleen indiquant si on est bien dans la phase où le marqueur est sensé s'afficher
    //m est le marqueur à dévoiler
    //z est le zoom minimum pour dévoiler le markeu
    if (mymap.getZoom() == 22 && d2){
        markerd2.addTo(mymap);}
    else{
        markerd2.remove(mymap);
    }
}
 


function afficher(id){
    var data = "id="+id+"&demande=affichage";

    var ajax = new XMLHttpRequest();
    
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        var reponse = JSON.parse(ajax.response);
        var place_inventaire = document.getElementById("test_inventaire");
        var new_objet = document.createElement("div");
        
        for (i=0;i<reponse.length;i++){


            var iconObjet = L.icon({
                iconUrl: reponse[i][1],
                iconSize:     [40, 40]
            });

            new_objet.id="objet"+id;
            new_objet.name=reponse[i][0];
            var markerObjet = L.marker([reponse[i][2],reponse[i][3]], {icon: iconObjet}).addTo(mymap);
            new_objet.marker=markerObjet;
            
            new_objet.descriptif = reponse[i][4];

            markerObjet.bindPopup(new_objet.descriptif);
            document.body.appendChild(new_objet);
        }
    });
    ajax.send(data);
}
    


