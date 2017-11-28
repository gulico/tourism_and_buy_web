<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="classes.mybean.data.Register"%>
<jsp:useBean id="register" type="classes.mybean.data.Register" scope="request"/>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
<meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>提示</title>
	  <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
	  <script type="text/javascript" src='js/checkinputRegister.js'></script>
	  <%
		 boolean success=false;
		  String bk="";
		  if(register.getbackNews().equals("注册成功"))
		  {
		      success=true;
			  bk="images/register/success.png";
		  }
		  else{
		      success=false;
			  bk="images/register/error.png";
		  }
	  %>
		  <style type="text/css">
		  body{/*背景*/
			  background-image: url("<%=bk %>");
			  background-repeat:no-repeat;/*禁止平铺*/
			  background-position:350px 130px;/*上下左右居中*/
			  font-family: 微软雅黑;
			  margin: 0;
		  }
		  #footer {
			  width: 100%;
			  position: fixed;
			  bottom: 0;
		  }
	  </style>
	  <%@include file="head.txt"%>
  </head>
  <body background="<%=bk %>">
  <br>
  <br>
      <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h1>
					<jsp:getProperty name = "register" property="backNews"/>
				</h1>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<%
		if(success){
	%>
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column" style="padding-top: 130px">

			<table class="table table-condensed table-hover">
				<thead>
				</thead>
				<tbody>
				<tr>
					<td>
						注册的会员名称:
					</td>
					<td><jsp:getProperty name="register" property="logname"/></td>
				</tr>
				<tr class="success">
					<td>
						注册的电子邮箱:
					</td>
					<td>
						<jsp:getProperty name="register" property="email"/>
					</td>
				</tr>
				<tr class="error">
					<td>
						注册的密码：
					</td>
					<td>
						<jsp:getProperty name="register" property="password"/>
					</td>
				</tr>
				</tbody>
			</table>
			<div class="row clearfix">
				<div class="col-md-4 column">
				</div>
				<div class="col-md-4 column">
					<button type="button" class="btn btn-default btn-success" ><a href="login.jsp"><span style="color: white">立即登录</span></a></button>
				</div>
				<div class="col-md-4 column">
				</div>
			</div>
		</div>
		<div class="col-md-4 column">
		</div>
		<%
			}
		%>

	</div>
	</div>
</div>
          <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>