<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<%! public String handleStr(String s) {
       try {  byte [] bb= s.getBytes("iso-8859-1");
              s = new String(bb);
       }
       catch(Exception exp){}
       return s;
    }
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <title>���԰�</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <%@ include file="head.txt"%>
    <style type="text/css">
        body{/*����*/
            background-image:url(images/submit/showMessage_background.png);/*��Դ*/
            background-repeat:no-repeat;/*��ֹƽ��*/
            background-position:0px 50px;/*�������Ҿ���*/
            font-family: ΢���ź�;
            margin: 0;
        }
        #footer {
            width: 100%;
            position: fixed;
            bottom: 0;
        }
    </style>
</head>
<body>



<div class="container">
    <div class="row clearfix">
        <div class="col-md-8 column" style="padding-top: 250px; padding-left: 100px">
            <table class="table table-striped table-hover" >
                <tbody>
<% Vector v=(Vector)application.getAttribute("Mess");
    for(int i=0;i<v.size();i++) {
        String message=(String)v.elementAt(i);//�Ѹ���index��õ�Ԫ�ظ�ֵ��message
        String []a =message.split("#");%>
<tr>
    <td>
        <% out.print("������:"+handleStr(a[0])+",");
        out.print("����:"+handleStr(a[1])+"<br>");
        out.print("��������:<br>"+handleStr(a[2]));
        out.print("<br>------------------------<br>");%>

    </td>
    <td>
    04/05/2017
    </td>
    <%}%>

                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-md-4 column">
        </div>
    </div>
</div>
<div id="footer"class="row clearfix" style="background-color: whitesmoke;padding-bottom: 0px">
    <br>
    <div class="col-md-4 column">
    </div>
    <div class="col-md-4 column" style="font-size: 10px;text-align: center">
        <p>copyright? 2016-2017 �㽭A&F��Ϣ����ѧԺ��Ȩ����  </p>
        <p>��Ӫ���֤����A2-20110026 ��ICP��11017770��</p>
        <p style="font-size: 8px">��ϵ���� | 767293861@qq.com | 752261488</p>
    </div>
    <div class="col-md-4 column">
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>
</body>
</html>