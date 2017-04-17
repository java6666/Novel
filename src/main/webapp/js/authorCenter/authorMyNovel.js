/**
 * Created by lenovo on 2017/4/11.
 */
/*每次加载页面时，就显示未完成的小说信息*/
window.onload=function () {
    var sel = document.getElementsByName("sel")[0];
    noFinishNovelList(sel);
}

function checkForm() {
    if(checkNovelName(2)&&checkNovelType(2)&&checkBookSummary(2)&&ckeckNovelPrice(2)){
        return true
    }else {
        checkAll();
        return false;
    }
}

function checkAll() {
    checkBookSummary(2);
    checkNovelType(2);
    checkNovelName(2);
    ckeckNovelPrice(2)
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

/*检查小说售价*/
function ckeckNovelPrice(sel) {
    var mark = document.getElementById("novelPrice");
    var info = document.getElementById("novelPriceINfo");
    if(sel==1){
        mark.style.borderColor="";
        info.innerHTML="";
        info.style.color=""
        info.style.display="none";
    }else {
        if(/^[0-9]{1,4}$/.test(mark.value)){
            mark.style.borderColor="#28ab4b";
            info.innerHTML="小说名输入正确";
            info.style.color="#28ab4b"
            info.style.display="";
            return true;
        }else {
            mark.style.borderColor="#AB2328";
            info.innerHTML="小说售价输入不合格";
            info.style.color="#AB2328"
            info.style.display="";
            return false;
        }
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
/*点击创建新书的js操作
* 通过ajax将将表单信息提交*/
function submitInsertNewNovel() {
    var flag = checkForm();
    if(flag){
        var $insertNewNovel = $("#insertNewNovel")[0];
        var formData = new FormData($insertNewNovel);
        $.ajax({
            type:"post",
            url:"/insertNewNovel",
            data:formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false
        })
    }
}
/*点击未完结的js操作*/
function noFinishNovelList(mark) {
    switchView(mark);
    $.ajax({
        type:"get",
        url:"/selectNoFinishNovelList",
        dataType:"json",
        success:function (novelEntity) {
            if(novelEntity.length>0){
                $("#noNovelInfoList").css("display","");
                var str="<tr>+<th>"+"小说名称"+"</th>+<th>"+"小说类型"+"</th>"+"<th>"+"功能"+"</th>"+"</tr>";
                for(var i=0;i<novelEntity.length;i++){
                    var novelId=novelEntity[i].id;
                    str+="<tr>"+
                        "<td>"+novelEntity[i].novelName +"</td>"+
                        "<td>"+novelEntity[i].novelType +"</td>"+
                        "<td>"+"<p style='display: none'>"+novelId+"</p>"+
                        "<button class='btn btn-info' onclick='noFinishNovelInfo(this)' data-toggle='modal' data-target='#novelModal'>"+"续载"+"</button>"+
                        "</td>"+
                        "</tr>";
                }
                $("#noNovelInfoList").html(str);
            }else {
                $("#noNovel").css("display","");
            }
        }
    })
}

function switchView(mark) {
    var olis = document.getElementsByName("sel");
    for(var i=0;i<olis.length;i++){
        if(olis[i]==mark){
            document.getElementById("tab-" + i).className = "block";
            olis[i].className="btn btn-info";
        }else {
            document.getElementById("tab-" + i).className = "none";
            olis[i].className="btn btn-default";
        }
    }
}
/*点击续载后获取书本详细信息*/
function noFinishNovelInfo(mark) {
    var p = mark.previousSibling;
    var novelId = p.innerHTML;
    $.ajax({
        type:"get",
        url:"/selectNoFinishNovelInfoByNovelId",
        data:{"novelId":novelId},
        dataType:"json",
        success:function (novelEntity) {
            $("#novelModalLabel").html(novelEntity.novelName);
        }
    })
}