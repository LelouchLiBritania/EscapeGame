var inventaire = document.getElementById("bouttonInventaire");
var objet = document.getElementById("Objets");
inventaire.addEventListener('click', valider);

var objetsAccessibles = [{nom : "clés", image : "images/cles.jpg"}];
var ouvert = false;
var cle = document.createElement("div");
cle.id = "clé";
cle.style.backgroundImage = "url('images/cles.jpg')";
cle.style.backgroundSize = "cover";
cle.style.height = "100px";
cle.style.width = "100px";


function valider (event){
    if (ouvert){
        objet.removeChild(cle);
    }
    else{
        objet.appendChild(cle);
    }
    ouvert = !ouvert;
}