<%--
  Created by IntelliJ IDEA.
  User: jh
  Date: 2017/5/21
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="classes.mybean.data.Register"%>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<jsp:useBean id="user" class="classes.mybean.data.Register" scope="request"/>
<html>
<head>
    <title>新增用户</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <%@ include file ="wmshead.txt"%>
</head>
<body>
<div id="rightContent" >
    <div class="data-div" style="padding-top: 200px">
        <div class="row clearfix">
            <div class="col-md-2 column">
            </div>
            <div class="col-md-4 column">
                <form class="form-horizontal" role="form" action="sevletUsersAdd" method="post">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputEmail3"  name="logname" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputPassword3" name="password" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" >性别</label>
                        <div class="col-sm-2">
                            <label class="radio">
                                <input type="radio" name="sex" id="optionsRadios1" name="sex"value="male" checked>  男
                            </label>
                        </div>
                        <div class="col-sm-2">
                            <label class="radio">
                                <input type="radio" name="sex" id="optionsRadios2" name="sex" value="female">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">确认添加</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-1 column">

            </div>
            <div class="col-md-5 column">
                <%
                    if(user.getbackNews().length()==0){
                    }
                    else{
                %>
                <p><span style="color: #FF0000"><jsp:getProperty name="user" property="backNews"/></span></p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
