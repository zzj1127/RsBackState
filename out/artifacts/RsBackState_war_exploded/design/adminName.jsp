<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/15
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
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
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/slide.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/jquery.nouislider.css">
    <style>
        body{
            background-color: #eff3f6; overflow-x: hidden;
        }
    </style>
</head>
<body>
<div role="tabpanel" class="tab-pane" id="sitDetail">
    <div class="check-div form-inline">
        <a href="${pageContext.request.contextPath}/findAllAdmin" aria-controls="sitt" role="tab" data-toggle="tab" style="cursor: pointer;"><span class="glyphicon glyphicon glyphicon-chevron-left"></span>&nbsp;&nbsp;返回上一页</a>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-3 ">
                权限代码
            </div>
            <div class="col-xs-3 ">
                权限名称
            </div>
            <div class="col-xs-2 ">
                人员列表
            </div>
            <div class="col-xs-3 ">
                功能
            </div>
        </div>
        <div class="tablebody">

            <div class="row">
                <div class="col-xs-3 ">
                    0
                </div>
                <div class="col-xs-3">
                    普通用户
                </div>
                <div class="col-xs-2">
                    <a class="linkCcc" href="${pageContext.request.contextPath}/selectAdmin?userState=0">查看</a>
                </div>
                <div class="col-xs-3 ">
                    可以上传、评论、查询等使用基础功能
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 ">
                    1
                </div>
                <div class="col-xs-3">
                    游客
                </div>
                <div class="col-xs-2">
                    <a class="linkCcc" href="${pageContext.request.contextPath}/selectAdmin?userState=1">查看</a>
                </div>
                <div class="col-xs-3 ">
                    管理员正在审核，只能查看资源
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 ">
                    2
                </div>
                <div class="col-xs-3">
                    超级管理员
                </div>
                <div class="col-xs-2">
                    <a class="linkCcc" href="${pageContext.request.contextPath}/selectAdmin?userState=2">查看</a>
                </div>
                <div class="col-xs-3 ">
                   具有所有功能和管理管理员
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 ">
                    3
                </div>
                <div class="col-xs-3">
                    管理员
                </div>
                <div class="col-xs-2">
                    <a class="linkCcc" href="${pageContext.request.contextPath}/selectAdmin?userState=3">查看</a>
                </div>
                <div class="col-xs-4 ">
                    具有所有功能以及管理用户和审查等权限
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 ">
                    4
                </div>
                <div class="col-xs-3">
                    游客审核未通过
                </div>
                <div class="col-xs-2">
                    <a class="linkCcc" href="${pageContext.request.contextPath}/selectAdmin?userState=4">查看</a>
                </div>
                <div class="col-xs-3 ">
                没有通过管理员审核，只能查看资源
            </div>
            </div>
        </div>

    </div>
    <!--页码块-->

</div>

</body>
</html>

