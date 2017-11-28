
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <title>登录</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <link href="css/bootstrap-popover-x.css" media="all" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-popover-x.js" type="text/javascript"></script>
    <%@include file="head.txt"%>
    <style>
    #footer {
    width: 100%;
    position: fixed;
    bottom: 0;
    }
    </style>
</head>

<body background="images/login/login_background.jpg" style="font-family: 微软雅黑">

<div class="container" >
    <div class="row clearfix" style="padding-top: 40px">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    账号登录 <small>会员名|密码登录</small>
                </h1>
            </div>
        </div>

    <div class="row clearfix" style="padding-top: 150px">
        <div class="blur-box">
            <div class="container-fluid d-flex justify-content-center align-items-center flex-column">
                <div class="col-md-7 column">
                </div>
                <div class="col-md-4 column">

                    <form class="form-horizontal" role="form" action="helpLogin" Method="post">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">账号</label>
                            <div class="col-sm-8">
                                <input type=text name ="logname" class="form-control" placeholder="用户名" id="inputEmail3"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-8">
                                <input type= password name="password"  class="form-control" placeholder="密码" id="inputPassword3"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-10">
                                <div class="checkbox">
                                    <label><input type="checkbox"/>记住我</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-10">

                                <button type="submit" class="btn btn-default">登入</button>
                                <button type="button" class="btn btn-default">注册</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
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
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>

</body>
</html>