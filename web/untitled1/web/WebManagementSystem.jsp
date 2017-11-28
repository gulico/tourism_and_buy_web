<%--
  Created by IntelliJ IDEA.
  User: jh
  Date: 2017/5/18
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>三时三餐 - 后台管理系统</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script src="js/esl.js"></script>
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/slide.css" />
</head>
<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun" >
        <div id="personInfor" >
            <img src="images/logo.png" alt="logo" height="100" width="100">
            <p id="userName"><%=login.getLogname()%></p>
        </div>
        <div class="meun-title">账号管理</div>
        <div class="meun-item" href="userinfo.jsp" aria-controls="sour" role="tab" data-toggle="tab"><a href="userinfo.jsp"><img src="images/icon_source.png">用户管理</a></div>
        <div class="meun-title">产品管理</div>
        <div class="meun-item" href="items_information.jsp" aria-controls="scho" role="tab" data-toggle="tab"><a href="items_information.jsp"><img src="images/icon_house_grey.png">商品管理</a></div>
        <div class="meun-item meun-item-active" href="WebManagementSystem.jsp" aria-controls="scho" role="tab" data-toggle="tab"><a href="WebManagementSystem.jsp"><img src="images/icon_rule_grey.png">查看报表</a></div>
        <div style="padding-top: 200px"><a href="index.jsp"><span style="color: white">返回主页</span></a></div>
    </div>
    <!-- 右侧具体内容栏目 -->
    <div id="rightContent" >
        <div class="row clearfix" style="padding-top: 100px">
            <!--用户性别分析-->
            <div id="barMain"class="col-md-4 column"style="height:400px">
                <%!
                    int Man=0,Woman=0;
                    int[] clicktime=new int[20],buytime=new int[20];


                %>
                <%
                    for(int i=0;i<20;i++){
                    clicktime[i]=0;
                    buytime[i]=0;
                }
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
                        String cdn="SELECT COUNT(*) as Mann FROM member";
                        rs=sql.executeQuery(cdn);
                        rs.next();//在使用rs.getInt等函数之前必须要使用rs.next()
                        Man = rs.getInt("Mann");
                        cdn="SELECT COUNT(*) as Womenn FROM member WHERE sex='female'";
                        rs=sql.executeQuery(cdn);
                        rs.next();
                        Woman = rs.getInt("Womenn");
                        cdn="SELECT * FROM commodityanalysis";
                        rs=sql.executeQuery(cdn);
                        int i=0;
                        while(rs.next()){
                            clicktime[i]=rs.getInt(2);
                            buytime[i]=rs.getInt(3);
                            i++;
                        }
                        con.close();
                    }
                    catch (SQLException e){
                        System.out.print(e);
                    }
                %>
            </div>
                <div id="lineMain" class="col-md-8 column" style="height:400px"></div>
        </div>
        <script type="text/javascript">
            // 路径配置
            require.config({
                paths: {
                    echarts: 'http://echarts.baidu.com/build/dist'
                }
            });
            // 使用
            require(
                [
                    'echarts',
                    'echarts/chart/pie',
                    'echarts/chart/line'
                ],
                drawEcharts
            );

            function drawEcharts(ec){
                drawBar(ec);
                drawLine(ec);
            }
            function drawBar(ec){
                var myBarChart = ec.init(document.getElementById('barMain'));
                var option = {
                    title : {//标题
                        text: '用户性别统计',
                        x:'center'
                    },
                    tooltip : {//标签
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"//标签格式
                    },
                    series : [
                        {
                            name: '用户性别',
                            type: 'pie',
                            radius : '50%',
                            center: ['50%', '60%'],
                            data:[
                                {value:<%=Woman%>, name:'女性用户'},
                                {value:<%=Man%>, name:'男性用户'},
                                {value:1, name:'未知'},
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                myBarChart.setOption(option,true); //当setOption第二个参数为true时，会阻止数据合并
            }
            function drawLine(ec){
                var myLineChart = ec.init(document.getElementById('lineMain'));
                var option2 = {
                    title : {
                        text: '商品点击量与购买量统计',
                        subtext: '仅显示商品前20'
                    },
                    tooltip : {
                        trigger: 'axis'
                    },
                    legend: {
                        data:['点击量','购买量']
                    },
                    calculable : true,
                    xAxis : [
                        {
                            type : 'category',
                            boundaryGap : false,
                            data : ['1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20']
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            axisLabel : {
                                formatter: '{value} 次'
                            }
                        }
                    ],
                    series : [
                        {
                            name:'点击量',
                            type:'line',
                            data:[<%=clicktime[0] %>,<%=clicktime[1] %>,<%=clicktime[2] %>,<%=clicktime[3] %>,<%=clicktime[4] %>,<%=clicktime[5] %>,<%=clicktime[6] %>,<%=clicktime[7] %>,<%=clicktime[8] %>,<%=clicktime[9] %>,<%=clicktime[10] %>,<%=clicktime[11] %>,<%=clicktime[12] %>,<%=clicktime[13] %>,<%=clicktime[14] %>,<%=clicktime[15] %>,<%=clicktime[16] %>,<%=clicktime[17] %>,<%=clicktime[18] %>,<%=clicktime[19] %>,],
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值'},
                                    {type : 'min', name: '最小值'}
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name: '平均值'}
                                ]
                            }
                        },
                        {
                            name:'购买量',
                            type:'line',
                            data:[<%=buytime[0]%>,<%=buytime[1]%>,<%=buytime[2]%>,<%=buytime[3]%>,<%=buytime[4]%>,<%=buytime[5]%>,<%=buytime[6]%>,<%=buytime[7]%>,<%=buytime[8]%>,<%=buytime[9]%>,<%=buytime[10]%>,<%=buytime[11]%>,<%=buytime[12]%>,<%=buytime[13]%>,<%=buytime[14]%>,<%=buytime[15]%>,<%=buytime[16]%>,<%=buytime[17]%>,<%=buytime[18]%>,<%=buytime[19]%>,],
                            markPoint : {
                                data : [
                                    {type : 'max', name: '最大值'},
                                    {type : 'min', name: '最小值'}
                                ]
                            },
                            markLine : {
                                data : [
                                    {type : 'average', name : '平均值'}
                                ]
                            }
                        }
                    ]
                };
                myLineChart.setOption(option2,true);
            }
        </script>
  </div>

</body>
</html>
