/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function cambioHref(id){
    var nombre =document.getElementById("but"+id).value;
    document.getElementById("alcal").value=id;
    document.getElementById("nom").innerHTML=nombre;
    var botones=document.getElementsByName("boton");
    for (var i = 0; i < botones.length; i++) {
        botones[i].style.display="inline";
    }
    //alert(id);
}
function redi(id){
    var alca = document.getElementById("alcal").value;
    //alert(alca+"  "+id);
    if (alca=="") {
        alert("Seleccione una alcaldía");
    }else{
        location.href="grafica.jsp?idAlca="+alca+"&idGraf="+id+"";
        
    }
}

