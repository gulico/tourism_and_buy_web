<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/25
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="classes.mybean.data.Goods"%>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<jsp:useBean id="user" class="classes.mybean.data.Goods" scope="request"/>
<html>
<head>
    <title>新增商品</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <%@ include file ="wmshead2.txt"%>
</head>
<body>
<div id="rightContent" >
    <div class="data-div" style="padding-top: 60px">
        <div class="row clearfix">
            <div class="col-md-2 column">
            </div>
            <div class="col-md-4 column">
                <%String vec    = (String) request.getAttribute("num");%>

                <form class="form-horizontal" role="form" action="sevletGoodsAdd" method="post">
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"   name="num" value="<%=vec%>" readonly/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">第一天的行程</label>
                        <div class="col-sm-8">
                            <input type="" class="form-control"  name="d1_s"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第一天的伙食</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="d1_d" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第一天的酒店</label>
                        <div class="col-sm-8 " size=50>
                            <input type="text" class="form-control" name="d1_h" required/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">第二天的行程</label>
                        <div class="col-sm-8">
                            <input type="" class="form-control" name="d2_s"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第二天的伙食</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="d2_d"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第二天的酒店</label>
                        <div class="col-sm-8 " size=50>
                            <input type="text" class="form-control" name="d2_h" required/>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">第三天的行程</label>
                        <div class="col-sm-8">
                            <input type="" class="form-control" id="inputPassword3" name="d3_s" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第三天的伙食</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="d3_d"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第三天的酒店</label>
                        <div class="col-sm-8 " size=50>
                            <input type="text" class="form-control" name="d3_h" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">确认添加</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6 column">
                <%

                    if(user.getbackNews().length()==0){
                        System.out.println("无");
                    }
                    else{
                        System.out.println("有");
                        System.out.println(user.getbackNews()+"11111111111111");
                %>
                <p><jsp:getProperty name="user" property="backNews"/></p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
