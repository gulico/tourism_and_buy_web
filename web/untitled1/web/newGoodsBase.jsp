
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
                <form class="form-horizontal" role="form" action="sevletGoodsBaseAdd" method="post">
                    <%!

                        String days;
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
                        String num ="0";
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

                                days = rs.getString(2);

                                d1_s = rs.getString(3);
                                //System.out.println(fromplace+"yxd1111111");
                                d1_d = rs.getString(4);
                                d1_h = rs.getString(5);

                                d2_s = rs.getString(6);
                                //System.out.println(fromplace+"yxd1111111");
                                d2_d = rs.getString(7);
                                d2_h = rs.getString(8);

                                d3_s = rs.getString(9);
                                //System.out.println(fromplace+"yxd1111111");
                                d3_d = rs.getString(10);
                                d3_h = rs.getString(11);
                            }
                            con.close();
                        }
                        catch (SQLException e){
                            out.print(e);
                        }
                    %>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="inputEmail3"  name="num"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">目的地</label>
                        <div class="col-sm-4">
                            <input type="" class="form-control"  name="name"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >出发地</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="fromp"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >价格</label>
                        <div class="col-sm-4 " size=50>
                            <input type="text" class="form-control" name="price" required/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">信息</label>
                        <div class="col-sm-4">
                            <input type="" class="form-control" name="mess"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >图片</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="pic"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >大图1</label>
                        <div class="col-sm-4 " size=50>
                            <input type="text" class="form-control" name="pic1" required/>
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">大图2</label>
                        <div class="col-sm-4">
                            <input type="" class="form-control" id="inputPassword3" name="pic2"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >大图3</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="pic3"  required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label" >天数</label>
                        <div class="col-sm-4 " size=50>
                            <input type="text" class="form-control" name="days" required/>
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
