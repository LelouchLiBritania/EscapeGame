var inventaire = document.getElementById("bouttonInventaire");
var inv = document.getElementById("Inventaire");
var objet = document.getElementById("Objets");
inv.removeChild(objet);
inventaire.addEventListener('click', valider);

var objetsAccessibles = [{nom : "clés", image : "images/cles.jpg"}];
var ouvert = false;
var cle = document.createElement("div");

cle.id = "clé";
cle.style.backgroundImage = "url('images/cles.png')";
cle.style.backgroundSize = "100% 100%";
cle.style.height = "78px";
cle.style.width = "78px";
cle.marker=markerd2;


function valider (event){
    if (ouvert){
        inv.removeChild(objet);
    }
    else{ 
        inv.appendChild(objet);
    }
    ouvert = !ouvert;
}

function selection(obj){
    obj.addEventListener("Click", function(event){
        objet.style.border = "2px red solid"
    });
}

selection(objet)

function creer_objet (nom){
    //connexion à la bdd
    var newobjet = document.createElement("div");
    newobjet.marker=L.marker([x,y])
    newobjet.id = nom;
    newobjet.style.backgroundImage = bdd.im;
    newobjet.style.backgroundSize = "100% 100%";
    newobjet.style.height = "78px";
    newobjet.style.width = "78px";
}

function ramasser (obj){
    obj.marker.addEventListener("click", function(event){
        objet.appendChild(obj);
        obj.marker.remove(mymap);
        d2=false;
    });
}

function utiliser(obj, cible){
    cible.addEventListener("Click", function(event){
        objet.remove(obj);
    });
}
ramasser(cle);
