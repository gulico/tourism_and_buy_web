<%--
  Created by IntelliJ IDEA.
  User: jh
  Date: 2017/5/19
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>用户信息</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <%@ include file ="wmshead.txt"%>
</head>
<body>

<!-- 右侧具体内容栏目 -->
<div id="rightContent" >
    <div role="tabpanel" class="tab-pane" id="user">
        <div class="check-div form-inline">
            <div class="col-xs-3">
                <button class="btn btn-yellow btn-xs"><a href="newUser.jsp">添加用户</a> </button>
            </div>
            <div class="col-xs-4">
                <form action="sevletUsersSearch" method="post" style="margin:0px; padding:0px;">
                <input type="text" class="form-control input-sm" placeholder="输入文字搜索" name="keyword">
                <button type="submit" class="btn btn-white btn-xs ">查 询 </button>
                </form>
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
                登陆次数
            </div>
            <div class="col-xs-2">
                操作
            </div>
        </div>

        <div class="tablebody">
            <%
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
                String cdn="SELECT * FROM member";
                rs=sql.executeQuery(cdn);
                while(rs.next()) {
                    String name = rs.getString(1);
                    String password = rs.getString(2);
                    String email = rs.getString(3);
                    String sex = rs.getString(4);
                    int loginnum = rs.getInt(5);
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
                    <%=loginnum %>
                </div>
                <div class="col-xs-2">

                        <form action="modifyUsersinfo.jsp" method=post style="margin:0px; padding:0px;">
                            <input type="hidden"   name="logname" value=<%=name %>>
                            <input type="submit" class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" value="修改">
                        </form>
                </div>
                <div class="col-xs-1">
                        <form action="usersDelete" method=post style="margin:0px; padding:0px;">
                            <input type="hidden"   name="Name" value=<%=name %>>
                            <input type="submit" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" value="删除" >
                        </form>

                </div>
            </div>
            <%
                }
                con.close();
            }
            catch (SQLException e){
                out.print(e);
            }
        %>

        </div>

    </div>
    <!--页码块-->
    <footer class="footer">
        <ul class="pagination">
            <li>
                <select>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
                </select>
                页
            </li>
            <li class="gray">
                共20页
            </li>
            <li>
                <i class="glyphicon glyphicon-menu-left">
                </i>
            </li>
            <li>
                <i class="glyphicon glyphicon-menu-right">
                </i>
            </li>
        </ul>
    </footer>
</div>

</body>
</html>
