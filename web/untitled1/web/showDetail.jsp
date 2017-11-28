<%--
  Created by IntelliJ IDEA.
  User: jh
  Date: 2017/4/20
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.mybean.data.Login" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.print.DocFlavor" %>
<%@ page import="java.io.*" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session"/>
<html>
<head>
    <title>产品细节</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap-popover-x.css" media="all" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-popover-x.js" type="text/javascript"></script>
    <%@include file="head.txt"%>
</head>
<body class="container" style="font-family: 微软雅黑">
<br>
<br>
<br>
<br>
<br>
<br>
<div class="row clearfix">
    <div class="col-md-4 column">

<%
    if(!login.getSuccess()) {
        response.sendRedirect("login.jsp");
    }
    String numberID =request.getParameter("xijie");

    if(numberID==null){
        %>
<div class="alert alert-dismissable alert-warning">
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>
    <h4>注意!</h4> <strong>Warning!</strong> 没有产品号，无法查看 <a href="Travel_index.jsp" class="alert-link">点击返回查询页面</a>
</div>
<%
        return;
    }
    %>
        <%!String number;
            String name;
            String from;
            String price;
            String pic ;
            String mess;
            String pic1;
            String pic2;
            String pic3 ;
            String goods;
            int daynum;
            int days;
            String d_s[]=new String[10];
            String d_d[]=new String[10];
            String d_h[]=new String[10];
        %>
<%
    Connection con;
    Statement sql;
    ResultSet rs;
    try {
        Class.forName("com.mysql.jdbc.Driver" );// 加载驱动程序以连接数据库
    }
    catch(Exception e){

    }
    String url = "jdbc:mysql://localhost:3306/webdata?charact/erEncoding=UTF-8";
    String username = "root";
    String SQLpassword = "123123";

    try {

        con = DriverManager.getConnection(url, username, SQLpassword); //必须抛出错误
        sql = con.createStatement();
        String cdn="SELECT * FROM destinationform where num = '"+numberID+"'";
        rs=sql.executeQuery(cdn);
        String pictrue="";
        String detailMess="";
        while(rs.next()){
            number =rs.getString(1);
            name =rs.getString(2);
            from =rs.getString(3);
            price =rs.getString(4);
            pic =rs.getString(6);
            mess =rs.getString(5);
            pic1 =rs.getString(8);
            pic2 =rs.getString(9);
            pic3 =rs.getString(10);
            daynum = rs.getInt(11);
            goods = name+","+from+","+mess+"#"+price+pic;
            goods = goods.replaceAll("\\p{Blank}","");
            ResultSet rs2;

            cdn="SELECT * FROM detial_scheduling where num = '"+numberID+"'";//细节导出
            rs2=sql.executeQuery(cdn);
            while(rs2.next()){
                days=daynum;
                if(days>3)
                    days=3;
                int j=0;
                for(int i=2;i<=days*3;i=i+3){
                    d_s[j]=rs2.getString(i);
                    d_d[j]=rs2.getString(i+1);
                    d_h[j]=rs2.getString(i+2);
                    j++;
                }
            }
            sql.executeUpdate("UPDATE commodityAnalysis SET clicktime=clicktime+1 WHERE  num = '"+numberID+"'");//点击量加1
        }
    }
    catch (SQLException exp){}
%>
        <div class="carousel slide" id="carousel-98867">
            <ol class="carousel-indicators">
                <li data-slide-to="0" data-target="#carousel-98867">
                </li>
                <li data-slide-to="1" data-target="#carousel-98867">
                </li>
                <li data-slide-to="2" data-target="#carousel-98867" class="active">
                </li>
            </ol>
            <div class="carousel-inner">
                <div class="item">
                    <img alt="" src="<%=pic1 %>" />
                </div>
                <div class="item">
                    <img alt="" src="<%=pic2 %>" />
                </div>
                <div class="item active">
                    <img alt="" src="<%=pic3 %>" />
                </div>
            </div> <a class="left carousel-control" href="#carousel-98867" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-98867" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
        </div>
    </div>
    <div class="col-md-8 column">
        <table class="table">
            <tbody>
            <tr>
                <td>
                    <p style="font-size: 25px"><%=mess %></p>
                </td>
            </tr>
            <tr class="warning">
                <td>
                    <p style="font-size: small;color: #444444">起价说明：<span style="font-size:large;color: #FF0000;font-weight:bold">¥<%=price%>起/人</span></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="font-size: small;color: #444444">产品编号：<%=number%></p>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="font-size: small;color: #444444">行程套餐：<%=from%>-<%=name%> <%=daynum %>天</p>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="col-md-3 column">
        </div>
        <div class="col-md-6 column">
            <form action="putGoodsServlet" method=post>
                <input type="hidden"  name="java" value=<%=goods %>>
                <input type="hidden"  name="goodsnum" value=<%=number %>>
                <input  type="submit" value="放入购物车" class="btn btn-lg btn-warning btn-block">
            </form>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</div>
<div class="row clearfix" style="background-color: lightskyblue">
    <div class="col-md-1">
    </div>
    <div class="col-md-11">
        <p style="color: white;font-size: 20px">路线相关推荐>></p>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-1">
        <br>
        <div style="height: 80px;width: 80px;background-color: lightskyblue;text-align: center;">
            <p style="color: white;font-size: 20px">行程<br>介绍</p>
        </div>
    </div>
    <div class="col-md-8">
        <%
            for(int i=0;i<days;i++){
                %>
        <h2 style="color: lightskyblue">D<%=i+1 %><small>第<%=i+1 %>天</small></h2>
        <p style="font-weight: bold"><span class="glyphicon glyphicon-bookmark" style="color:lightskyblue;font-size: 15px "></span>行程介绍：</p>
        <p><%=d_s[i] %></p>
        <HR width="80%" color=#987cb9 SIZE=3>
        <p style="font-weight: bold"><span class="glyphicon glyphicon-cutlery" style="color:lightskyblue;font-size: 15px "></span>用餐条件：</p>
        <p><%=d_d[i] %></p>
        <HR  width="80%" color=#987cb9 SIZE=3>
        <p style="font-weight: bold"><span class="glyphicon glyphicon-home" style="color:lightskyblue ;font-size: 15px"></span>住宿信息：</p>
        <p><%=d_h[i] %></p>
        <HR width="80%" color=#987cb9 SIZE=3>
        <%
            }
        %>
    </div>
    <div class="col-md-3">
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-1">
        <br>
        <div style="height: 80px;width: 80px;background-color: lightskyblue;text-align: center;">
            <p style="color: white;font-size: 20px">预定<br>流程</p>
        </div>
    </div>
    <div class="col-md-8">
        <HR width="80%" color=#987cb9 SIZE=3>
        <img src="images/showDetail/flow.bmp">
        <HR width="80%" color=#987cb9 SIZE=3>
    </div>
</div>
<div class="row clearfix">
    <div class="col-md-1">
        <br>
        <div style="height: 80px;width: 80px;background-color: lightskyblue;text-align: center;">
            <p style="color: white;font-size: 20px">重要<br>提示</p>
        </div>
    </div>
    <div class="col-md-8">
        <HR width="80%" color=#987cb9 SIZE=3>
        <p>1、65 周岁以上老年人预订出游，须有家属或朋友陪同方可出游; 因服务能力所限，不接受65周岁以上的旅游者出游报名，敬请 谅解。</p>
        <p>2、本产品绑定特价团队机票，由于特价机票原因航班无法为您指定，如亲对航班时间有要求需补交机票差，详情请与客服联系。具体航班以实际出票为准，请至少提前10天告知您准确的出行时间，具体情况请咨询客服；若客人在行程中途离团，回程机票作废，费用不退；</p>
        <HR width="80%" color=#987cb9 SIZE=3>
    </div>
</div><HR width="80%" color=#987cb9 SIZE=3>
<div class="row clearfix">

    <div class="col-md-1">
        <br>
        <div style="height: 80px;width: 80px;background-color: lightskyblue;text-align: center;">
            <p style="color: white;font-size: 20px">退款<br>说明</p>
        </div>
    </div>
    <div class="col-md-8">
        <p>所有的产品，在使用有效期内未与商家预约或预约产品出行日期双方未达成一致，且未消费的可以全额退款；如用户已经与商家预约产品，申请退款需要承担实际损失或按照双方签署协议承担损失。</p>
    </div>

</div>
<HR width="80%" color=#987cb9 SIZE=3>


</body>
</html>
