<%--
  Created by IntelliJ IDEA.
  User: wxy
  Date: 2017/4/18
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.Exception.*" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <title>度假购票</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/bootstrap.min.css"/>
    <script  type="text/javascript" src="./js/jquery.min.js"></script>
    <script  type="text/javascript" src="./js/bootstrap.min.js"></script>
    <link href="css/bootstrap-popover-x.css" media="all" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-popover-x.js" type="text/javascript"></script>
    <%@include file="head.txt"%>
    <style type="text/css">
        a.home {background:url(images/Travel/pishow_japan.jpg) no-repeat; width:200px; height:123px; display:inline-block;_float:left;}
        a.home:hover {background:url(images/Travel/pishow_japan_.jpg) no-repeat;}
        a.show2{background:url(images/Travel/picshow_youcai.jpg) no-repeat; width:200px; height:123px; display:inline-block;_float:left;}
        a.show2:hover{background:url(images/Travel/picshow_youcai_.jpg) no-repeat;}
        a.show3{background:url(images/Travel/picshow_4.jpg) no-repeat; width:200px; height:123px; display:inline-block;_float:left;}
        a.show3:hover{background:url(images/Travel/picshow_4_.jpg) no-repeat;}
    </style>
</head>
<body class="container" style="font-family: 微软雅黑;" background="images/Travel/backgroud.jpg">
<br>
<br>
    <div class="row clearfix" style="padding-top: 60px">
        <div class="col-md-3 column">

            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver" );// 加载驱动程序以连接数据库
                }
                catch(Exception e){}
                String url = "jdbc:mysql://localhost:3306/webdata?charact/erEncoding=UTF-8";
                String username = "root";
                String SQLpassword = "123123";
                Connection con = null;
                Statement sql = null;
                ResultSet rs = null;
                try{
                    con = DriverManager.getConnection( url ,username, SQLpassword); //必须抛出错误
                    sql = con.createStatement();
                    rs = sql.executeQuery("SELECT*FROM classify");
            %>
            <form action = "helpqueryServlet" method = post name=form role="form" >
                <table>
                    <tr>
                        <td>
                <select name ="fenleiNumber" class="input-md form-control">
                    <%
                        while(rs.next()){
                            int id = rs.getInt(1);
                            String name = rs.getString(2);
                    %>
                    <option value=<%=id %>><%=name %>
                            <%
                    }%>
                </select>
                        </td>
                        <td>
                <input type="submit" value="提交"  class="btn btn-default btn-info">
                        </td>
                    </tr>
                </table>
            </form>
            <%
                    con.close();
                }
                catch (Exception e){
                }
            %>
            <br>
            <div class="panel-group" id="panel-893088">
                <div class="panel panel-default">
                    <div class="panel-heading" style="text-align: center">
                        <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-893088" href="#panel-element-269601">
                            <span class="glyphicon glyphicon-home"></span>国内游
                        </a>
                    </div>
                    <div id="panel-element-269601" class="panel-collapse collapse">
                        <div class="panel-body">
                            <img src="images/Travel/qingdao.jpg">
                            <span class="label label-default">青岛</span>
                            <br>
                            <img src="images/Travel/xiamen.jpg">
                            <span class="label label-default">厦门</span>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading"  style="text-align: center">
                        <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-893088" href="#panel-element-113810">
                            <span class="glyphicon glyphicon-globe"></span>国外游
                        </a>
                    </div>
                    <div id="panel-element-113810" class="panel-collapse collapse">
                        <div class="panel-body">
                            <img src="images/Travel/japen.jpg">
                            <span class="label label-default">日本</span>
                            <br>
                            <img src="images/Travel/puji.jpg">
                            <span class="label label-default">普吉岛</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 column">
            <form action="searchByConditionServlet" method="post">
            <div class="col-sm-5">
                <input type="text" class="form-control"  name = "searchMess" required/>
            </div>
            <div class="col-sm-3">
                <div class="btn-group" >
                    <select name="radio" class="input-md form-control">
                        <option  selected value="name">目的地
                        <option value="from">始发地
                        <option value="num">产品编号
                        <option value="price">价格区间
                    </select>
                </div>
            </div>
                <div class="col-sm-1">
                    <button type="submit" class="btn btn-default btn-info" name = "g" >搜索</button>
                </div>
            </form>
            <div  class="col-sm-2"><!--高级搜索，遮罩窗体-->
                <a id="modal-215619" href="#modal-container-215619" role="button" class="btn" data-toggle="modal">高级搜索</a>
                <div class="modal fade" id="modal-container-215619" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-body"><!--内容-->
                                <form action="advancedSearchByConditionServlet" class="form-horizontal" role="form" method="post">
                                    <div class="form-group">
                                        <label for="fromplace" class="col-sm-2 control-label">始发地</label>
                                        <div class="col-md-2">
                                            <label class="radio">
                                                <input type="radio" name="radiofrom" value="0" id="optionsRadios1" checked> 不限
                                            </label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="col-md-4">
                                            <label class="radio">
                                                <input type="radio" name="radiofrom" value="1" id="optionsRadios2" >具体出发地
                                            </label></div>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="fromplace" name="messfrom"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="nameplace" class="col-sm-2 control-label">目的地</label>
                                        <div class="col-md-2">
                                            <label class="radio2">
                                                <input type="radio" name="nameplace" id="optionsRadios3" value="0" checked> 不限
                                            </label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="col-md-4">
                                                <label class="radio2">
                                                    <input type="radio" name="nameplace" value="1" id="optionsRadios4" >具体目的地
                                                </label></div>
                                            <div class="col-md-5">
                                                <input type="text" class="form-control" id="nameplace" name="nameplacemess" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pricemin" class="col-sm-2 control-label">价格区间</label>
                                        <div class="col-md-2">
                                            <label class="radio3">
                                                <input type="radio" name="price" id="optionsRadios5"value="0" checked> 不限
                                            </label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="col-md-4">
                                                <label class="radio3">
                                                    <input type="radio" name="price" id="optionsRadios6" value="1">具体价格
                                                </label></div>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="pricemin" id="pricemin" value="最低价格" />
                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="pricemax"  id="pricemax" value="最高价格"/>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <label for="daysmin" class="col-sm-2 control-label">行程天数</label>
                                        <div class="col-md-2">
                                            <label class="radio4">
                                                <input type="radio" name="days" id="optionsRadios7"value="0" checked> 不限
                                            </label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="col-md-4">
                                                <label class="radio4">
                                                    <input type="radio" name="days" id="optionsRadios8" value="1">具体天数
                                                </label></div>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="daysmin" id="daysmin" value="最少天数" />
                                            </div>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control"name="daysmax"  id="daysmax" value="最多天数"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-default">开始搜索</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row clearfix" style="padding-top: 80px">
                <div class="col-md-12 column">
                    <div class="carousel slide" id="carousel-118948">
                        <ol class="carousel-indicators">
                            <li class="active" data-slide-to="0" data-target="#carousel-118948">
                            </li>
                            <li data-slide-to="1" data-target="#carousel-118948">
                            </li>
                            <li data-slide-to="2" data-target="#carousel-118948">
                            </li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img alt="" src="images/Travel/Carousel1.jpg" />
                            </div>
                            <div class="item">
                                <img alt="" src="images/Travel/Carousel2.jpg" />
                            </div>
                            <div class="item">
                                <img alt="" src="images/Travel/Carousel3.jpg" />
                            </div>
                        </div> <a class="left carousel-control" href="#carousel-118948" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-118948" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2 column">
            <table style="background-color: whitesmoke">
                <thead>
                <tr>
                    <td>
                        旅行指南针
                    </td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <a href="Travel_index.jsp" class="home"></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="Travel_index.jsp" class="show2"></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="Travel_index.jsp" class="show3"></a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>


    </div>

            <div  class="row clearfix">
                <br>
                <div class="col-md-3 column">
                </div>
                <div class="col-md-5 column" style="font-size: 10px;text-align: center">
                    <p>copyright© 2016-2017 浙江A&F信息工程学院版权所有  </p>
                    <p>经营许可证：苏A2-20110026 苏ICP备11017770号</p>
                    <p style="font-size: 8px">联系我们 | 767293861@qq.com | 752261488</p>
                </div>
                <div class="col-md-4 column">
                </div>
            </div>

</body>
</html>
