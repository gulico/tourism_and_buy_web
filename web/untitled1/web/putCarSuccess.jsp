<%--
  Created by IntelliJ IDEA.
  User: jh
  Date: 2017/4/28
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.mybean.data.Login" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sun.rowset.CachedRowSetImpl" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<html>
<head>
    <title>成功加入购物车</title>
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
    <div class="row clearfix">
        <div class="col-md-3 column">
        </div>
        <div class="col-md-6 column">
            <div class="alert alert-dismissable alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4>
                    产品已经成功放入购物车啦！快去看看吧~(～￣▽￣)～
                </h4>
                <table class="table table-hover">
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
                        LinkedList car1=login.getCar();
                        if(car1==null){
                            out.print("<h2>购物车内没有东西.</h2>");
                        }
                        else{
                            Iterator<String> iterator=car1.iterator();
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
                    </tr>
                    <%}



                    String orderForm = "<form action = 'buyServlet'method='post'>"+
                            "<input type ='hidden'name='pic'value="+pic+">"+
                            "<input type ='hidden'name='buy'value="+buyGoods+">"+
                            "<input type ='hidden'name='price'value="+priceSum+">"+
                            "<input type ='submit' class=btn btn-default value='生成订单'></form>";
                }%>
                </table>
            </div>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</body>
</html>
