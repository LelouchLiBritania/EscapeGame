var objectifs = document.getElementById("Objectifs");
var objectif = document.getElementById("Objectif");
var objectifd1 = document.createElement("div");
var objectifd2 = document.createElement("div");
objectifd1.id = "od1";
objectifd1.innerHTML= "<p> - Cliquez sur le réveil pour réveiller la coloc'. <p>";
objectifd2.id = "od2";
objectifd2.innerHTML = "<p> - Trouvez la clé de la coloc' pour fermer la maison avant de partir. <p>";

objectif.appendChild(objectifd1);
markerd1.on("click", 
    function fonction(event){
        objectif.appendChild(objectifd2);
        d2 = true;
        markerd3.addTo(mymap);
        markerd1.remove(mymap);
})

objectifs.appendChild(objectif);