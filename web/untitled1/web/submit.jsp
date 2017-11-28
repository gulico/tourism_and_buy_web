<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <title>留言板</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <%@ include file="head.txt"%>
    <style>
        body{/*背景*/
            background-image:url(images/submit/submit_background%20.jpg);/*来源*/
            background-repeat:no-repeat;/*禁止平铺*/
            background-position:0px 50px;/*上下左右居中*/
            font-family: 微软雅黑;
        }
        #footer {
            width: 100%;
            position: fixed;
            bottom: 0;
        }
    </style>
</head>
<body >

<div class="container">
    <div class="row clearfix" style="padding-top: 80px">
        <div class="col-md-12 column">
            <form class="form-horizontal" action="messagePane.jsp" method="post" name="form">

                <div class="form-group">
                    <label  class="col-sm-2 control-label">输入名字：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control"  name="peopleName" />
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">留言标题：</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="title"/>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label">留言：</label>

                </div>
                <div class="form-group">
                <div class="col-sm-5" style="padding-left: 210px">
                        <textArea class="form-control" name="messages" rows="5" cols=26
                                  wrap="physical"></textArea>
                </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10" style="padding-left: 60px">
                        <button type="submit" class="btn btn-default" value="提交" name="submit">提交</button>
                        <br><br><a href="showMessage.jsp" style="color: white">查看留言板</a>
                </div>
                </div>
            </form>

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
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>