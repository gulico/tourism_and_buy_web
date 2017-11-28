<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session"/>
<HTML>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <title>留言板</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <%@ include file="head.txt"%>
    <style>
        body{/*背景*/
            background-image:url(images/submit/messagePane_background.png);/*来源*/
            background-repeat:no-repeat;/*禁止平铺*/
            background-position:0px -50px;/*上下左右居中*/
            font-family: 微软雅黑;
        }
    </style>
</head>
<body>

     <%! Vector v=new Vector();
         int i=0; 
         ServletContext  application;
         synchronized void leaveWord(String s) { //留言方法
            application=getServletContext();;
            i++;
            v.add("No."+i+","+s);
            application.setAttribute("Mess",v); 
         }
     %> 
     <% String name=request.getParameter("peopleName");
        String title=request.getParameter("title");
        String messages=request.getParameter("messages");
           if(name==null)
              name="guest"+(int)(Math.random()*10000);
           if(title==null)
              title="无标题";
           if(messages==null)
              messages="无信息";
           String s=name+"#"+title+"#"+messages;
           %>
     <%
           leaveWord(s);
     %>


      <script language="javascript" type="text/javascript">
          setTimeout("javascript:location.href='showMessage.jsp'", 2500);
      </script>
</body></HTML>
