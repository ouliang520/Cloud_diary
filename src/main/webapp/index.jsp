<%--
  Created by IntelliJ IDEA.
  User: celestial
  Date: 2022/7/23
  Time: 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>云R记</title>
    <link href="static/css/note.css" rel="stylesheet">
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="static/sweetalert/sweetalert2.min.css" rel="stylesheet">
    <script src="static/js/jquery-1.11.3.js"></script>
    <script src="static/bootstrap/js/bootstrap.js"></script>
    <script src="static/sweetalert/sweetalert2.min.js"></script>
    <script src="static/js/util.js" type="text/javascript"></script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="static/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="static/ueditor/ueditor.all.js"></script>
    <style type="text/css">
        body {
            padding-top: 60px;
            padding-bottom: 40px;
            background: url(static/images/bg.gif) repeat;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="font-size:25px" href="main">云日记</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li
                        <c:if test="${changePage =='static/info/list.jsp'}">class="active"</c:if> ><a href="main"><i
                        class="glyphicon glyphicon-cloud"></i>&nbsp;主&nbsp;&nbsp;页</a></li>
                <li
                        <c:if test="${changePage =='static/info/add.jsp'}">class="active"</c:if> ><a href="/change/addNode"><i
                        class="glyphicon glyphicon-pencil"></i>&nbsp;发表云记</a></li>
                <li
                        <c:if test="${changePage =='static/info/type.jsp'}">class="active"</c:if> ><a href="type"><i
                        class="glyphicon glyphicon-list"></i>&nbsp;类别管理</a></li>
                <li
                        <c:if test="${changePage =='static/info/personal.jsp'}">class="active"</c:if> ><a
                        href="personal"><i class="glyphicon glyphicon-user"></i>&nbsp;个人中心</a></li>
                r
                <li
                        <c:if test="${changePage =='static/info/report.jsp'}">class="active"</c:if> ><a href="report"><i
                        class="glyphicon glyphicon-signal"></i>&nbsp;数据报表</a></li>

            </ul>
            <form class="navbar-form navbar-right" role="search" action="/main/dim">
                <div class="form-group">
                    <input type="hidden" name="act" value="searchKey">
                    <input type="text" name="dim" class="form-control" id="dim" placeholder="搜索云记">
                </div>
                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row-fluid">
        <div class="col-md-3">
            <div class="data_list">
                <div class="data_list_title"><span class="glyphicon glyphicon-user"></span>&nbsp;个人中心&nbsp;&nbsp;&nbsp;&nbsp;<a
                        href="logout">退出</a></div>
                <div class="userimg">
                    <img src="static/images/${user.head}">
                </div>
                <div class="nick">${user.nick}</div>
                <div class="mood">(${user.mood})</div>
            </div>
            <div class="data_list">
                <div class="data_list_title">
					<span class="glyphicon glyphicon-calendar">
					</span>&nbsp;云记日期
                </div>

                <div>
                    <ul class="nav nav-pills nav-stacked">

                        <li>
                            <a href="main?act=searchDate&amp;val=2016%E5%B9%B408%E6%9C%88&amp;valStr=2016%E5%B9%B408%E6%9C%88">2016年08月
                                <span class="badge">24</span></a></li>

                        <li>
                            <a href="main?act=searchDate&amp;val=2016%E5%B9%B407%E6%9C%88&amp;valStr=2016%E5%B9%B407%E6%9C%88">2016年07月
                                <span class="badge">1</span></a></li>

                        <li>
                            <a href="main?act=searchDate&amp;val=2016%E5%B9%B406%E6%9C%88&amp;valStr=2016%E5%B9%B406%E6%9C%88">2016年06月
                                <span class="badge">1</span></a></li>

                    </ul>
                </div>

            </div>
            <div class="data_list">
                <div class="data_list_title">
					<span class="glyphicon glyphicon-list-alt">
					</span>&nbsp;云记类别
                </div>

                <div>
                    <ul class="nav nav-pills nav-stacked">

                        <li><a href="main?act=searchType&amp;val=5&amp;valStr=test">test <span
                                class="badge">0</span></a></li>

                        <li>
                            <a href="main?act=searchType&amp;val=3&amp;valStr=%E5%B0%9A%E5%AD%A6%E5%A0%82%E7%AC%94%E8%AE%B0">笔记
                                <span class="badge">12</span></a></li>

                        <li><a href="main?act=searchType&amp;val=2&amp;valStr=%E6%8A%80%E6%9C%AF">技术 <span
                                class="badge">5</span></a></li>

                        <li><a href="main?act=searchType&amp;val=4&amp;valStr=%E8%80%81%E8%A3%B4%E8%AF%AD%E5%BD%95">语录
                            <span class="badge">9</span></a></li>

                    </ul>
                </div>

            </div>
        </div>
    </div>
    <!--云记列表-->
    <%--    <jsp:include page="static/info/list.jsp"></jsp:include>--%>
    <!--个人中心-->
    <%--    <jsp:include page="static/info/personal.jsp"></jsp:include>--%>
    <!--类型列表-->
    <%--    <jsp:include page="static/info/type.jsp"></jsp:include>--%>
    <!--看查云记-->
    <%--    <jsp:include page="static/info/read.jsp"></jsp:include>--%>
    <!--修改云记-->
    <%--    <jsp:include page="static/info/change.jsp"></jsp:include>--%>
    <c:if test="${empty changePage}">
        <jsp:include page="info/list.jsp"></jsp:include>
    </c:if>
    <c:if test="${!empty changePage}">
        <jsp:include page="${changePage}"></jsp:include>
    </c:if>

</div>

</body>
</html>
