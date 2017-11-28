<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/28
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/28
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.mybean.data.Login" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sun.rowset.CachedRowSetImpl" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>查看购物车</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%@ include file="head.txt"%>
</head>
<body style="font-family: 微软雅黑">
<h1>你好，世界！</h1>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-2 column">
        </div>
        <div class="col-md-7 column">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>
                        产品
                    </th>
                    <th>
                        产品信息
                    </th>
                    <th>
                        交付时间
                    </th>
                    <th>

                    </th>
                </tr>
                </thead>
                <tbody>
<%
        if(login==null){
            response.sendRedirect("login.jsp");
        }
        else{
            boolean ko=login.getSuccess();
            if(!ko){
                response.sendRedirect("login.jsp");
            }
        }
        LinkedList car=login.getCar();
        if(car==null){
            out.print("<h2>购物车内没有东西.</h2>");
        }
        else{
            Iterator<String> iterator=car.iterator();
            StringBuffer buyGoods = new StringBuffer();
            int n=0;
            double priceSum =0;
            String pic=null;
            out.print("购物车中的物品：");
            while(iterator.hasNext()){
                String goods = iterator.next();
                String showGoods="";

                n++;
                int index = goods.lastIndexOf("#");
                if(index!=-1){
                    priceSum+=Double.parseDouble(goods.substring(index+1,index+5));
                    showGoods = goods.substring(0,index);
                    pic=goods.substring(index+7);
                }
                buyGoods.append(n+":"+showGoods);
                String del ="<form action='deleteServlet'method = 'post'>"+
                        "<input type='hidden'name='delete'value= "+goods+">"+
                        "<input type='submit'class=btn btn-default value='删除'></form>";
                //out.print("<tr><td>"+showGoods+"</td>");
                //out.print("<td>"+del+"</td></tr>");
            %>
                <tr>
                    <td>
                        <img alt="" src="<%=pic%>" />
                    </td>
                    <td>
                        <% out.print(showGoods); %>
                    </td>
                    <td>
                        04/05/2017
                    </td>
                    <td>
                         <span style="font-size: small;color: #555555;font-weight:bold"><%out.print(del);%>
                    </td>
                </tr>
                <%}



                    String orderForm = "<form action = 'buyServlet'method='post'>"+
                            "<input type ='hidden'name='pic'value="+pic+">"+
                            "<input type ='hidden'name='buy'value="+buyGoods+">"+
                            "<input type ='hidden'name='price'value="+priceSum+">"+
                            "<input type ='submit' class=btn btn-default value='生成订单'></form>";
                %>

                </tbody>
            </table>
            <% out.print(orderForm);%>
            <%}
            %>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>
</body>
</html>