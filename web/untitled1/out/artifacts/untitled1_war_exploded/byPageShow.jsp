<%--
  Created by IntelliJ IDEA.
  User: jh
  Date: 2017/4/20
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.mybean.data.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="classes.mybean.data.DataByPage" scope="session"/>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<html>
<head>
    <title>分页查看</title>
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

<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%
    CachedRowSetImpl rowSet =dataBean.getRowSet();
    if(rowSet == null){
%>
<div class="row clearfix">
    <div class="col-md-8 column">
        <br>
        <br>
        <br>
        <br>
        <div class="alert alert-dismissable alert-warning">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            <h4>注意!</h4> <strong>Warning!</strong> 没有任何查询讯息，无法浏览 <a href="Travel_index.jsp" class="alert-link">点击返回查询页面</a>
        </div>
    </div>
    <div class="col-md-4 column">
    </div>
</div><%
        return;
    }
    rowSet.last();//获取回来行
    int totalRecord = rowSet.getRow();
%>
<div class="row clearfix">
    <div class="col-md-8 column">
        <br>
        <br>
        <br>
        <br>
        <div class="tabbable" id="tabs-198796">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#panel-916071" data-toggle="tab">共有<%=totalRecord %>个产品满足条件</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="panel-916071">
                    <%
                        int pageSize =dataBean.getPageSize();
                        int totalPages;
                        totalPages = dataBean.getTotalPage();
                        if(totalRecord%pageSize==0)
                            totalPages = totalRecord/pageSize;//总页数
                        else
                            totalPages = totalRecord/pageSize+1;
                        dataBean.setPageSize(pageSize);
                        dataBean.setTotalPage(totalPages);
                        if(totalPages>=1){
                            if(dataBean.getCurrentPage()<1)
                                dataBean.setCurrentPage(dataBean.getTotalPage());
                            if(dataBean.getCurrentPage()>dataBean.getTotalPage())
                                dataBean.setCurrentPage(1);
                            int index = (dataBean.getCurrentPage()-1)*pageSize+1;
                            rowSet.absolute(index);
                            boolean boo = true;
                            for(int i=1;i<=pageSize&&boo;i++){
                                String number = rowSet.getString(1);//产品编号
                                String name = rowSet.getString(2);//目的地
                                String from = rowSet.getString(3);//始发地
                                String price = rowSet.getString(4);//价格
                                String mess =rowSet.getString(5);//详细信息
                                String pic = rowSet.getString(6);//图片信息
                                String goods = name+","+from+","+mess+"#"+price+pic;
                                goods = goods.replaceAll("\\p{Blank}","");
                    %>
                    <table class="table table-hover">
                        <tbody>
                        <tr>
                            <td><img src="<%=pic %>"></td>
                            <td><p style="color: #31b0d5 ;font-weight:bold" ><%=mess%></p>
                                <p><small>出发地：<%=from%></small></p>
                                <p><small>目的地：<%=name%></small></p>
                            </td>
                            <td style="color: #FF0000;font-weight:bold">¥<%=price%>
                                <form action="showDetail.jsp" method=post>
                                    <input type="hidden"  name="xijie" value=<%=number%>>
                                    <input  type="submit" value="查看细节" class="btn btn-default btn-info">
                                </form>
                                <form action="putGoodsServlet" method=post>
                                    <input type="hidden"  name="java" value=<%=goods%>>
                                    <input type="hidden"  name="goodsnum" value=<%=number %>>
                                    <input  type="submit" value="放入购物车" class="btn btn-default btn-info">
                                </form>
                            </td>

                        </tr>
                        </tbody>
                    </table>
                    <%
                                boo = rowSet.next();
                            }
                        }
                    %>

                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4 column">
    </div>
</div>

<div class="row clearfix">
    <div class="col-md-4 column">
    </div>
    <div class="col-md-4 column">
        <BR>每页最多显示<span style="color: lightseagreen"><jsp:getProperty name="dataBean" property="pageSize"/></span>条信息
        <BR >当前显示第
        <span style="color: lightseagreen"><jsp:getProperty name="dataBean" property="currentPage"/></span>页，共有
        <span style="color: lightseagreen"><jsp:getProperty name="dataBean" property="totalPage"/></span>页
        <table>
            <tr>
                <td>
        <form action="" method=post>
        <input type="hidden" name="currentPage" value="<%=dataBean.getCurrentPage()-1 %>">
        <input type="submit" name="g" value="上一页" class="btn btn-default">
    </form></td>
        <td><form action="" method=post>
            <input type="hidden" name="currentPage" value="<%=dataBean.getCurrentPage()+1 %>">
            <input type="submit" name="g" value="下一页" class="btn btn-default">
        </form></td></tr>
        </table>
    </div>
    <div class="col-md-4 column">
    </div>
</div>
</body>
</html>
