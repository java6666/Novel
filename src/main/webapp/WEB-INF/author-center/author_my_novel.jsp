<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/4/12
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>

        <!-- Basic Page Needs
      ================================================== -->
        <meta charset="utf-8">
        <title>zBasicB001 我的小说</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/authorMyWorks.css">
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
        <script src="${pageContext.request.contextPath}/js/authorCenter/authorMyNovel.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
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
        <script src="${pageContext.request.contextPath}/js/html5.js"></script>
        <script src="${pageContext.request.contextPath}/js/css3-mediaqueries.js"></script>
        <![endif]-->

        <link href='${pageContext.request.contextPath}/images/favicon.ico' rel='icon' type='image/x-icon'/>
        <style rel="stylesheet">
            .search{font-size: 14px;color: #CCC;font-weight:bold; }
        </style>
    </head>
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
                        <li><a href="#" data-toggle="modal" data-target="#myModal">登录</a></li>
                        <li><a href="#">注册</a></li>
                        <li><a href="#">作者中心</a></li>
                        <li><a href="#">充值</a></li>
                        <li><a href="#">管理</a></li>
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
                    <img src="images/touxiang.jpg" style="height: 150px;width: 150px">
                </a>
            </div>
            <div style="margin-left:-15px;margin-top: 50px">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                        <div class="collapse navbar-collapse" id="example-navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">个人信息</a></li>
                                <li><a href="#">我的书架</a></li>
                                <li><a href="#">已购书籍</a></li>
                                <li><a href="#l">我的作品</a></li>
                                <li><a href="#" data-toggle="modal" data-target="#myModal3">更改密码</a></li>
                                <li><a href="#">消息 <span class="badge">3</span></a></li>
                                <li><a href="#" data-toggle="modal" data-target="#myModal2">联系我们</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="col-xs-offset-1 col-xs-8">
            <div style="height: 30px">
            </div>
            <div id="base">
                <ul>
                    <li class="color"><button type="button" name="sel" class="btn btn-info">未完结</button></li>
                    <li><button type="button" name="sel" class="btn btn-default">已完结</button></li>
                    <li><button type="button" name="sel" class="btn btn-default">创建新书</button></li>
                </ul>
                <hr/>
                <div id="boss-box">
                    <div id="tab-0" ><img src="${pageContext.request.contextPath}/images/noWorks.jpg" alt="" width="340px" height="420px"></div>
                    <div id="tab-1" class="none"><img src="${pageContext.request.contextPath}/images/noComplete.jpg" alt="" width="340px" height="420px"></div>
                    <div id="tab-2" class="none">
                        <div class="wrap-content zerogrid">
                            <div class="row block">
                                <div id="main-content" class="col-2-5">
                                    <form id="insertNewNovel" data-toggle="validator" role="form" enctype="multipart/form-data">
                                        <div class="form-group w3layouts w3 w3l">
                                            <label class="control-label">书名</label>
                                            <input name="novelName" type="text" class="form-control" id="novelName" placeholder="书 名" value="" onfocus="checkNovelName(1)" onblur="checkNovelName(2)"/>
                                            <div id="novelNameInfo" style="display: none;"></div>
                                        </div>
                                        <div class="form-group agileits w3layouts w3">
                                            <label class="control-label">类 型</label>
                                            <div id="novelType">
                                                <c:forEach items="${requestScope.typeName}" var="i" varStatus="index">
                                                    <c:if test="${index.count%7==0}">
                                                        <input type="checkbox" value="${i}"/> ${i}<br><br>
                                                    </c:if>
                                                    <c:if test="${index.count%7!=0}">
                                                        <input type="checkbox" value="${i}"/> ${i}&nbsp;
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <br/>
                                            <div id="novelTypeInfo">请选择以上种类，并点击下面“确认选择”按钮</div>
                                            <input type="hidden" class="form-control" name="novelTypeValue" value="">
                                            <button type="button" class="btn btn-info" name="novelType" onclick="checkNovelType(1)">确认选择</button>
                                        </div>
                                        <div>
                                            <label class="control-label">售价(元)，售价为正整数呦(●'◡'●)</label>
                                            <input type="text" class="form-control" id="novelPrice" name="novelPrice" value="0" onfocus="ckeckNovelPrice(1)" onblur="ckeckNovelPrice(2)"/>
                                            <div id="novelPriceINfo" style="display: none;"></div>
                                        </div>
                                        <div class="form-group agileits w3layouts w3">
                                            <label class="control-label">内 容 简 介</label>
                                            <textarea class="form-control" id="novelSummary" name="novelSummary" placeholder="内容简介" onfocus="checkBookSummary(1)" onblur="checkBookSummary(2)" style="width: 400px;height: 160px"></textarea>
                                            <div id="bookSummaryInfo" style="display: none;"></div>
                                        </div>
                                        <div class="form-group agileits w3layouts w3">
                                            <label class="control-label">上 传 封 面</label><br/>
                                            <input type="file" name="novelPhoto" id="attachment">
                                        </div>
                                        <div class="form-group">
                                            <input id="check_id" type="checkbox" onclick="foo()"> 同意小说网协议<br/><br/>
                                        </div>
                                    </form>
                                    <button onclick="sunmitInsertNewNovel()" type="submit" class="btn btn-lg" id="submit" disabled>Submit</button>
                                    <script>
                                        function sunmitInsertNewNovel() {
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
                                    </script>
                                    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
                                    <script src="${pageContext.request.contextPath}/js/validator.min.js"></script>
                                </div>
                            </div>
                        </div>
                    </div>
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
<!-- 模态框（Modal） -->
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
            <div>
                <form>
                    <div class="form-group"><label style="margin-left: 50px;margin-top: 28px">旧密码：</label>
                        <input type="password" class="form-control" style="width: 200px;float: right;margin-top: 20px;margin-right: 80px">
                    </div>
                    <div class="form-group"><label style="margin-left: 50px;margin-top: 28px">新密码：</label>
                        <input type="password" class="form-control" style="width: 200px;float: right;margin-top: 20px;margin-right: 80px">
                    </div>
                    <div class="form-group"><label style="margin-left: 45px;margin-top: 28px">重复密码：</label>
                        <input type="password" class="form-control" style="width: 200px;float: right;margin-top: 20px;margin-right: 80px">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">确认修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
