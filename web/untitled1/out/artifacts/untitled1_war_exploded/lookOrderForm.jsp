<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/29
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session"/>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>查看订单</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%@ include file="head.txt"%>

</head>
<body style="font-family: 微软雅黑">
<div class="container">
    <div class="row clearfix">
        <div class="col-md-1 column">
        </div>
        <div class="col-md-9 column">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        编号
                    </th>
                    <th>
                        产品
                    </th>
                    <th>
                        内容
                    </th>
                    <th>
                        价格
                    </th>
                </tr>
                </thead>
                <tbody>
                <%
                    if(login==null){
                        response.sendRedirect("login.jsp");
                    }
                    else {
                        boolean ko=login.getSuccess();
                        if(!ko)
                            response.sendRedirect("login.jsp");
                    }
                    Connection con;
                    Statement sql;
                    ResultSet rs;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                    }
                    catch (Exception e){}
                    try {
                        String url = "jdbc:mysql://localhost:3306/webdata?characterEncoding=UTF-8";
                        String username = "root";
                        String SQLpassword = "123123";
                        con=DriverManager.getConnection(url,username,SQLpassword);
                        sql=con.createStatement();
                        String cdn="SELECT id, pic,sum,mess FROM orderform where logname='"+login.getLogname()+"'";
                        rs=sql.executeQuery(cdn);
                        while(rs.next()){
                           String picY= rs.getString(2);
                           //String picY=s1.split(",")[s1.split(",").length-2];
                        %>
                <tr >
                    <td>
                        <% out.print(rs.getString(1));%>
                    </td>
                    <td>

                     <img alt="" src="<%=picY%>" />
                    </td>
                    <td>
                        <%out.print(rs.getString(4));%>
                    </td>
                    <td>
                        <span style="font-size:large;color: #FF0000;font-weight:bold">￥<%out.print(rs.getString(3));%>
                    </td>
                </tr>

                <%
                    }
                        con.close();
                }
                catch (SQLException e){
                    out.print(e);
                }
                %>


                </tbody>
            </table>

        </div>
        <div class="col-md-2 column">
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>