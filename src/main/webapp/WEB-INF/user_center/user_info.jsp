<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/11
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>zBasicB001 Free Html5 Responsive Template</title>
    <meta name="description" content="Free Html5 Templates and Free Responsive Themes Designed by Kimmy | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/zerogrid.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/login.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->

    <link href='./images/favicon.ico' rel='icon' type='image/x-icon'/>
    <style rel="stylesheet">
        .search{font-size: 14px;color: #CCC;font-weight:bold; }
    </style>
</head>
<body>
<!--------------Header--------------->
<header>
    <div class="wrap-header zerogrid">
        <div id="logo">
            <a href="#"><img src="${pageContext.request.contextPath}/images/indexLogo2.png"/></a>
        </div>
        <nav>
            <div class="wrap-nav">
                <div class="menu">
                    <ul>
                        <li><a href="/main">首页</a></li>
                        <li><a href="/ranking">排行</a></li>
                        <li><a href="/user/pay">充值</a></li>
                        <li><a href="/user/info">个人中心</a></li>
                        <li><a href="/logout"><span class="glyphicon glyphicon-off" style="color: red"></span>退出</a></li>
                    </ul>
                </div>
                <div>
                    <form>
                        <label class="search" style="float: left">搜索</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="firstname" style="height: 25px;width: 200px"
                                   placeholder="请输入关键字">
                        </div>
                        <button class="btn btn-default btn-sm" style="float: right;margin-top: -25px;height: 25px">GO</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
</header>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >Website Template</a></div>

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
                                <li class="active"><a href="/user/info">个人信息</a></li>
                                <li><a href="/user/collection">我的书架</a></li>
                                <li><a href="/user/buy">已购书籍</a></li>
                                <li><a href="/user/showUpAuthor">升级作者</a></li>
                                <li><a href="/user/mail">消息 <span class="badge" style="background-color: #23527c">${sessionScope.mailCount}</span></a></li>
                                <li><a href="#" data-toggle="modal" data-target="#myModal3">更改密码</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#myModal2">联系我们</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="col-xs-offset-1 col-xs-6">
            <div class="col-xs-offset-1 col-xs-9" style="height: 50px">
            </div>
            <div class="col-xs-offset-1 col-xs-9" style="height: 100px">
                <h3>个人信息</h3>
                <hr/>
            </div>
            <form action="/user/updateInfo" method="post" enctype="multipart/form-data">
            <div class="form-group" style="width: 300px">
                <input type="hidden" value="${requestScope.userInfo.userId}" name="userId">
                <label>真实姓名</label>
                <input type="text" class="form-control" name="name" value="${requestScope.userInfo.realName}">
            </div>
            <div class="form-group" style="width: 300px">
                <label>电话</label>
                <input type="text" class="form-control" name="phone" value="${requestScope.userInfo.phone}">
            </div>
            <div class="form-group" style="width: 300px">
                <label>余额（金币）</label>
                <input readonly="true" type="text"  name="money" value="${requestScope.userInfo.money}" class="form-control">
            </div>
            <div class="form-group">
                <label>性别</label>
                <select class="form-control" style="width: 300px" name="sex">
                    <c:if test="${requestScope.userInfo.gender==true}">
                        <option value ="false">女</option>
                        <option value ="true" selected="selected">男</option>
                    </c:if>
                    <c:if test="${requestScope.userInfo.gender==false}">
                        <option value ="false" selected="selected">女</option>
                        <option value ="true">男</option>
                    </c:if>
                </select>
            </div>
            <div class="form-group">
                <label>头像</label>
                <input type="file" name="alice">
                <p class="help-block">上传头像</p>
            </div>
            <button type="submit" class="btn btn-default">保存</button>
            </form>
        </div>
        <div class="col-xs-3">
            <div class="col-xs-offset-1 col-xs-9" style="height: 50px">
            </div>
            <div class="col-xs-3" style="height: 600px">

                <div style=" margin-left: -15px;height: 600px;width: 350px">
                    <a>
                        <img src="${pageContext.request.contextPath}/images/feifei.jpg" style="height: 600px;width: 350px">
                    </a>
                </div>
            </div>
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
                            <p>本网站为网友写作提供上传空间储存平台，请上传有合法版权的作品，如发现本站有侵犯权利人版权内容的，请向本站投诉，投诉邮箱：tousu@hongxiu.com 一经核实，本站将立即删除相关作品并对上传人作封号处理。</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2-3">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>Novel network important declaration</h2></div>
                        <div class="content">
                            <p>This website to provide online writing upload space storage platform, please upload have legitimate copyright works, if any infringement of the right holder of copyright content found on this site, please complain to the site, the complaint email: tousu@hongxiu.com upon verification, the site will be deleted immediately descendants on the related works and titles processing.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright">
        <p>Copyright © 2012 - <a href="http://www.cssmoban.com" target="_blank">Free Basic Html5 Templates</a> by Zerotheme.com</p>
    </div>
</footer>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <form action="/user/updatePassword" method="post">
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
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-body" style="margin-top: 200px">
            <img src="${pageContext.request.contextPath}/images/success.png" style="height: 180px;width: 880px">
        </div>
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-body" style="margin-top: 200px">
            <img src="${pageContext.request.contextPath}/images/password_error.png" style="height: 180px;width: 880px">
        </div>
    </div><!-- /.modal -->
</div>
${modal}
</body></html>