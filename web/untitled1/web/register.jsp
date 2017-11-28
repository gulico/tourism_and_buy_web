<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
<meta charset="gbk">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <title>注册页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	  <link href="css/bootstrap-popover-x.css" media="all" rel="stylesheet" type="text/css" />
	  <script src="js/bootstrap-popover-x.js" type="text/javascript"></script>
    <style>
    body{/*背景*/
	background-image:url(images/register/bk.jpg);/*来源*/
	background-repeat:no-repeat;/*禁止平铺*/
    background-position:right;/*上下左右居中*/
}
</style>
	  <%@include file="head.txt"%>
  </head>
  <body class="container" style="font-family: 微软雅黑">

   <div class="container">
	<div class="row clearfix" style="padding-top: 40px">
		<div class="col-md-12 column">
			<div class="page-header">
				<h1>
					账号注册 <small>注册邮箱账号</small>
				</h1>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
    </div>
		<div class="col-md-6 column">
			<div class="row clearfix">
				<div class="col-md-8 column">

					<form action = "helpRegister" class="form-horizontal" role="form" name = form method =post >
						<div class="form-group">
							 <label for="inputEmail3" class="col-sm-4 control-label">邮箱</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="inputEmail3" name = "email" required/>
							</div>
							<div class="col-sm-4">
								<div class="btn-group" >
									<select name="email2" class="input-md form-control">
										<option  selected value="@qq.com">@qq.com
										<option value="@163.com">@163.com
										<option value="@126.com">@126.com
										<option value="@sina.cn">@sina.cn
									</select>
								</div>
								</div>
						</div>

                        <div class="form-group">
							 <label class="col-sm-4 control-label">昵称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name = "logname" required/>
							</div>
						</div>
						<div class="form-group">
							 <label for="inputPassword1" class="col-sm-4 control-label">密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="inputPassword1" name ="password" id="newPwd" oninput="validityPwd()" required/>
							</div>
						</div>
                        <div class="form-group">
							 <label for="inputPassword2" class="col-sm-4 control-label" id="newPwdConfirm" oninput="validityPwd()"required>确认密码</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" id="inputPassword2" />
							</div>
						</div>

                        <div class="form-group">  
               				 <label class="col-sm-4 control-label" >性别</label>
               						 <div class="col-sm-2">  
                   			 			<label class="radio">  
                     		   				<input type="radio" name="sex" id="optionsRadios1" value="male" checked>  男
                               			</label>  
                                        </div>
                                        <div class="col-sm-2">
                    					<label class="radio">  
                        					<input type="radio" name="sex" id="optionsRadios2" value="female">女
                      				  </label>  
               			 			 </div>  
            			</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit" class="btn btn-default btn-block btn-info" name = "g" >立即注册</button>
							</div>
						</div>
                        <div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									 <label><input type="checkbox" required/><small>我已阅读并同意相关服务条款和隐私政策</small></label>
                                     <pre class="pre-scrollable">
                                     ...
                                     ...
                                     ...
                                     </pre>
		
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-4 column">

				</div>
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column">
			<ul class="breadcrumb">
				<li>
					 <a href="#">主页</a>
				</li>
				<li>
					 <a href="#">论坛</a>
				</li>
				<li class="active">
					注册
				</li>
			</ul>
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>