/**
 * Created by lenovo on 2017/4/11.
 */
/*每次加载页面时，就显示未完成的小说信息*/
window.onload=function () {
    var sel = document.getElementsByName("sel")[0];
    noFinishNovelList(sel);
}
/*点击续载后，点击确认*/
function checkForm() {
    if(checkNovelName(2)&&checkNovelType(2)&&checkBookSummary(2)&&checkNovelPrice(2)){
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
    checkNovelPrice(2)
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
function checkNovelPrice(sel) {
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
                $("#noNovel").css("display","none");
                var str="<tr style='font-weight: bold'>+<td>"+"小说名称"+"</td>+<td>"+"小说类型"+"</td>"+"<td>"+"功能"+"</td>"+"</tr>";
                for(var i=0;i<novelEntity.length;i++){
                    var novelId=novelEntity[i].id;
                    str+="<tr>"+
                        "<td>"+novelEntity[i].novelName +"</td>"+
                        "<td>"+novelEntity[i].novelType +"</td>"+
                        "<td>"+
                        "<button class='btn btn-primary' onclick='noFinishNovelInfo("+novelId+")' data-toggle='modal' data-target='#novelModal'>"+"续载"+"</button>"+"&nbsp;"+
                        "<button class='btn btn-warning' onclick='readFinishNovel("+novelId+")'>"+"完结"+"</button>"+
                        "</td>"+
                        "</tr>";
                }
                $("#noNovelInfoList").html(str);
                $("#noNovel").css("display","none");
            }else {
                $("#noNovelInfoList").css("display","none");
                $("#noNovel").css("display","");
            }
        }
    })
}
/*点击已完结时的js代码*/
function finishNovel(mark){
    switchView(mark);
    $.ajax({
        type:"get",
        url:"/selectFinishNovelList",
        dataType:"json",
        success:function (novelEntity) {
            if(novelEntity.length>0){
                $("#isNovelInfoList").css("display","");
                var str="<tr style='font-weight: bold'>+<td>"+"小说名称"+"</td>+<td>"+"小说类型"+"</td>"+"<td>"+"功能"+"</td>"+"</tr>";
                for(var i=0;i<novelEntity.length;i++){
                    var novelId=novelEntity[i].id;
                    str+="<tr>"+
                        "<td>"+novelEntity[i].novelName +"</td>"+
                        "<td>"+novelEntity[i].novelType +"</td>"+
                        "<td>"+"<p style='display: none'>"+novelId+"</p>"+
                        "<button class='btn btn-primary' onclick='noFinishNovelInfo(this)' data-toggle='modal' data-target='#novelModal'>"+"查看详情"+"</button>"+"&nbsp;"+
                        "<button class='btn btn-warning' data-toggle='modal' data-target='#novelModal'>"+"完结"+"</button>"+
                        "</td>"+
                        "</tr>";
                }
                $("#isNovelInfoList").html(str);
                $("#isFinishNovelPic").css("display","none");
            }else {
                $("#isNovelInfoList").css("display","none");
                $("#isFinishNovelPic").css("display","");
            }
        }
    })
}
/*切换板块*/
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
function noFinishNovelInfo(novelId) {
    $("#novelId").attr("value",novelId);
    $.ajax({
        type:"post",
        url:"/selectNoFinishNovelInfoByNovelId",
        data:{"novelId":novelId},
        dataType:"json",
        success:function (novelEntity) {
            $("#novelModalLabel").html(novelEntity.novelName);
            var novelPic="/novel/"+novelEntity.novelFileName+"/"+novelEntity.novelPicName;
            $("#pic").attr('src',novelPic);
            var novelType="小说种类：";
            novelType+=novelEntity.novelType;
            $("#displayNovelType").html(novelType);
            var novelSummary="小说简介：<br>";
            var split = novelEntity.novelSummary.split("");
            for(var i=0;i<split.length;i++){
                if((i+1)%20==0){
                    split[i]+="<br>";
                }
                novelSummary+=split[i];
            }
           /*novelEntity.novelSummary;*/
            $("#displayNovelSummary").html(novelSummary);
        }
    })
}
/*点击完结时的js响应代码*/
function readFinishNovel(novelId) {
    $.ajax({
        type: "get",
        url: "/readFinishNovel",
        data: {"novelId": novelId},
        dataType: "json",
        success: function (mage) {
            alert(mage);
        }
    })
}
function uploadContinuedNovel() {
     var $continuedNovel = $("#continuedNovel")[0];
     var formData = new FormData($continuedNovel);
    $.ajax({
     type:"post",
     url:"/continuedNovel",
     data:formData,
     async: false,
     cache: false,
     contentType: false,
     processData: false
     })
}
