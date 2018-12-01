var objectifs = document.getElementById("Objectifs");
var objectif = document.getElementById("Objectif");
var objectifd1 = document.createElement("div");
var objectifd2 = document.createElement("div");
var score_total = document.getElementById("score");




appeler_objectif(1);



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
            new_objectif.innerHTML = "-"+reponse[i][1];
            new_objectif.objectif_suivant=reponse[i][9];
            //les objets sont sensés déjà avoir été créés
            var obj1=document.getElementById("objet"+reponse[i][2]);
            if(reponse[i][3]!=-1){
                var obj2=document.getElementById("objet"+reponse[i][3]);
            }
            else{
                var obj2=obj1;
            }
            console.log(obj1,obj2);
            
            var evt = reponse[i][4];
            new_objectif.victoire=reponse[i][5];
            new_objectif.score = reponse[i][6];
            //permet de générer l'event listener surveillant la condition de réussite
            objectif.appendChild(new_objectif);
            objectif.nb_obj+=1;
            creer_evenement(evt,obj1,obj2,new_objectif);

        }
    });
    ajax.send(data);
}



function creer_evenement(evt,obj1,obj2,objectif_a_accomplir){
    if(evt=="click"){
        obj1.marker.addEventListener("click",function fonctionClick(event){
            
            
            ajouterInventaire(obj1);
            valider_objectif(objectif_a_accomplir);
            
            
        })
    }
    if(evt=="superposition"){
        obj1.marker.addEventListener("click",function fonctionClick2(event){
            
            newobjetsuperposition=ajouterInventaire(obj1);
            


            newobjetsuperposition.addEventListener("mousedown",function functionDown(event){
                obj2.marker._icon.addEventListener("mouseover",function functionEnter(event){
                    newobjetsuperposition.addEventListener("mouseup",function functionUp(event){
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
                        
                        valider_objectif(objectif_a_accomplir);
                        
                    })
                })
                obj2.addEventListener("mouseleave",function functionLeave(event){
                    newobjetsuperposition.removeEventListener("mouseup",functionup);
                })
    
            })
            newobjetsuperposition.addEventListener("mouseup",function functionUp2(event){
                obj2.removeEventListener("mouseover",functionEnter);
                obj2.removeEventListener("mouseover",functionLeave);
            })

            
            
        })
        
        
       
    }
}

function valider_objectif(objectif_a_accomplir){
    if (objectif.nb_obj==4){
        objectif.innerHTML="";
    }
    objectif_a_accomplir.innerHTML = "<strike>"+objectif_a_accomplir.innerHTML+"</strike>";
    //ajouter le score au score total
    score_total.innerHTML=score_total.innerHTML+objectif_a_accomplir.score;
    

    //lecture des objets à rajouter
    var data = "id="+objectif_a_accomplir.id_bdd+"&demande=debloquer_objets";
    var ajax = new XMLHttpRequest();
    ajax.open('POST', 'connectionBdd.php');
    ajax.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    ajax.addEventListener('load',  function () {
        //ajout des objets
        var reponse = JSON.parse(ajax.response);
        
        var new_objet = document.createElement("div");
        
        for (i=0;i<reponse.length;i++){
            
            var obj_exixtant=document.getElementById("objet"+reponse[i][0]);
            if(obj_exixtant==null){
                afficher(reponse[i][0]);
            }
            
        }
        //appel du nouvel objectif si il y en a
        if(objectif_a_accomplir.victoire==0){
            appeler_objectif(objectif_a_accomplir.objectif_suivant);
        }
    })
    ajax.send(data);

    
    };
