var time = document.getElementById("time");

window.setInterval(diminuer,1000);
function diminuer(){
    t = time.innerHTML.split(":");
    min=t[0];
    sec=t[1];
    if(sec==0){
        if(min==0){
            clearInterval();
        }
        else{
            min-=1;
            sec=59;
        }
    }
    else{
        sec-=1;
    }

    time.innerHTML=min+':'+sec;
}