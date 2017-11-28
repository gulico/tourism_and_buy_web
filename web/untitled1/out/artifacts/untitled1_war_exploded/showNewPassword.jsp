<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/29
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.mybean.data.Password" %>
<jsp:useBean id="password" type="classes.mybean.data.Password" scope="request"/>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<html>
<head>
    <title>修改密码信息反馈</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%@ include file="head.txt"%>
    <%
        String bk;
        if(password.getBackNews().equals("密码更新成功")){
            bk="images/changePassword/showNewPassword_background.png";
        }
        else{
            bk="images/changePassword/showNewPassword_fail_background.png";
        }
    %>
    <style type="text/css">
        body{/*背景*/
            background-image: url("<%=bk %>");
            background-repeat:no-repeat;/*禁止平铺*/
            background-position:0px 50px;/*上下左右居中*/
            font-family: 微软雅黑;
            margin: 0;
        }
        #footer {
            width: 100%;
            position: fixed;
            bottom: 0;
        }
    </style>
</head>
<body class="container">
<!--<br><jsp:getProperty name="password" property="backNews" />-->
<!--<br>您的新密码:<jsp:getProperty name="password" property="newPassword" />-->
<!--<br>您的旧密码:<jsp:getProperty name="password" property="oldPassword" />-->
<div id="footer"class="row clearfix" style="padding-bottom: 0px">
    <br>
    <div class="col-md-4 column">
    </div>
    <div class="col-md-4 column" style="font-size: 10px;text-align: center;color: white">
        <p>copyright? 2016-2017 浙江A&F信息工程学院版权所有  </p>
        <p>经营许可证：苏A2-20110026 苏ICP备11017770号</p>
        <p style="font-size: 8px">联系我们 | 767293861@qq.com | 752261488</p>
    </div>
    <div class="col-md-4 column">
    </div>
</div>
</body>
</html>
