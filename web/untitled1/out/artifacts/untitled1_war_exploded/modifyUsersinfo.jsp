<%--
  Created by IntelliJ IDEA.
  User: jh
  Date: 2017/5/20
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>修改用户信息</title>
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
                <form class="form-horizontal" role="form" action="sevletUsersmodifyinfo" method="post">
                    <%!
                        String name;
                        String password;
                        String email ;
                        String sex;
                    %>
                    <%
                        String Name =request.getParameter("logname");
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
                            String cdn="SELECT * FROM member WHERE logname ='"+Name+"'";
                            rs=sql.executeQuery(cdn);

                            while(rs.next()) {
                                name = rs.getString(1);
                                password = rs.getString(2);
                                email = rs.getString(3);
                                sex = rs.getString(4);
                            }
                            con.close();
                        }
                        catch (SQLException e){
                            out.print(e);
                        }
                    %>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputEmail3"  name="logname" value="<%=name %>" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputPassword3" name="password" value="<%=password %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" value="<%=email %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" >性别</label>
                        <%
                            String checkedmele="";
                            String checkedfemele="";
                            if(sex.equals("male")){
                                checkedmele="checked";
                            }
                            else{
                                checkedfemele="checked";
                            }
                        %>
                        <div class="col-sm-2">
                            <label class="radio">
                                <input type="radio" name="sex" id="optionsRadios1" name="sex"value="male" <%=checkedmele %>>  男
                            </label>
                        </div>
                        <div class="col-sm-2">
                            <label class="radio">
                                <input type="radio" name="sex" id="optionsRadios2" name="sex" value="female" <%=checkedfemele %>>女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">确认修改</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6 column">
            </div>
        </div>
        </div>
    </div>
</body>
</html>
