<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="../../css/main/zerogrid.css">
    <link rel="stylesheet" href="../../css/main/divStyle.css">
    <link rel="stylesheet" href="../../css/main/responsive.css">
    <link rel="stylesheet" href="../../css/main/login.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/paging/paging.js"></script>
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
<body ng-app="page_mail" ng-controller="paging" ng-init="service='/main'" onload="loadFoo()">
<!--------------Header--------------->
<header>
    <div style="margin-left: 1200px"><span style="color: red">${sessionScope.message}</span></div>
    <c:if test="${sessionScope.superUser==null}">
        <div class="log-inBox">

			<span >
		<a href="#" data-toggle="modal" data-target="#myModal">
			登录&nbsp;
		</a>
	</span>
            |
            <span>
		<a href="#">
			&nbsp;注册
		</a>
	</span>
        </div>
    </c:if>
    <c:if test="${sessionScope.superUser!=null}">
        <div class="log-inBox">
            <span style="margin-left: -50px">
			欢迎："<span style="color: red">${sessionScope.superUser.userName}</span>"
	</span>
            |
            <span>
		<a href="/logout">
			&nbsp;注销
		</a>
	</span>
        </div>
    </c:if>

    <!--<span style="margin-left: 90%;font: normal bold 15px 宋体">登录&nbsp;|&nbsp;注册</span>-->
    <div id="logo"><a href="#"><img src="./images/indexLogo.jpg"/></a></div>

    <div class="wrap-header zerogrid">
        <nav>
            <div class="wrap-nav">
                <div>
                    <form class="bs-example bs-example-form" role="form" style="width: 300px">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="请输入关键字">
                            <span class="input-group-addon">
								<button ng-click="includeMod='/html_main/search.html'" class="glyphicon glyphicon-search" style="width: 100%;height: 100%"></button>
							</span>
                        </div>
                    </form>
                </div>
            </div>
            <div style="clear: both"></div>
        </nav>
    </div>
    <div class="menu" style="width:100%">
        <ul>
            <li><a href="#">分类作品</a></li>
            <li><a href="#">全部作品</a></li>
            <li><a href="#">排行</a></li>
            <li><a href="#">完结</a></li>
            <li><a href="#">免费</a></li>
            <c:if test="${sessionScope.superUser.userType==1}">
                <li><a href="/admin/showApplication">管理</a></li>
            </c:if>
            <c:if test="${sessionScope.superUser.userType==2}">
                <li><a href="${pageContext.request.contextPath}/author/info">作者中心</a></li>
            </c:if>
            <c:if test="${sessionScope.superUser.userType==3}">
                <li><a href="/user/info">个人中心</a></li>
            </c:if>
            <!--这里新增一个浮动-->
            <div style="clear: both"></div>
        </ul>
    </div>
</header>
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >Website Template</a></div>

<!--------------Content--------------->
<section id="">
    <div class="wrap-content zerogrid">
        <div class="row block">
            <div id="main-content" class="col-2-3" ng-include="includeMod">
                <div class="wrap-col">
                    <article ng-repeat="novel in list">
                        <div class="heading">
                            <h2><a href="#" ng-click="showNovel(novel.id)">{{novel.novelName}}</a></h2>
                            <div class="info"><a href="#">{{novel.author.penName}}</a></div>
                        </div>
                        <div class="content">
                            <img src="images/timg.jpg" style="height: 300px;width: 300px"/>
                            <p>{{novel.novelSummary}}</p>
                            <p class="more"><a class="button" href="#">阅读小说</a></p>
                        </div>
                    </article>
                    <article>
                        <div style="margin-left: 150px">
                            <ul class="pagination">
                                <li style="{{pre}}"><a href="#" ng-click="paging(currentPage-1)">«</a></li>
                                <li style="{{one}}" class="{{oneClass}}"><a href="#" ng-click="paging(-1)">{{oneLi}}</a></li>
                                <li style="{{two}}" class="{{twoClass}}"><a ng-click="paging(-2)" href="#">{{twoLi}}</a></li>
                                <li style="{{three}}" class="{{threeClass}}"><a ng-click="paging(-3)" href="#">{{threeLi}}</a></li>
                                <li style="{{four}}" class="{{fourClass}}"><a ng-click="paging(-4)" href="#">{{fourLi}}</a></li>
                                <li style="{{five}}" class="{{fiveClass}}"><a ng-click="paging(-5)" href="#">{{fiveLi}}</a></li>
                                <li style="{{next}}"><a href="#" ng-click="paging(currentPage-0+1)">»</a></li>
                            </ul>
                        </div>
                    </article>
                </div>

            </div>

            <div id="sidebar" class="col-1-3">
                <div class="wrap-col">
                    <div class="box">
                        <div class="heading"><h2>免费办理信用卡</h2></div>
                        <div class="content">
                            <a href="http://www.cssmoban.com" target="_blank"><img src="images/banklogo.png" style="border:none;"/></a>
                            <p><a href="http://www.cssmoban.com" target="_blank" style="color: #DA251D;">光大银行</a>－阳光信用卡：喜欢，就不要等

                                招商银行－VISA MINI：爱怎么show，就怎么show
                                <a href="http://www.cssmoban.com" target="_blank" style="color: #DA251D;">招商银行</a>－百盛双币购物卡：刷出时尚生活，尽享时时刻刻
                                中国银行－中银信用卡：方寸之间，信用无限
                                招商银行－贝塔斯曼书友信用卡：让心灵在书香中升华
                                民生银行－民生信用卡：一卡平天下
                                招商银行－公务卡：纵横寰宇尊容备至，拓展无限商机
                                招商银行－携程旅行信用卡：携卡旅行，全程无忧
                                广东发展银行—广发商务卡：一切自在掌控
                                上海浦东发展银行—浦发信用卡：小财大用
                                广东发展银行－广发真情卡：真女人，真性情</p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="heading"><h2>小说分类</h2></div>
                        <div class="content">
                            <ul>
                                <li><a href="#">玄幻</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">言情</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">修真</a></li>
                                <li><a href="#">科幻</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">军事</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">校园</a></li>
                                <li><a href="#">武侠</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">悬疑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">科幻</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="box">
                        <div class="heading"><h2>小说排行</h2></div>
                        <div class="content">
                            <c:forEach items="${clickNovel}" var="novel">
                            <div class="post">
                                <img src="images/timg.jpg" style="width: 50px;height: 50px"/>
                                <h4><a href="#">${novel.novelName}</a></h4>
                                <p>鲜花量 ,${novel.novelClickRate}</p>
                            </div>
                        </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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
            <form action="/login" method="post">
                <h1>登录</h1>
                <div>
                    <input type="text" placeholder="用户名" required="" id="username" name="username" />
                </div>
                <div>
                    <input type="password" placeholder="密码" required="" id="password" name="password" />
                </div>
                <div style="margin-left: 36px">
                    <input placeholder="验证码" name="code" class="" style="border:1px solid #B9B9B9;width: 100px;height: 50px;float: left"/>
                    <div style="float: left">
                        <img src="/code.jpg" id="codeImg" style="height: 50px;width: 100px"><a href="#" onclick="flushCode()">看不清</a>
                    </div>
                </div>
                <div style="margin-top: 60px">
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
</body>
<script>
    function flushCode() {
        var number = Math.floor(Math.random()*1000+1);
        $("#codeImg").attr("src","/code.jpg?random="+number)
    }
</script>
</html>