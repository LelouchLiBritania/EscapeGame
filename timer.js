var time = document.getElementById("time");

var timer = window.setInterval(diminuer,1000);

function stop(){
    window.clearInterval(timer);
}

function diminuer(){
    t = time.innerHTML.split(":");
    min=t[0];
    sec=t[1];
    if(sec==0){
        if(min<=0){
            stop();
        }
        else{
            min-=1;
            sec=59;

            if (sec<10){
                time.innerHTML=min+':0'+sec;
            }
            else{
                time.innerHTML=min+':'+sec;
            }
        }

    }
    else{
        sec-=1;

        if (sec<10){
            time.innerHTML=min+':0'+sec;
        }
        else{
            time.innerHTML=min+':'+sec;
        }
    }

    
    
    
}