var inventaire = document.getElementById("bouttonInventaire");
var objet = document.getElementById("Objets");
inventaire.addEventListener('click', valider);

var objetsAccessibles = [{nom : "clés", image : "images/cles.jpg"}];
var ouvert = false;
var cle = document.createElement("div");
cle.id = "clé";
cle.style.backgroundImage = "url('images/cles.png')";
cle.style.backgroundSize = "100% 100%";
cle.style.height = "78px";
cle.style.width = "78px";

var reveil = document.createElement("div");
reveil.id = "réveil";
reveil.style.backgroundImage = "url('images/alarme.png')";
reveil.style.backgroundSize = "100% 100%";
reveil.style.height = "78px";
reveil.style.width = "78px";


function valider (event){
    if (ouvert){
        objet.removeChild(cle);
        objet.removeChild(reveil);
    }
    else{
        objet.appendChild(cle);
        objet.appendChild(reveil);
    }
    ouvert = !ouvert;
}