<%--
  Created by IntelliJ IDEA.
  User: wxy
  Date: 2017/4/11
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="login" class="classes.mybean.data.Login" scope="session" />
<!DOCTYPE html>
<html>
<head>
  <title>三时三餐 - 亚洲文化旅游交流平台</title>
    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="css/bootstrap.min.css"/>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
    <script src="audiojs/audio.min.js"></script>

    <link href="css/bootstrap-popover-x.css" media="all" rel="stylesheet" type="text/css" />
    <script src="js/bootstrap-popover-x.js" type="text/javascript"></script>
    <script>
        audiojs.events.ready(function() {
            var as = audiojs.createAll();
        });
    </script>
    <%@ include file="head.txt"%>
</head>
<body class="container" style="font-family: 微软雅黑">
<!--页头导航-->

  <div class="row clearfix">
    <div class="col-md-12 column" style="padding-top: 51px">
      <!--轮播-->
      <div class="carousel slide" id="carousel-100848">
        <ol class="carousel-indicators">
          <li data-slide-to="0" data-target="#carousel-100848">
          </li>
          <li data-slide-to="1" data-target="#carousel-100848" class="active">
          </li>
          <li data-slide-to="2" data-target="#carousel-100848">
          </li>
        </ol>
        <div class="carousel-inner">
          <div class="item">
            <img alt="" src="images/index/index_Carousel1.jpg" />
            <div class="carousel-caption">
              <h4>
                  探秋日物语，寻美食与寺庙
              </h4>
              <p>
                  这世间万物，总有那么一两样，偶然的一瞥便惊起心中万千飞鸟，于是便知这一生定要见一次，漂洋过海也要见你。
              </p>
            </div>
          </div>
          <div class="item active">
            <img alt="" src="images/index/index_Carousel2.jpg" />
            <div class="carousel-caption">
              <h4>
                  上里古镇——寻味
              </h4>
              <p>
                  古有诗云:“二水夹明镜，双桥落彩虹”,正是对上里古镇生动形象的总体描绘。古镇建在二水环绕，面向田野小丘，与四周古主、修竹、溪水、古桥相映成趣。
              </p>
            </div>
          </div>
          <div class="item">
            <img alt="" src="images/index/index_Carousel3.jpg" />
            <div class="carousel-caption">
              <h4>
                  尼泊尔·喜马拉雅怀抱下的雪山之国
              </h4>
              <p>
                  渐渐的，当要离开的时候，会怀念这里热情单纯的人们，怀念泰米尔街区的商铺，怀念博卡拉翱翔于天际，泛舟于费瓦湖，怀念奇特旺于象背上围堵犀牛，Rapti河中与鳄鱼的近距离接触，怀念巴克塔普尔的老城区，还有孔雀宾馆的老板，怀念早餐时与澳大利亚阿姨的闲谈，怀念大巴车中与法国朋友的欢声笑语……
              </p>
            </div>
          </div>
        </div> <a class="left carousel-control" href="#carousel-100848" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-100848" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
      </div>
    </div>
  </div>
<br>
<br>
<div class="row clearfix">
    <div class="col-md-4 column" >
    </div>
    <div class="col-md-4 column">
        <audio preload="auto">
            <source src="mp3/Summer.mp3">
        </audio>
    </div>
    <div class="col-md-4 column" >
    </div>
</div>
<br>
<br>
<div class="row clearfix">
    <div class="col-md-9 column">
        <!--选项卡-->
        <div class="tabbable" id="tabs-667287">
            <ul class="nav nav-tabs" >
                <li class="active"><!--链接到本页面的#panel-413530类-->
                    <a href="#panel-413530" data-toggle="tab" >今日特惠</a>
                </li>
                <li>
                    <a href="#panel-543233" data-toggle="tab">特惠门票</a>
                </li>
            </ul>
            <br>
            <div class="tab-content">
                <!--今日特惠单-->
                <div class="tab-pane fade in active" id="panel-413530">
                    <!--fade淡入淡出效果-->
                    <div class="row clearfix">
                        <div class="col-md-4 column">
                            <div class="row">
                            <div class="col-md-12">
                                <div class="thumbnail">
                                    <img alt="index_discount_hangzhoutotai" src="images/index/index_discount_hangzhoutotai.jpg" />
                                    <div class="caption">
                                        <h3>
                                            杭州-泰国六日跟团游 &nbsp; <span style="color: #FF0000;"><b>¥3180</b></span>
                                        </h3>
                                        <p style="color: #444444;">
                                            攀牙湾奇幻皮划艇+风情岛+神仙半岛
                                        </p>
                                        <p>
                                        <form action="showDetail.jsp" method=post>
                                            <input type="hidden"  name="xijie" value=5>
                                            <input  type="submit" value="立即抢购" class="btn btn-default btn-info">
                                        </form>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="col-md-4 column">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="thumbnail">
                                        <img alt="index_discount_shanghaitobansai.jpg" src="images/index/index_discount_shanghaitobansai.jpg" />
                                        <div class="caption">
                                            <h3>
                                                上海-塞班岛 6天 自由行 &nbsp; <span style="color: #FF0000;"><b>¥3680</b></span>
                                            </h3>
                                            <p style="color: #444444;">
                                                含税1550+黄金海滩酒店+接送机
                                            <p>
                                            <form action="showDetail.jsp" method=post>
                                                <input type="hidden"  name="xijie" value=4>
                                                <input  type="submit" value="立即抢购" class="btn btn-default btn-info">
                                            </form>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 column">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="thumbnail">
                                        <img alt="index_discount_xiamentojapen.gif" src="images/index/index_discount_xiamentojapen.gif" />
                                        <div class="caption">
                                            <h3>
                                                厦门-日本 6天 游轮 &nbsp; <span style="color: #FF0000;"><b>¥1999</b></span>
                                            </h3>
                                            <p style="color: #444444;">
                                                歌诗达维多利亚号+超值礼包
                                            <p>
                                            <form action="showDetail.jsp" method=post>
                                                <input type="hidden"  name="xijie" value=3>
                                            <input  type="submit" value="立即抢购" class="btn btn-default btn-info">
                                        </form>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="panel-543233">
                    <div class="row clearfix">
                        <div class="col-md-4 column">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="thumbnail">
                                        <img alt="index_ticket_xitang.jpg" src="images/index/index_ticket_xitang.jpg" />
                                        <div class="caption">
                                            <h3>
                                                西塘古镇 &nbsp; <span style="color: #FF0000;"><b>¥78.01</b></span>
                                            </h3>
                                            <p style="color: #444444;">
                                                水墨西塘感受古镇千年的诗情画意
                                            </p>
                                            <p>
                                                <a class="btn btn-default btn-info" href="#">立即抢购</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 column">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="thumbnail">
                                        <img alt="index_ticket_qiandaohu.jpg" src="images/index/index_ticket_qiandaohu.jpg" />
                                        <div class="caption">
                                            <h3>
                                                千岛湖 &nbsp; <span style="color: #FF0000;"><b>¥30</b></span>
                                            </h3>
                                            <p style="color: #444444;">
                                                亲近大自然，放飞心情
                                            <p>
                                                <a class="btn btn-default btn-info" href="#">立即抢购</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 column">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="thumbnail">
                                        <img alt="index_ticket_hangzhouleyuan.jpg" src="images/index/index_ticket_hangzhouleyuan.jpg" />
                                        <div class="caption">
                                            <h3>
                                                杭州乐园 &nbsp; <span style="color: #FF0000;"><b>¥10</b></span>
                                            </h3>
                                            <p style="color: #444444;">
                                                长三角地区新一代综合性主题公园
                                            <p>
                                                <a class="btn btn-default btn-info" href="#">立即抢购</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3 column">
        <!--公告栏-->
        <div class="jumbotron" style="font-family: 微软雅黑">
            <h3>
                公告
            </h3>
            <p style="font-size: 10px"><a href="http://www.fmprc.gov.cn/ce/ceph/chn/sgdt/t1453007.htm">赴菲律宾薄荷岛旅游提示</a></p>
            <hr>
            <p style="font-size: 10px">客服电话：</p>
            <p style="font-size: 10px">15968180247</p>
        </div>
    </div>
</div>
<div class="row clearfix" style="background-color: whitesmoke">
    <br>
    <div class="col-md-4 column">
    </div>
    <div class="col-md-4 column" style="font-size: 10px;text-align: center">
        <p>copyright© 2016-2017 浙江A&F信息工程学院版权所有  </p>
        <p>经营许可证：苏A2-20110026 苏ICP备11017770号</p>
        <p style="font-size: 8px">联系我们 | 767293861@qq.com | 752261488</p>
    </div>
    <div class="col-md-4 column">
    </div>
</div>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
