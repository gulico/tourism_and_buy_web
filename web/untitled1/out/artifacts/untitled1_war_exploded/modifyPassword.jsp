<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/29
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改密码</title>

    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%@ include file="head.txt"%>
    <style type="text/css">
        body{/*背景*/
            background-image: url("images/changePassword/modifyPassword_background.jpg");
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
<body>


<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column" style="padding-top: 240px; padding-left: 300px">
            <form class="form-horizontal" role="form" action="helpModifyPassword" method="post">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">初始密码</label>
                    <div class="col-sm-4">
                        <input type=password name="oldPassword" class="form-control" id="inputEmail3" />
                    </div>
                </div>


                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">新的密码</label>
                    <div class="col-sm-4">
                        <input type=password name="newPassword" class="form-control" id="inputPassword3" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">提交</button>
                    </div>
                </div>

            </form>
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

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>
</body>
</html>