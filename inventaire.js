var inventaire = document.getElementById("bouttonInventaire");
var inv = document.getElementById("Inventaire");
var objet = document.getElementById("Objets");
inv.removeChild(objet);
inventaire.addEventListener('click', valider);

var objetsAccessibles = [{nom : "clés", image : "images/cles.jpg"}];
var ouvert = false;
var cle = document.createElement("div");
objet.appendChild(cle);

cle.id = "clé";
cle.style.backgroundImage = "url('images/cles.png')";
cle.style.backgroundSize = "100% 100%";
cle.style.height = "78px";
cle.style.width = "78px";

var reveil = document.createElement("div");
objet.appendChild(reveil);
reveil.id = "réveil";
reveil.style.backgroundImage = "url('images/alarme.png')";
reveil.style.backgroundSize = "100% 100%";
reveil.style.height = "78px";
reveil.style.width = "78px";


function valider (event){
    if (ouvert){
        inv.removeChild(objet);
    }
    else{
        inv.appendChild(objet);
    }
    ouvert = !ouvert;
}

function creer_objet (nom){
    //connexion à la bdd
    var newobjet = document.createElement("div");
    newobjet.id = nom;
    newobjet.style.backgroundImage = bdd.im;
    newobjet.style.backgroundSize = "100% 100%";
    newobjet.style.height = "78px";
    newobjet.style.width = "78px";
}

function ramasser (obj){
    obj.addEventListener("click", function(event){
        objet.appendChild(obj);
    });
}

function utiliser(obj, cible){
    cible.addEventListener("Click", function(event){
        objet.remove(obj);
    });
}