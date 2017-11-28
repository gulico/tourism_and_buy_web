<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/28
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%response.setContentType("text/html;charset=UTF-8"); %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>修改商品细节信息</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <%@ include file ="wmshead2.txt"%>
</head>
<body>
<div id="rightContent" >
    <div class="data-div" style="padding-top: 60px">
        <div class="row clearfix">
            <div class="col-md-2 column">
            </div>
            <div class="col-md-10 column">
                <form class="form-horizontal" role="form" action="DetailGoodsmodifyinfo" method="post">
                    <%!

                        String num;
                        String d1_s;
                        String d1_d;
                        String d1_h;
                        String d2_s;
                        String d2_d;
                        String d2_h;
                        String d3_s;
                        String d3_d;
                        String d3_h;
                    %>
                    <%
                        String num =request.getParameter("DNum");
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
                            String cdn="SELECT * FROM detial_scheduling WHERE num ='"+num+"'";
                            rs=sql.executeQuery(cdn);

                            while(rs.next()) {


                                num = rs.getString(1);
                                d1_s = rs.getString(2);
                                //System.out.println(fromplace+"yxd1111111");
                                d1_d = rs.getString(3);
                                d1_h = rs.getString(4);

                                d2_s = rs.getString(5);
                                //System.out.println(fromplace+"yxd1111111");
                                d2_d = rs.getString(6);
                                d2_h = rs.getString(7);

                                d3_s = rs.getString(8);
                                //System.out.println(fromplace+"yxd1111111");
                                d3_d = rs.getString(9);
                                d3_h = rs.getString(10);
                            }
                            con.close();
                        }
                        catch (SQLException e){
                            out.print(e);
                        }
                    %>
                    <div class="form-group">

                        <div class="col-sm-4">
                            <input type="hidden" class="form-control"  name="num" value="<%=num %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">第一天的行程</label>
                        <div class="col-sm-4">
                            <input type="" class="form-control"  name="d1_s" value="<%=d1_s %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第一天的伙食</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="d1_d" value="<%=d1_d %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第一天的酒店</label>
                        <div class="col-sm-4 " size=50>
                            <input type="text" class="form-control" name="d1_h"value=" <%=d1_h%>" required/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">第二天的行程</label>
                        <div class="col-sm-4">
                            <input type="" class="form-control" name="d2_s" value="<%=d2_s %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第二天的伙食</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="d2_d" value="<%=d2_d %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第二天的酒店</label>
                        <div class="col-sm-4 " size=50>
                            <input type="text" class="form-control" name="d2_h"value=" <%=d2_h%>" required/>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">第三天的行程</label>
                        <div class="col-sm-4">
                            <input type="" class="form-control" id="inputPassword3" name="d3_s" value="<%=d3_s %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第三天的伙食</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="d3_d" value="<%=d3_d %>" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >第三天的酒店</label>
                        <div class="col-sm-4 " size=50>
                            <input type="text" class="form-control" name="d3_h"value=" <%=d3_h%>" required/>
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
