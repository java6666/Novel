<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>管理员子页面之所有用户</title>
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet" />
    <!-- Google	Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Nova+Flat' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->


</head>
<body>
    <div id="head">
        <div class="container">
            <div class="row">

                <div class="col-lg-4 col-md-4 col-sm-4">
                    <a href="index.html">
                    <img src="assets/img/logo.png"  />
                        </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 text-center" >
                     <img src="assets/img/top-mouse.png "  class="header-mid" />
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <h4><span>Call:</span> +01-4589-987-567</h4>
                    <h4><span>E-mail:</span> info@domain.com</h4>
                </div>
                
            </div>
        </div>
    </div>    
    <section id="main">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-9 col-sm-9 ">

                     <h3>所有用户<span class="label label-danger"> New : 5</span></h3>
                      <div class="hr-div"> <hr /></div>
                                                  <div class="table-responsive">
                               <c:if test="${requestScope.userEntities!=null}">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>用户编号</th>
                                            <th>用户名</th>
                                            <th>类型</th>
                                            <th>用户状态</th>
                                             <th>操作</th>
                                             <th>详细</th>

                                        </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${requestScope.userEntities}" var="item">
                                        <tr>
                                            <td>#${item.id}</td>
                                            <td>${item.userName}</td>
                                            <c:if test="${item.userType==1}">
                                                <td><i class="fa fa-user" ></i> <span class="label label-danger">管理员</span></td>
                                            </c:if>
                                            <c:if test="${item.userType==2}">
                                                <td><i class="fa fa-user" ></i> <span class="label label-success">作者</span></td>
                                            </c:if>
                                            <c:if test="${item.userType==3}">
                                                <td><i class="fa fa-user" ></i> <span class="label label-primary">普通用户</span></td>
                                            </c:if>
                                            <c:if test="${item.accountType==1}">
                                            <td><span class="label label-success">正常</span></td>
                                            </c:if>
                                            <c:if test="${item.accountType==2}">
                                                <td><span class="label label-danger">封停</span></td>
                                            </c:if>
                                            <c:if test="${item.accountType==3}">
                                                <td><span class="label label-default">删除</span></td>
                                            </c:if>
                                            <td><a href="#" class="label label-danger">删除 </a></td>
                                            <td><a id="showDetailsInfo" href="/admin/showUserDetails?id=${item.id}&userType=${item.userType}" class="label label-danger">点击查看用户详情 </a></td>

                                    </c:forEach>
                                    </tbody>
                                </table>
                               </c:if>
                                <table class="table table-striped table-bordered table-hover">
                                    <c:if test="${requestScope.userType==2}">
                                    <tr>
                                        <td>作者编号</td>
                                        <td>出生日期</td>
                                        <td>笔名</td>
                                        <td>籍贯</td>
                                        <td>作者简介</td>
                                        <td>申请为作者日期</td>
                                    </tr>
                                    <tr>
                                        <td>${requestScope.authorINfoDetails.userId}</td>
                                        <td>${requestScope.authorINfoDetails.birthDate}</td>
                                        <td>${requestScope.authorINfoDetails.penName}</td>
                                        <td>${requestScope.authorINfoDetails.birthAddress}</td>
                                        <td>${requestScope.authorINfoDetails.authorIntroduce}</td>
                                        <td>${requestScope.authorINfoDetails.createDate}</td>
                                    </tr>
                                    </c:if>
                                </table>
                            </div>
                    <ul class="pagination">
  <li class="disabled"><a href="#">&laquo;</a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <a href="index.html" class=" label label-danger"><strong>退出登录</strong> </a>
                    <div class="list-group">
                        <a href="管理员界面.html" class="list-group-item">管理主页</a>
                        <a href="管理员子页面_图书管理.html" class="list-group-item ">图书管理</a>
                        <a href="/admin/showApplication" class="list-group-item">处理申请</a>
                        <a href="/admin/showUsers" class="list-group-item active">所有用户</a>
                        <a href="管理员子页面_修改密码.html" class="list-group-item ">修改密码</a>
                        <a href="管理员子页面_通知管理.html" class="list-group-item">公告管理</a>

                    </div>
                    <div class="alert alert-danger text-center">
                        <h3>Import Information</h3>
                       Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                         Nulla pretium lectus vel justo iaculis blandit.  
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <div id="footer">
        <div class="container">

            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <h3>Physical Location</h3>
                    <p>
                        <i>Addresss :</i> 125/890 , New York Street,
                        <br />
                        United States of America (USA).
                         <br />
                       &copy; 2014 yourdomian | More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                   
                    </p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <h3>Get Quick Help</h3>
                    <h4><span>Call: </span>+01-4589-987-567</h4>
                    <h4><span>E-mail: </span>info@domain.com</h4>
                    <h4><span>Skype:</span> sonasup</h4>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">

                    <h3>Subscribe For Updates</h3>
                    <form>

                        <div class="form-group">
                            <input type="text" class="form-control" required="required" placeholder="Your Email" />
                        </div>


                        <div class="form-group">
                            <button type="submit" class="btn btn-danger">Click To Subscribe</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>

    </div>
    <!--  Jquery Core Script -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
    <!--  Core Bootstrap Script -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>

</body>
</html>
