var vult = document.getElementById("carre");

var x_souris_dep = 0;
var y_souris_dep = 0;
var dx_aux=0;
var dy_aux=0;
var dx_tot=0;
var dy_tot=0;

function bouger(event){
    var x_s = event.clientX;
    var y_s = event.clientY;
    var dx = x_s-x_souris_dep+dx_aux;
    var dy = y_s-y_souris_dep+dy_aux;
    dx_tot+=dx;
    dy_tot+=dy;


    vult.style.transform = "translate("+dx+"px,"+dy+"px)";

}

function start(event){
    x_souris_dep = event.clientX;
    y_souris_dep = event.clientY;
    document.addEventListener('mousemove',bouger);
}

function stop(event){
    document.removeEventListener('mousemove',bouger);
    vult.style.transform = "translate("+0+"px,"+0+"px)";
}



vult.addEventListener('mousedown',start);
vult.addEventListener('mouseup',stop);