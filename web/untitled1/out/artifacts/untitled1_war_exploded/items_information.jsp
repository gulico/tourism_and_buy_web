<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/25
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>商品信息</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>

    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <%@ include file ="wmshead2.txt"%>
</head>
<body>

<!-- 右侧具体内容栏目 -->
<div id="rightContent" >
    <div role="tabpanel" class="tab-pane" id="user">
        <div class="check-div form-inline">
            <div class="col-xs-3">
                <button class="btn btn-yellow btn-xs"><a href="newGoodsBase.jsp">添加商品</a> </button>
            </div>
            <div class="col-xs-4">
            </div>
        </div>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-1 ">
                目的地
            </div>
            <div class="col-xs-1">
                出发地
            </div>
            <div class="col-xs-1">
                价钱
            </div>
            <div class="col-xs-4">
                旅游类型
            </div>
            <div class="col-xs-3">
                图片地址
            </div>

            <div class="col-xs-1">
                操作
            </div>
        </div>

        <div class="tablebody">
            <%
                Connection con;
                Statement sql;
                ResultSet Gs;
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
                    String cdn="SELECT * FROM destinationform";
                    Gs=sql.executeQuery(cdn);
                    while(Gs.next()) {
                        String num = Gs.getString(1);
                        String destination = Gs.getString(2);
                        String from = Gs.getString(3);
                        String price = Gs.getString(4);
                        String mess = Gs.getString(5);
                        String pic=Gs.getString(6);
            %>
            <div class="row">
                <div class="col-xs-1 ">
                    <%=destination %>
                </div>
                <div class="col-xs-1">
                    <%=from %>
                </div>
                <div class="col-xs-1">
                    <%=price %>
                </div>
                <div class="col-xs-4">
                    <%

                        if(mess.length()>20){
                            mess = mess.substring(0,19)+"...";
                            out.print(mess);
                        }else{
                            out.print(mess);   //<span style="font-size:5px;font-weight:bold">
                        }
                    %>

                </div>
                <div class="col-xs-3">
                   <%=pic%>
                </div>

                <div class="col-xs-1">
                    <form action="modifyGoods.jsp" method=post style="margin:0px; padding:0px;">
                        <input type="hidden"   name="thisnum" value=<%=num%>>
                        <input type="submit" class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" value="修改">
                    </form>

                    <form action="modifyGoodsdetail.jsp" method=post style="margin:0px; padding:0px;">
                        <input type="hidden"   name="DNum" value=<%=num%>>
                        <input type="submit" class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" value="查看" >
                    </form>

                    <form action="GoodsDelete" method=post style="margin:0px; padding:0px;">
                        <input type="hidden"   name="Num" value=<%=num%>>
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

