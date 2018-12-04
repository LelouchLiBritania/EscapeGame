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

function ajouterInventaire (obj){
    //ajout à l'inventaire
    var newobjet = document.createElement("div");
    newobjet.id = obj.id;
    newobjet.style.backgroundImage = "url("+obj.marker._icon.src+")";
    newobjet.style.backgroundSize = "100% 100%";
    newobjet.style.height = "78px";
    newobjet.style.width = "78px";
    objet.appendChild(newobjet);//objet est ajouté dans inventaire
    //On change le zIndex pour que les objets de l'inventaire apparaissent au dessus 
    newobjet.style.zIndex="400000000000";

    //retire les marqueurs des objets si besoin
    obj.ville.couche.removeLayer(marker);
    obj.marker.remove(mymap);

    //On ajoute la possibilité de drog & drop l'objet


    var x_souris_dep = 0;
    var y_souris_dep = 0;
    var dx_aux=0;
    var dy_aux=0;

    function bouger(event){
        var x_s = event.clientX;
        var y_s = event.clientY;
        var dx = x_s-x_souris_dep+dx_aux;
        var dy = y_s-y_souris_dep+dy_aux;


        newobjet.style.transform = "translate("+dx+"px,"+dy+"px)";

    }

    function start(event){
        x_souris_dep = event.clientX;
        y_souris_dep = event.clientY;
        document.addEventListener('mousemove',bouger);
    }

    function stop(event){
        document.removeEventListener('mousemove',bouger);
        newobjet.style.transform = "translate("+0+"px,"+0+"px)";
    }



    newobjet.addEventListener('mousedown',start);
    newobjet.addEventListener('mouseup',stop);
    return(newobjet);


}

function supprimerInventaire(obj){
    objet.removeChild(obj);
}




