var mymap = L.map('carte').setView([43.962406,5.774013],30);
L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 22,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw'
}).addTo(mymap);
mymap.setZoom(18);

var marker = L.marker([43.962406,5.774013]).addTo(mymap);
marker.bindPopup("Bienvenue au centre IGN de Forcalquier.");

var iconreveil = L.icon({
    iconUrl: 'images/alarme.png',
    iconSize:     [40, 40],
    iconanchor: [0,0]
});

var iconcle = L.icon({
    iconUrl: 'images/cles.png',
    iconSize: [30,30],
})

var markerd1 = L.marker([44.00853,5.79356], {icon: iconreveil}).addTo(mymap);
markerd1.bindPopup("Cliquez sur le réveil pour réveiller la coloc'.").addTo(mymap);

     
var markerd2 = L.marker([44.00848,5.7936], {icon: iconcle});

mymap.on('click',
    function fonction(event){
        console.log(mymap.getZoom())
        if (mymap.getZoom() == 22){
            markerd2.addTo(mymap);}
        else{
            markerd2.remove(mymap);
        }
    }
 
)

function afficher(event){
    
}
    


