//boutton de l'inventaire
var inventaire = document.getElementById("bouttonInventaire");
//div contenant le boutton est les objets
var inv = document.getElementById("Inventaire");
//div contenant les objets de l'inventaire
var objet = document.getElementById("Objets");
//au début, l'inventaire est fermé
inv.removeChild(objet);
var ouvert = false;
//EventListener permettant d'ouvrir/fermer l'inventaire
inventaire.addEventListener('click', valider);

function valider (event){
    if (ouvert){
        inv.removeChild(objet);
    }
    else{ 
        inv.appendChild(objet);
    }
    ouvert = !ouvert;
}


//fonction d'ajout d'un objet de la carte à l'inventaire (obj est l'objet lui même)
function ajouterInventaire (obj){
    //ajout à l'inventaire
    var newobjet = document.createElement("div");
    newobjet.id = obj.id;
    newobjet.style.backgroundImage = "url("+obj.marker._icon.src+")";
    newobjet.style.backgroundSize = "100% 100%";
    newobjet.style.height = "78px";
    newobjet.style.width = "78px";
    objet.appendChild(newobjet);//objet est ajouté dans inventaire
    //On change le zIndex pour que les objets de l'inventaire apparaissent au dessus de la carte lors du drag and drop
    newobjet.style.zIndex="400000000000";

    //retire les marqueurs des objets si besoin
    marker.remove(obj.ville.couche);
    obj.marker.remove(mymap);
    obj.surCarte=false;

    //On ajoute la possibilité de drog & drop l'objet
    //si on lache l'objet, il revient à sa place

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

//fonction de suppression d'un objet de l'inventaire
function supprimerInventaire(obj){
    objet.removeChild(obj);
}




