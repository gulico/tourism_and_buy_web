<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/17
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="classes.mybean.data.Login"%>
<jsp:useBean id="login" type="classes.mybean.data.Login" scope="session"/>
<head>
    <meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录提示</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src='js/checkinputRegister.js'></script>
    <%
        boolean success=false;
        String bk="";
        if(login.getSuccess())
        {
            success=true;
            bk="images/login/login_success .png";
        }
        else{
            success=false;
            bk="images/login/login_error.png";
        }
    %>
    <style type="text/css">
        body{/*背景*/
            background-image: url("<%=bk %>");
            background-repeat:no-repeat;/*禁止平铺*/
            background-position:350px 130px;/*上下左右居中*/
            font-family: 微软雅黑;
            margin: 0;
        }
        #footer {
            width: 100%;
            position: fixed;
            bottom: 0;
        }
    </style>
    <%@include file="head.txt"%>
</head>
<HTML><BODY>
    <br>
    <br>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1>
                        <jsp:getProperty name="login"  property="backNews"/>
                    </h1>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <%
                if(success){
            %>
            <div class="col-md-4 column">
            </div>
            <div class="col-md-4 column" style="padding-top: 130px">
                <table class="table table-condensed table-hover">
                    <thead>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            登录会员名称:
                        </td>
                        <td><jsp:getProperty name="login" property="logname"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-4 column">
            </div>
            <%
                }
            %>

        </div>
    </div>
    </div>

<script language="javascript" type="text/javascript">
    <%
    if(success){
        %>
    setTimeout("javascript:location.href='index.jsp'", 1500);
    <%
        }
        else{
     %>
    setTimeout("javascript:location.href='login.jsp'", 1500);
    <%
    }
    %>
</script>
</BODY></HTML>

