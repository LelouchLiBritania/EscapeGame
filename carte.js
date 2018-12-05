//fichier où on ajoute, et enlève les objets de la carte, et où on créé la carte

//création de la carte, centrée sur fontienne
var mymap = L.map('carte').setView([44.00853,5.79356],30);
L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 22,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw'
}).addTo(mymap);
mymap.setZoom(20);

//On créé un marqueur sur le centre IGN de Forcalquier
var marker = L.marker([43.962406,5.774013]).addTo(mymap);
marker.bindPopup("Bienvenue au centre IGN de Forcalquier.");

//Le timeout permet d'attendre que les objets nécessaires à la création du premier objet sont bien créés
setTimeout(function f(){afficher(1)},500);



//Fonction permettant d'afficher un objet sur la carte selon son id dans la BDD

function afficher(id){
    //lecture de la BDD, on envoie l'id de la BDD au php, ainsi que l'action à effectuer
    var data = "id="+id+"&demande=affichage";

    var ajax = new XMLHttpRequest();
    
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        var reponse = JSON.parse(ajax.response);
        //new_objet est la div à laquelle on associera les infos de l'objet. Elle pourra être ajoutée à l'invntaire si besoin
        var new_objet = document.createElement("div");
        
        for (i=0;i<reponse.length;i++){

            //l'icone affichée sur la carte
            var iconObjet = L.icon({
                iconUrl: reponse[i][1],//url de l'image
                iconSize:     [40, 40]
            });

            new_objet.id="objet"+id;
            new_objet.name=reponse[i][0];
            new_objet.ville= document.getElementById("ville"+reponse[i][5]);//ville à laquelle appartient l'objet,
            //l'objet ne s'affichera que lorsqu'on est dans cette ville
            new_objet.zoom_affichage=reponse[i][6];//zoom à partir duquel l'objet apparait
            var markerObjet = L.marker([reponse[i][2],reponse[i][3]], {icon: iconObjet});//marker placé sur la carte selon les données de la BDD
            new_objet.marker=markerObjet;
            //affichage/masquage de l'objet selon le zoom lors de sa création
            if(mymap.getZoom>=new_objet.zoom_affichage){
                new_objet.affiche = true;//définit si on peut voire l'objet
                new_objet.ville.couche.addLayer(markerObjet);
            }
            
            new_objet.surCarte = true;//définit si l'objet a été retiré de la carte (masquage par zoom non compris)
            //fonction d'affichage/masquage de l'objet selon le zoom lors de sa création
            mymap.addEventListener("zoom", function (){//On observe le niveau de zoom, si l'objet est toujours sur la carte et si il est déjà affiché
                if(new_objet.affiche && mymap.getZoom() < new_objet.zoom_affichage&&new_objet.surCarte){
                    new_objet.marker.remove(new_objet.ville.couche);
                    new_objet.affiche=!new_objet.affiche;
                }
                if(!new_objet.affiche && mymap.getZoom() >= new_objet.zoom_affichage&&new_objet.surCarte){
                    new_objet.ville.couche.addLayer(markerObjet);
                    new_objet.affiche=!new_objet.affiche;
                }
                
                
                   
            }) 
            
            //On fait apparaitre le descriptif de l'objet dans un popup
            new_objet.descriptif = reponse[i][4];

            markerObjet.bindPopup(new_objet.descriptif);
            markerObjet.addEventListener("click", function(){
                objet_actuel=new_objet;
            })
            document.body.appendChild(new_objet);
        }
    });
    ajax.send(data);
}
    
//fonction pour supprimer un objet de la carte
function supprimerCarte(obj){
    marker.remove(obj.ville.couche);
    obj.surCarte=false;
    
}

