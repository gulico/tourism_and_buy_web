<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/25
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>修改商品信息</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <%@ include file ="wmshead2.txt"%>
</head>
<body>
<div id="rightContent" >
    <div class="data-div" style="padding-top: 200px">
        <div class="row clearfix">
            <div class="col-md-2 column">
            </div>
            <div class="col-md-10 column">
                <form class="form-horizontal" role="form" action="Goodsmodifyinfo" method="post">
                    <%!

                        String name;
                        String fromplace;
                        String price;
                        String mess;
                        String pic;
                        String id;
                        String detailpic1;
                        String detailpic2;
                        String detailpic3;
                    %>
                    <%
                        String num =request.getParameter("thisnum");
                      //  System.out.println(num+"yxd1111111");
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
                            String cdn="SELECT * FROM destinationform WHERE num ='"+num+"'";
                            rs=sql.executeQuery(cdn);

                            while(rs.next()) {

                                name = rs.getString(2);

                                fromplace = rs.getString(3);
                                System.out.println(fromplace+"yxd1111111");
                                price = rs.getString(4);
                                mess = rs.getString(5);
                            }
                            con.close();
                        }
                        catch (SQLException e){
                            out.print(e);
                        }
                    %>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">目的地</label>
                        <div class="col-sm-4">
                            <input type="hidden" class="form-control"   name="num" value="<%=num %>" readonly/>
                            <input type="text" class="form-control" id="inputEmail3"  name="name" value="<%=name %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">出发地</label>
                        <div class="col-sm-4">
                            <input type="" class="form-control" id="inputPassword3" name="fplace" value="<%=fromplace %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >价格</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="price" value="<%=price %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >信息</label>
                        <div class="col-sm-4 " size=50>
                                <input type="text" class="form-control" name="mess"value=" <%=mess %>" required/>
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
