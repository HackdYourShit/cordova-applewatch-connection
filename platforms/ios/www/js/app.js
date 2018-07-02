

function sendDataToWatch(){


    var value = document.getElementById("dataText").value;

    applewatch.sendDataToWatch(value,
                               function(val){
                               alert("Hello "+ val);
                               },
                               function(){
                               alert("faile");
                               });

}

