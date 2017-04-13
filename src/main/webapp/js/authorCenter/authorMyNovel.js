/**
 * Created by lenovo on 2017/4/11.
 */
window.onload = function () {
    var olis = document.getElementsByName("sel");
    for (var i = 0; i < olis.length; i++) {
        olis[i].index = i;
        olis[i].onclick = function () {
            for (var j = 0; j < olis.length; j++) {
                document.getElementById("tab-" + j).className = "none";
                olis[j].className = "btn btn-default";
            }
            document.getElementById("tab-" + this.index).className = "block";
            olis[this.index].className = "btn btn-info";
        }
    }
}

function checkForm() {
    if(checkNovelName(2)&&checkNovelType(2)&&checkBookSummary(2)){
        return true
    }else {
        return false;
    }
}

function checkAll() {
    checkBookSummary(2);
    checkNovelType(2);
    checkNovelName(2);
}

function foo() {
    if (document.getElementById("check_id").checked == true) {
        document.getElementById("submit").disabled = false;
    } else {
        document.getElementById("submit").disabled = true;
    }
}
/*检查小说书名*/
function checkNovelName(select) {

    var info=document.getElementById("novelNameInfo");
    var mark=document.getElementById("novelName");
    if(select==1){
        mark.style.borderColor="";
        info.innerHTML="";
        info.style.color=""
        info.style.display="none";
    }else {
        if(mark.value==""){
            mark.style.borderColor="#AB2328";
            info.innerHTML="书名不能为空";
            info.style.color="#AB2328"
            info.style.display="";
            return false;
        }else {
            mark.style.borderColor="#28ab4b";
            info.innerHTML="书名输入正确";
            info.style.color="#28ab4b"
            info.style.display="";
            return true;
        }
    }
}

/*检查小说的类型选择*/
function checkNovelType(sel) {
    var typeBox = document.getElementById("novelType");
    var selectTuype = typeBox.getElementsByTagName("input");
    var info = document.getElementById("novelTypeInfo");
    var rightType=Array();
    var count=0;
    var str="";
    var typeInfo="";
    for(var i=0;i<selectTuype.length;i++){
        if(selectTuype[i].checked){
            count++;
            rightType.push(selectTuype[i]);
        }
    }
    if(count!=0){
        for(var i=0;i<rightType.length;i++){
            if(i==rightType.length-1){
                typeInfo+=rightType[i].defaultValue;
            }else {
                typeInfo+=rightType[i].defaultValue+"/";
            }
        }
        str="您选择了"+count+"个类型<br>"+typeInfo;
        if(sel==1){
            info.innerHTML = str;
            document.getElementsByName("novelTypeValue")[0].value=typeInfo;
            info.style.color = "#28ab4b"
        }
    }
    if(info.innerHTML==str){
        return true;
    }else {
        info.innerHTML="必须选一个种类，并点击下面的确认按钮";
        info.style.color="#AB2328"
        return false;
    }
}

/*检查小说摘要*/
function checkBookSummary(select) {
    var info=document.getElementById("bookSummaryInfo");
    var mark=document.getElementById("novelSummary");
    if(select==1){
        mark.style.borderColor="";
        info.innerHTML="";
        info.style.color=""
        info.style.display="none";
    }else {
        if(mark.value==""){
            mark.style.borderColor="#AB2328";
            info.innerHTML="小说简介不能为空";
            info.style.color="#AB2328"
            info.style.display="";
            return false;
        }else {
            mark.style.borderColor="#28ab4b";
            info.innerHTML="小说名输入正确";
            info.style.color="#28ab4b"
            info.style.display="";
            return true;
        }
    }
}
