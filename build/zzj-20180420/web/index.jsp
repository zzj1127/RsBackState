<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/8
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ch">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="左右结构项目，属于大人员的社交工具">
  <meta name="keywords" content=" ">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <title>后台管理</title>
  <script src="../js/jquery.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script>
      $(function() {
          $(".meun-item").click(function() {
              $(".meun-item").removeClass("meun-item-active");
              $(this).addClass("meun-item-active");
              var itmeObj = $(".meun-item").find("img");
              itmeObj.each(function() {
                  var items = $(this).attr("src");
                  items = items.replace("_grey.png", ".png");
                  items = items.replace(".png", "_grey.png")
                  $(this).attr("src", items);
              });
              var attrObj = $(this).find("img").attr("src");
              ;
              attrObj = attrObj.replace("_grey.png", ".png");
              $(this).find("img").attr("src", attrObj);
          });
          $("#topAD").click(function() {
              $("#topA").toggleClass(" glyphicon-triangle-right");
              $("#topA").toggleClass(" glyphicon-triangle-bottom");
          });
          $("#topBD").click(function() {
              $("#topB").toggleClass(" glyphicon-triangle-right");
              $("#topB").toggleClass(" glyphicon-triangle-bottom");
          });
          $("#topCD").click(function() {
              $("#topC").toggleClass(" glyphicon-triangle-right");
              $("#topC").toggleClass(" glyphicon-triangle-bottom");
          });
          $(".toggle-btn").click(function() {
              $("#leftMeun").toggleClass("show");
              $("#rightContent").toggleClass("pd0px");
          })
      })
  </script>
  <!--[if lt IE 9]>
  <script src="../js/html5shiv.min.js"></script>
  <script src="../js/respond.min.js"></script>
  <![endif]-->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="../css/common.css" />
  <link rel="stylesheet" type="text/css" href="../css/slide.css" />
  <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css" />
  <link rel="stylesheet" type="text/css" href="../css/jquery.nouislider.css">
  <style>
    body{margin:0; padding:0;
      overflow-y: hidden;
    }


  </style>
</head>

<body>
<div id="wrap">
  <!-- 左侧菜单栏目块 -->
  <div class="leftMeun" id="leftMeun">
    <div id="logoDiv">
      <p id="logoP"><img id="logo" alt="后台管理" src="images/logo.png"><span>后台管理</span></p>
    </div>
    <div id="personInfor">
<c:if test="${!empty user1}">

  <p id="userName"><img id="link" src="http://ntzj126.cn/img/<c:out value='${user1.getUserimg()}'/>"  width="50px" height="50px"/>
    &nbsp;&nbsp;&nbsp;
      <c:out value='${user1.realname}'/> <p><a href="/exit">exit</a></p></p>


    <p>

  </p>
</c:if>
  <c:if test="${empty user1}">
      <form action="${pageContext.request.contextPath}/login" method="post">
        <p><input type="text" name="username" placeholder="用户名"></p>
        <p><input type="password"  name="password" placeholder="密码"></p>
        <p><input type="submit" value="登录"> ${msg}</p>
      </form>
  </c:if>
    </div>
    <div class="meun-title">用户管理</div>

    <div class="meun-item meun-item-active"  onclick="window.open('${pageContext.request.contextPath}/findAllAdmin','show')"   aria-controls="char" role="tab" data-toggle="tab"><a><img src="images/icon_chara_grey.png">管理员管理</a></div>
    <div class="meun-item" onclick="window.open('${pageContext.request.contextPath}/findvisitor','show')" aria-controls="regu" role="tab" data-toggle="tab"><a><img src="images/icon_rule_grey.png">游客管理</a></div>
    <div class="meun-item" onclick="window.open('${pageContext.request.contextPath}/findAllUsers','show')"  aria-controls="user" role="tab" data-toggle="tab"><a><img src="images/icon_user_grey.png">用户管理</a></div>

    <c:if test="${!   empty user1}">
    <div class="meun-item"onclick="window.open('/design/changepwd.jsp','show')" aria-controls="chan" role="tab" data-toggle="tab"><a><img src="images/icon_change_grey.png">修改密码</a></div>
</c:if>
  <div class="meun-title">资源管理</div>
    <div class="meun-item " onclick="window.open('${pageContext.request.contextPath}/findAllResources','show')"  aria-controls="sour" role="tab" data-toggle="tab"><a><img src="images/icon_source.png">资源管理</a></div>
    <div class="meun-item" onclick="window.open('${pageContext.request.contextPath}/findAllClassify','show')" aria-controls="scho" role="tab" data-toggle="tab"><a><img src="images/icon_house_grey.png">分类管理</a></div>
    <div class="meun-title">评论管理</div>
    <div class="meun-item" onclick="window.open('${pageContext.request.contextPath}/findAllComnment','show')" aria-controls="char" role="tab" data-toggle="tab"><a><img src="images/icon_chara_grey.png">评论管理</a></div>

  </div>
  <!-- 右侧具体内容栏目 -->
  <div id="rightContent">
    <a class="toggle-btn" id="nimei">
      <i class="glyphicon glyphicon-align-justify"></i>
    </a>
    <!-- Tab panes -->
    <iframe src="${pageContext.request.contextPath}/findAllAdmin" id="iframepage" name="show" width="100%" onload="changeFrameHeight()"id="myiframe" scrolling="auto" >

    </iframe>
   </div>
  </div>
</div>
<script>
    function changeFrameHeight(){
        var ifm= document.getElementById("iframepage");
        ifm.height=document.documentElement.clientHeight;

    }

    window.onresize=function(){
        changeFrameHeight();
    }
</script>
<!-- 滑块js -->
<!--	<script type="text/javascript">
        scale = function(btn, bar, title, unit) {
                this.btn = document.getElementById(btn);
                this.bar = document.getElementById(bar);
                this.title = document.getElementById(title);
                this.step = this.bar.getElementsByTagName("div")[0];
                this.unit = unit;
                this.init();
        };
        scale.prototype = {
                init: function() {
                        var f = this,
                                g = document,
                                b = window,
                                m = Math;
                        f.btn.onmousedown = function(e) {
                                var x = (e || b.event).clientX;
                                var l = this.offsetLeft;
//						var max = f.bar.offsetWidth - this.offsetWidth;
                                var max = f.bar.offsetWidth-20 ;
                                g.onmousemove = function(e) {
                                        var thisX = (e || b.event).clientX;
                                        var to = m.min(max, m.max(-2, l + (thisX - x)));
                                        f.btn.style.left = to+ 'px';
                                        f.ondrag(m.round(m.max(0, to / max) * 100), to);
                                        b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
                                };
                                g.onmouseup = new Function('this.onmousemove=null');
                        };
                },
                ondrag: function(pos, x) {
                        this.step.style.width = Math.max(0, x) +2+ 'px';
                        this.title.innerHTML = pos / 10 + this.unit + "";
                }
        }
        new scale('btn0', 'bar0', 'title0', "分钟");
        new scale('btn1', 'bar1', 'title1', "分钟");
        new scale('btn2', 'bar2', 'title2', "天");
        new scale('btn3', 'bar3', 'title3', "次");
</script>
-->
<script src="../js/jquery.nouislider.js"></script>

<!-- this page specific inline scripts -->
<script>
    var ifm= document.getElementById("myiframe");
    ifm.height=document.documentElement.clientHeight;
</script>
<script>
    //min/max slider
    function huadong(my, unit, def, max) {
        $(my).noUiSlider({
            range: [0, max],
            start: [def],
            handles: 1,
            connect: 'upper',
            slide: function() {
                var val = Math.floor($(this).val());
                $(this).find(".noUi-handle").text(
                    val + unit
                );
                console.log($(this).find(".noUi-handle").parent().parent().html());
            },
            set: function() {
                var val = Math.floor($(this).val());
                $(this).find(".noUi-handle").text(
                    val + unit
                );
            }
        });
        $(my).val(def, true);
    }
    huadong('.slider-minmax1', "分钟", "5", 30);
    huadong('.slider-minmax2', "分钟", "6", 15);
    huadong('.slider-minmax3', "分钟", "10", 60);
    huadong('.slider-minmax4', "次", "2", 10);
    huadong('.slider-minmax5', "天", "3", 7);
    huadong('.slider-minmax6', "天", "8", 10);
</script>
</body>

</html>
