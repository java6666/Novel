<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]>
<html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>
<html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>
<html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>zBasicB001 Free Html5 Responsive Template</title>
    <meta name="description"
          content="Free Html5 Templates and Free Responsive Themes Designed by Kimmy | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/datepicker.css" type="text/css"/>
   <%-- <link rel="stylesheet" media="screen" type="text/css" href="${pageContext.request.contextPath}/css/layout.css"/>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/eye.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/utils.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/layout.js?ver=1.0.2"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/zerogrid.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/authorCenter/authorInfo.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"
                 height="42" width="820"
                 alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/js/html5.js"></script>
    <script src="${pageContext.request.contextPath}/js/css3-mediaqueries.js"></script>
    <![endif]-->

    <link href='${pageContext.request.contextPath}/images/favicon.ico' rel='icon' type='image/x-icon'/>
    <style rel="stylesheet">
        .search {
            font-size: 14px;
            color: #CCC;
            font-weight: bold;
        }
        textarea{
            resize: none;
        }
    </style>
</head>
<body>
<!--------------Header--------------->
<header>
    <div class="wrap-header zerogrid">
        <div id="logo"><a href="#"><img src="${pageContext.request.contextPath}/images/indexLogo2.png"/></a></div>
        <nav>
            <div class="wrap-nav">
                <div class="menu">
                    <ul>
                        <li><a href="#">作者中心</a></li>
                        <li><a href="#">充值</a></li>
                        <li><a href="#">管理</a></li>&nbsp;&nbsp;
                        <li><a href="#"><span class="glyphicon glyphicon-off" style="color: red"></span>&nbsp;退出</a></li>
                    </ul>
                </div>
                <div>
                    <form>
                        <label class="search" style="float: left">搜索</label>
                        <div class="col-xs-10">

                            <input type="text" class="form-control" id="firstname" style="height: 25px;width: 200px"
                                   placeholder="请输入关键字">
                        </div>
                        <button class="btn btn-default btn-sm" style="float: right;margin-top: -25px;height: 25px">GO
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
</header>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/">Website Template</a></div>

<!--------------Content--------------->
<div class="wrap-content zerogrid">
    <div class="row">
        <div class="col-xs-2" style="height: 600px">
            <div style=" margin-left: -15px;height: 150px;width: 150px">
                <a>
                    <img src="${pageContext.request.contextPath}/${userInfo.headSculpturePath}" style="height: 150px;width: 150px">
                </a>
            </div>
            <div style="margin-left:-15px;margin-top: 50px">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="example-navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="${pageContext.request.contextPath}/author/info">个人信息</a></li>
                                <li><a href="${pageContext.request.contextPath}/author/collection">我的书架</a></li>
                                <li><a href="${pageContext.request.contextPath}/author/buy">已购书籍</a></li>
                                <li><a href="${pageContext.request.contextPath}/newNovel">我的作品</a></li>
                                <li><a href="${pageContext.request.contextPath}/author/mail">消息 <span class="badge">${sessionScope.mailCount}</span></a></li>
                                <li><a href="#" data-toggle="modal" data-target="#myModal3">更改密码</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#myModal2">联系我们</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div id="message" class="col-xs-offset-1 col-xs-6" style="margin-top: -15px">
            <h3>个人信息</h3>
            <hr/>
            <form action="/author/update" method="post" enctype="multipart/form-data">
                <div class="form-group" style="width: 300px">
                    <label>真实姓名：</label>
                    <i>${requestScope.userInfo.realName}</i>
                    <input type="text" name="realName" class="form-control" style="display:none;" value="${requestScope.userInfo.realName}">
                </div>
                <div class="form-group" style="width: 300px">
                    <label>笔名：</label>
                    <i>${requestScope.author.penName}</i>
                    <input type="text" name="penName" class="form-control" style="display:none;" value="${requestScope.author.penName}" disabled="disabled">
                </div>
                <div class="form-group">
                    <label>性别：</label>
                    <i>${requestScope.userInfo.gender}</i>
                    <div id="gender" style="display: none">
                    <input name="sex" type="radio" value="true" checked="checked">&nbsp;男&nbsp;&nbsp;
                    <input name="sex" type="radio" value="false">女
                    </div>
                </div>
                <div class="form-group" style="width: 300px">
                    <label>电话：</label>
                    <i>${requestScope.userInfo.phone}</i>
                    <input type="text" name="phone" class="form-control" style="display:none;" value="${requestScope.userInfo.phone}"/>
                </div>
                <div class="form-group" style="width: 300px">
                    <label>出生日期:</label>
                    <i><f:formatDate value="${requestScope.author.birthDate}" pattern="yyyy-MM-dd"/> </i><br/>
                    <input class="inputDate" name="birthday" id="inputDate"  value="1993-12-01" style="display: none"/>
                </div>
                <div class="form-group" style="width: 300px">
                    <label>出生地址：</label>
                    <i>${requestScope.author.birthAddress}</i>
                    <input type="text" name="birthplace" class="form-control" style="display: none" value="${requestScope.author.birthAddress}">
                </div>
                <div class="form-group" style="width: 300px">
                    <label>作者简介：</label>
                    <i>只创良心作品</i>
                    <textarea  id="t1" type="text" name="introduction" class="form-control" style="height: 50px;display: none"></textarea>
                </div>
                <script>
                    document.getElementById("t1").value="${requestScope.author.authorIntroduce}"
                </script>
                <div id="photo" class="form-group" style="display:none;">
                    <label>头像：</label>
                    <input type="file" name="alice" id="attachment" style="display: none" onchange="jQuery('#path').val(jQuery('#attachment').val())">
                    <input type="button" class="btn btn-default" value="上传头像" onclick="jQuery('#attachment').click()">
                </div>
                <div class="form-group" style="width: 300px">
                    <label>余额（金币）：</label>
                    <i>${requestScope.userInfo.money}</i>
                    <input readonly="true" name="balance" type="text" value="${requestScope.userInfo.money}" class="form-control" style="display:none">
                </div>
                <button type="button" class="btn btn-info" onclick="change(this)">修改信息</button>
                <button type="submit" id="right" class="btn btn-primary" style="display: none">确认修改</button>
                <a href="${pageContext.request.contextPath}/author/info">
                    <button type="button" class="btn btn-danger" style="display: none" id="drop">取消修改</button>
                </a>
            </form>
        </div>
    </div>
</div>
<!--------------Footer--------------->
<footer>
    <div class="wrap-footer zerogrid">
        <div class="row">
            <div class="col-1-3">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>小说网重要声明</h2></div>
                        <div class="content">
                            <p>本网站为网友写作提供上传空间储存平台，请上传有合法版权的作品，如发现本站有侵犯权利人版权内容的，请向本站投诉，投诉邮箱：tousu@hongxiu.com
                                一经核实，本站将立即删除相关作品并对上传人作封号处理。</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2-3">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>Novel network important declaration</h2></div>
                        <div class="content">
                            <p>This website to provide online writing upload space storage platform, please upload have
                                legitimate copyright works, if any infringement of the right holder of copyright content
                                found on this site, please complain to the site, the complaint email: tousu@hongxiu.com
                                upon verification, the site will be deleted immediately descendants on the related works
                                and titles processing.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <p>Copyright © 2012 - <a href="http://www.cssmoban.com" target="_blank">Free Basic Html5 Templates</a> by
            Zerotheme.com</p>
    </div>
</footer>


<!-- 模态框（Modal） -->
<<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="container" style="margin-top: 130px">
        <section id="content">
            <form action="">
                <h1>登录</h1>
                <div>
                    <input type="text" placeholder="用户名" required="" id="username" />
                </div>
                <div>
                    <input type="password" placeholder="密码" required="" id="password" />
                </div>
                <div>
                    <input type="submit" value="Log in" />
                    <a href="#">Lost your password?</a>
                    <a href="#">Register</a>
                </div>
            </form><!-- form -->
            <div class="button">
                <a href="#">Download source file</a>
            </div><!-- button -->
        </section><!-- content -->
    </div><!-- container -->
</div>
<%--模态框--%>
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 300px;text-align: center;margin-top: 150px;margin-left: 170px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    联系方式
                </h4>
            </div>
            <div class="modal-body">
                <h3>
                    021-88888888
                </h3>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
    <div class="modal-dialog" style="width: 400px;margin-top: 100px">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #2e6da4;height: 70px">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2" style="color: white;text-align: center">密码修改</h4>
            </div>
            <form action="/author/updatePassword" method="post">
                <div>
                    <div class="form-group"><label style="margin-left: 50px;margin-top: 28px">旧密码：</label>
                        <input type="password" name="oldPassword" class="form-control" style="width: 200px;float: right;margin-top: 20px;margin-right: 80px">
                    </div>
                    <div class="form-group"><label style="margin-left: 50px;margin-top: 28px">新密码：</label>
                        <input type="password" name="newPassword" class="form-control" style="width: 200px;float: right;margin-top: 20px;margin-right: 80px">
                    </div>
                    <div class="form-group"><label style="margin-left: 45px;margin-top: 28px">重复密码：</label>
                        <input type="password" class="form-control" style="width: 200px;float: right;margin-top: 20px;margin-right: 80px">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">确认修改</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-body" style="margin-top: 230px;margin-left: 200px">
            <img src="${pageContext.request.contextPath}/images/finish.jpg">
        </div>
    </div><!-- /.modal -->
</div>
<script>
    function foo(name, id) {
        var h = document.getElementById("myModalLabel3");
        h.innerHTML=name;
        var modalId = document.getElementById("modalId");
        modalId.value=id;
    }
</script>
${modal}
</body>
</html>