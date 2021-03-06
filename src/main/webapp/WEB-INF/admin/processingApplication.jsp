﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>管理员子页面之申请处理</title>
    <!-- BOOTSTRAP CORE STYLE CSS -->
    <link href="../../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME CSS -->
    <link href="../../assets/css/font-awesome.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="../../assets/css/style.css" rel="stylesheet" />
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
                    <img src="../../assets/img/logo.png"  />
                </a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 text-center" >
                <img src="../../assets/img/top-mouse.png " class="header-mid" />
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

                <h3>所有申请<span class="label label-danger"> New : ${requestScope.emailCount}</span></h3>
                <div class="hr-div"> <hr /></div>
                <div class="table-responsive">


                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>

                            <th>邮件编号</th>
                            <th>发送人</th>
                            <th>发送内容</th>
                            <th>发送时间</th>
                            <th>操作</th>
                            <th>操作</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${requestScope.emailBoxes}" var="item">
                            <tr>
                                <td>#${item.id}</td>
                                <td> <i class="fa fa-user" ></i> <span class="label label-danger">${item.addressee.userName}</span></td>
                                <td>${item.content}</td>
                                <td><span class="label label-info">${item.createDate}</span></td>
                                <td>暂无</td>
                                <c:if test="${requestScope.mailType==2}">
                                <td><a href="/admin/applicationApproved?addresseeId=${item.addresseeId}&id=${item.id}" class="label label-info">通过 </a></td>
                                <td><a href="/admin/rejectTheRequest?addresseeId=${item.addresseeId}&id=${item.id}" class="label label-danger">驳回 </a></td>
                                </c:if>
                                <c:if test="${requestScope.mailType==1}">
                                    <td><a href="/admin/applicationApproved?addresseeId=${item.addresseeId}&id=${item.id}" class="label label-info">回复 </a></td>
                                    <td><a href="/admin/rejectTheRequest?addresseeId=${item.addresseeId}&id=${item.id}" class="label label-danger">删除</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>


                    <%--<c:if test="${requestScope.consumerEmailBoxesSize!=0||requestScope.consumerEmailBoxesSize!=null}">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>用户编号</th>
                                <th>用户名</th>
                                <th>用户类型</th>
                                <th>用户状态</th>
                                <th>操作</th>
                                <th>操作</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${requestScope.consumerEmailBoxesemailBoxes}" var="item">
                                <tr>
                                    <td>#${item.id}</td>
                                    <td> <i class="fa fa-user" ></i> <span class="label label-danger">${item.addressee.userName}</span></td>

                                    <c:if test="${item.userType==1}">
                                        <td><i class="fa fa-user" ></i> <span class="label label-danger">管理员</span></td>
                                    </c:if>
                                    <c:if test="${item.userType==2}">
                                        <td><i class="fa fa-user" ></i> <span class="label label-primary">作者</span></td>
                                    </c:if>
                                    <c:if test="${item.userType==3}">
                                        <td><i class="fa fa-user" ></i> <span class="label label-default">用户</span></td>
                                    </c:if>
                                    <c:if test="${item.accountType==1}">
                                    <td>正常</td>
                                    </c:if>
                                    <c:if test="${item.accountType==2}">
                                        <td>封停</td>
                                    </c:if>
                                    <c:if test="${item.accountType==3}">
                                        <td>删除</td>
                                    </c:if>
                                    <td>暂无</td>
                                    <td><a href="/admin/applicationApproved?addresseeId=${item.addresseeId}&id=${item.id}" class="label label-info">回复</a></td>
                                    <td><a href="/admin/rejectTheRequest?addresseeId=${item.addresseeId}&id=${item.id}" class="label label-danger">删除</a></td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </c:if>--%>



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

                    <a href="/admin/generalInformation" class="list-group-item ">普通消息</a>
                    <a href="/admin/showApplication" class="list-group-item active ">作者申请</a>
                    <a href="管理员子页面_处理申请.html" class="list-group-item ">评论举报</a>

                    <a href="/admin/showUsers" class="list-group-item">所有用户</a>
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
<script src="../../assets/js/jquery-1.10.2.js"></script>
<!--  Core Bootstrap Script -->
<script src="../../assets/js/bootstrap.js"></script>

</body>
</html>
