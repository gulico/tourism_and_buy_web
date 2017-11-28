<%--
  Created by IntelliJ IDEA.
  User: jh
  Date: 2017/5/21
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.mybean.data.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="usersdataBean" class="classes.mybean.data.DataByPage" scope="session"/>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<html>
<head>
    <title>查询用户结果</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <%@ include file ="wmshead.txt"%>
</head>
<body>
<jsp:setProperty name="usersdataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="usersdataBean" property="currentPage" param="currentPage"/>
<!-- 右侧具体内容栏目 -->
<div id="rightContent" >
    <div role="tabpanel" class="tab-pane" id="user">
        <div class="check-div form-inline">
            <div class="col-xs-9">
            </div>
            <div class="col-xs-3">
                <%!
                    int totalRecord;

                %>
                <%
                    CachedRowSetImpl rowSet =usersdataBean.getRowSet();
                    rowSet.last();//获取回来行
                    totalRecord = rowSet.getRow();//行数
                %>
                共有<%=totalRecord%>个相关用户
            </div>
        </div>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-2 ">
                用户名
            </div>
            <div class="col-xs-2">
                密码
            </div>
            <div class="col-xs-2">
                邮箱
            </div>
            <div class="col-xs-2">
                性别
            </div>
            <div class="col-xs-2">
                登录次数
            </div>
            <div class="col-xs-2">
                操作
            </div>
        </div>

        <div class="tablebody"><%

            int pageSize =usersdataBean.getPageSize();
            int totalPages;
            totalPages = usersdataBean.getTotalPage();
            if(totalRecord%pageSize==0)
                totalPages = totalRecord/pageSize;//总页数
            else
                totalPages = totalRecord/pageSize+1;
            usersdataBean.setPageSize(pageSize);
            usersdataBean.setTotalPage(totalPages);
            if(totalPages>=1){
                if(usersdataBean.getCurrentPage()<1)
                    usersdataBean.setCurrentPage(usersdataBean.getTotalPage());
                if(usersdataBean.getCurrentPage()>usersdataBean.getTotalPage())
                    usersdataBean.setCurrentPage(1);
                int index = (usersdataBean.getCurrentPage()-1)*pageSize+1;
                rowSet.absolute(index);
                boolean boo = true;
                for(int i=1;i<=pageSize&&boo;i++){
                    String name = rowSet.getString(1);//用户名
                    String password = rowSet.getString(2);//密码
                    String email = rowSet.getString(3);//邮箱
                    String sex =rowSet.getString(4);//性别
                    String days =rowSet.getString(5);
        %>
            <div class="row">
                <div class="col-xs-2 ">
                    <%=name %>
                </div>
                <div class="col-xs-2">
                    <%=password %>
                </div>
                <div class="col-xs-2">
                    <%=email %>
                </div>
                <div class="col-xs-2">
                    <%=sex %>
                </div>
                <div class="col-xs-2">
                    <%=days %>
                </div>
                <div class="col-xs-1">

                    <form action="modifyUsersinfo.jsp" method=post>
                        <input type="hidden"   name="logname" value=<%=name %>>
                        <input type="submit" class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" value="修改">
                    </form>
                </div>
                <div class="col-xs-1">
                    <form action="usersDelete" method=post>
                        <input type="hidden"   name="Name" value=<%=name %>>
                        <input type="submit" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" value="删除" >
                    </form>

                </div>

            </div><%
                boo = rowSet.next();
                }
                }
            %>
        </div>

    </div>
    <!--页码块-->
    <footer class="footer">
        <ul class="pagination">
            <li style="float: left;list-style: none">
                <form action="" method=post style="margin:0px; padding:0px;">
                    <input type="hidden" name="currentPage" value="<%=usersdataBean.getCurrentPage()-1 %>">
                    <input type="submit" name="g" value="上一页" class="btn btn-default">
                </form>
            </li>
            <li class="gray" style="float: left;list-style: none">
                第<jsp:getProperty name="usersdataBean" property="currentPage"/>页
            </li>
            <li style="float: left;list-style: none">
                    <form action="" method=post style="margin:0px; padding:0px;">
                        <input type="hidden" name="currentPage" value="<%=usersdataBean.getCurrentPage()+1 %>">
                        <input type="submit" name="g" value="下一页" class="btn btn-default">
                    </form>
            </li>
            <li class="gray" style="float: left;list-style: none">
                共<jsp:getProperty name="usersdataBean" property="totalPage"/>页
            </li>
        </ul>
    </footer>
</div>
</body>
</html>
