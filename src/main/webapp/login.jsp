<%--
  Created by IntelliJ IDEA.
  User: celestial
  Date: 2022/7/22
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>云R记</title>
    <link href="static/css/login.css" rel="stylesheet" type="text/css" />
    <script src="static/js/jquery-1.11.3.js" type=text/javascript></script>
    <script src="static/js/config.js" type=text/javascript></script>
    <script src="static/js/util.js" type="text/javascript"></script>
    <script>
        window.onload = function(){
            if ("<%=request.getAttribute("Msg")%>"=="账号或密码错误")
            {
                $("#Msg").html("<%=request.getAttribute("Msg")%>");
            }
        }
    </script>


</head>
<body>
<!--head-->
<div id="head">
    <div class="top">
        <div class="fl yahei18">开启移动办公新时代！</div>
    </div>
</div>

<!--login box-->
<div class="wrapper">
    <div id="box">
        <div class="loginbar">用户登录</div>
        <div id="tabcon">
            <div class="box show">
                <form action="user" method="post" id="loginForm">
                <input type="text" class="user yahei16" id="UserName" name="userName" value="${userName}" placeholder="请输入账号" /><br /><br />
                <input type="password" class="pwd yahei16" id="UserPwd" name="userPwd" value="" placeholder="请输入密码" /><br /><br />
                <input name="rem" type="checkbox" value="1"  class="inputcheckbox"/> <label>记住我</label>&nbsp; &nbsp;<span id="Msg" style="color: red;font-size: 12px;"></span><br /><br />
                <input type="button" class="log jc yahei16" value="登 录" onclick="checkLogin()" />&nbsp; &nbsp; &nbsp; <input type="reset" value="取 消" class="reg jc yahei18" />
                </form>
            </div>
        </div>
    </div>
</div>

<div id="flash">
    <div class="pos">
        <a bgUrl="static/images/banner-bg1.jpg" id="flash1" style="display:block;"><img src="static/images/banner_pic1.png"></a>
        <a bgUrl="static/images/banner-bg2.jpg" id="flash2"                       ><img src="static/images/banner-pic2.jpg"></a>
    </div>
    <div class="flash_bar">
        <div class="dq" id="f1" onclick="changeflash(1)"></div>
        <div class="no" id="f2" onclick="changeflash(2)"></div>
    </div>
</div>

<!--bottom-->
<div id="bottom">
    <div id="copyright">
        <div class="quick">
            <ul>
                <li><input type="button" class="quickbd iphone" onclick="location.href='https://github.com/ouliang520/Cloud_diary'" /></li>
                <li><input type="button" class="quickbd android" onclick="location.href='https://github.com/ouliang520/Cloud_diary'" /></li>
                <li><input type="button" class="quickbd pc" onclick="location.href='https://github.com/ouliang520/Cloud_diary'" /></li>
                <div class="clr"></div>
            </ul>
            <div class="clr"></div>
        </div>
        <div class="text">
            Copyright © 2006-2026  <a href="https://github.com/ouliang520/Cloud_diary">星空云日记</a>  All Rights Reserved
        </div>
    </div>
</div>
</body>

</html>

