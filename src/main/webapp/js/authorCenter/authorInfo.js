/**
 * Created by lenovo on 2017/4/11.
 */
function change(mark) {
    mark.style.display="none";
    var text=document.getElementsByClassName("form-control");
    var ii=document.getElementsByTagName("i");
    var inputDate=document.getElementById("inputDate");
    var gender=document.getElementById("gender");
    document.getElementById("photo").style.display="";
    document.getElementById("drop").style.display="";
    document.getElementById("right").style.display="";
    for(var i=0;i<text.length;i++){
        text[i].style.display="";

    }
   for(var i=0;i<ii.length;i++){
        ii[i].style.display="none";
    }
    inputDate.style.display="block";
    gender.style.display="block";
}
