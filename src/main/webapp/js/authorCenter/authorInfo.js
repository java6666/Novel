/**
 * Created by lenovo on 2017/4/11.
 */
function change(mark) {
    mark.style.display="none";
    var text=document.getElementsByClassName("form-control");
    var span=document.getElementsByTagName("span");
    var birth=document.getElementById("birth");
    document.getElementById("photo").style.display="";
    document.getElementById("drop").style.display="";
    document.getElementById("right").style.display="";
    for(var i=0;i<text.length;i++){
        text[i].style.display="";

    }
    for(var i=0;i<span.length;i++){
        span[i].style.display="none";
    }
    birth.style.display="block";
}