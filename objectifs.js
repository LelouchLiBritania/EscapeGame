var objectifs = document.getElementById("Objectifs");
var objectif = document.getElementById("Objectif");
var objectifd1 = document.createElement("div");
var objectifd2 = document.createElement("div");
var score_total = document.getElementById("score");
var indice ;
objectif.nb_obj = 0;
var score_max;
var data_score = "demande=score_max";
var ajax_score = new XMLHttpRequest();
ajax_score.open('POST', 'connectionBdd.php');
ajax_score.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
ajax_score.addEventListener('load',  function () {
    var reponse = JSON.parse(ajax_score.response);
    score_max=reponse[0][0];
})
ajax_score.send(data_score);

setTimeout(function f(){appeler_objectif(1)},5000); 

function appeler_objectif(id){
    var data = "id="+id+"&demande=objectif";
    var ajax = new XMLHttpRequest();
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        var reponse = JSON.parse(ajax.response);
        var new_objectif = document.createElement("div");
        for (i=0;i<reponse.length;i++){
            //On enregistre dans la div les données relatives à l'objectif
            new_objectif.id="objectif"+reponse[i][0];
            new_objectif.id_bdd=reponse[i][0];
            new_objectif.innerHTML = reponse[i][1];
            new_objectif.objectif_suivant=reponse[i][2];
            //les objets sont sensés déjà avoir été créés
            var obj1=document.getElementById("objet"+reponse[i][3]);
            if(reponse[i][4]!=-1){
                var obj2=document.getElementById("objet"+reponse[i][4]);
            }
            else{
                var obj2=null;
            }
            
            var evt = reponse[i][5];
            new_objectif.victoire=reponse[i][6];
            new_objectif.score = reponse[i][7];
            new_objectif.dest1 = reponse[i][10];
            new_objectif.dest2 = reponse[i][11];
            indice = reponse[i][12];
            
            //permet de générer l'event listener surveillant la condition de réussite
            objectif.appendChild(new_objectif);
            objectif.nb_obj+=1;
            creer_evenement(evt,obj1,obj2,new_objectif);

        }
    });
    ajax.send(data);
}


var pageot = document.getElementById("christian");
var help = document.getElementById("indice");
help.innerHTML="Moi c'est pageot";

pageot.addEventListener('click', function(){
            
    var ancien = help.innerHTML;
    setTimeout(function(){
        if(indice!=ancien){
            help.innerHTML=indice;
            for (var j=0;j<30;j++){
                diminuer();
            }
        }
    },100);
});



function creer_evenement(evt,obj1,obj2,objectif_a_accomplir){
    if(evt=="click"){
        obj1.marker.addEventListener("click",function fonctionClick(event){
            
            obj1.marker.removeEventListener("click",fonctionClick);
            if (objectif_a_accomplir.dest1=="addinv"){
                ajouterInventaire(obj1);
            }
            if (objectif_a_accomplir.dest1=="dispinv"){
                supprimerInventaire(obj1);
            }
            if (objectif_a_accomplir.dest1=="dispcarte"){
                supprimerCarte(obj1);
            }
            
            valider_objectif(objectif_a_accomplir);
            
            
        })
    }
    if(evt=="superposition"){
        obj1.marker.addEventListener("click",function fonctionClick2(event){
            
            newobjetsuperposition=ajouterInventaire(obj1);
            

            function functionEnter(event){
                //ajout à l'inventaire
                /*var newobjet = document.createElement("div");
                newobjet.id = "objet"+obj2.id;
                newobjet.style.backgroundImage = "url("+obj2.marker._icon.src+")";
                newobjet.style.backgroundSize = "100% 100%";
                newobjet.style.height = "78px";
                newobjet.style.width = "78px";
                objet.appendChild(newobjet);//objet est défini dans inventaire
                */
                //retire les marqueurs des objets si besoin
                //obj2.marker.remove(mymap);
                newobjetsuperposition.removeEventListener("mousedown",functionDown);

                
                if (objectif_a_accomplir.dest1=="dispinv"){
                    supprimerInventaire(obj1);
                }

                if (objectif_a_accomplir.dest2=="addinv"){
                    ajouterInventaire(obj2);
                }
                if (objectif_a_accomplir.dest2=="dispinv"){
                    supprimerInventaire(obj2);
                }
                if (objectif_a_accomplir.dest2=="dispcarte"){
                    supprimerCarte(obj2);
                }
                
                valider_objectif(objectif_a_accomplir);
                    
            }

            function functionDown(event){
                obj2.marker._icon.addEventListener("mouseover",functionEnter);
    
            }

            newobjetsuperposition.addEventListener("mousedown",functionDown);
            newobjetsuperposition.addEventListener("mouseup",function functionUp2(event){
                //on laisse le temps à la detection de l'event mouseover de se faire avant de l'enlever
                setTimeout(function f() {obj2.marker._icon.removeEventListener("mouseover",functionEnter)},50);
            });

            
            
        })
        
        
       
    }
    if(evt=="validation"){
        obj1.marker.addEventListener("click",function fonctionClick(event){

            prompt("helloworld")
        })
    }
}

function valider_objectif(objectif_a_accomplir){
    if (objectif.nb_obj==4){
        objectif.innerHTML="";
    }
    objectif_a_accomplir.innerHTML = "<strike>"+objectif_a_accomplir.innerHTML+"</strike>";
    //ajouter le score au score total, la fonction 20*4/PI * ARCTAN( (gain+score)/score_max) permet de creer un gain diminuant au fur et à mesure que le score est élevé
    gain = parseFloat(objectif_a_accomplir.score);
    score_actuel = parseFloat( score_total.innerHTML.substring(7).split("/")[0] );
    //La fonction toFixed permet de ne garder que 2 décimales
    score_total.innerHTML= score_total.innerHTML.substring(0,7)+(80*Math.atan( (gain+score_actuel)/score_max )/Math.PI).toFixed(2)+"/20";
    

    //lecture des objets à rajouter
    var data = "id="+objectif_a_accomplir.id_bdd+"&demande=debloquer_objets";
    var ajax = new XMLHttpRequest();
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        //ajout des objets
        var reponse = JSON.parse(ajax.response);
        
        var new_objet = document.createElement("div");

        //new_obj2 servira a attendre que les objets soient bien créés
        for (i=0;i<reponse.length;i++){
            
            var obj_exixtant=document.getElementById("objet"+reponse[i][0]);
            if(obj_exixtant==null){afficher(reponse[i][0]);
            }
            
        }
        

        //appel du nouvel objectif si il y en a
        //le setTimeout permet d'attendre que la création des objets soit bien fini, pour ne pas avoir d'objets null ensuite
        if(objectif_a_accomplir.victoire==0){
            setTimeout(function f(){appeler_objectif(objectif_a_accomplir.objectif_suivant)},500);
        }
        else{
            victoire();
        }
    })
    ajax.send(data);

    
    };

function victoire(){
    fenetre_victoire = document.createElement("div");
    fenetre_victoire.id = "victoire";
    var fenetre = document.getElementById("Jeu");
    var message_de_victoire = document.createElement("p");
    message_de_victoire.innerHTML = "Félicitaions, vous avez fini votre projet à temps. Voici votre note : "+score_total.innerHTML.substring(7);
    message_de_victoire.id = "messageVictoire";
    fenetre_victoire.append(message_de_victoire);
    fenetre.appendChild(fenetre_victoire);
}



