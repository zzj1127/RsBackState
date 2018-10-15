<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/15
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<div role="tabpanel" class="tab-pane" id="regu" style="padding-top: 50px;">
    <div class="data-div">
        <div class="tablebody col-lg-10 col-lg-offset-1">
<c:forEach var="userList" items="${userList}">
            <div class="row">
                <div class="col-xs-3" style="padding-right: 0;">
                    <c:if test="${userList.userState==0}">
                        普通用户
                    </c:if>
                    <c:if test="${userList.userState==3}">
                        管理员
                    </c:if>
                    <c:if test="${userList.userState==1}">
                        游客(审核未通过)
                    </c:if>
                    <c:if test="${userList.userState==2}">
                        超级管理员
                    </c:if>

                </div>
                <div class="col-xs-2 expand-col">
                    <div class="slider-minmax1">
                    </div>
                    <div class="row top100">
                        <c:out value="${userList.username}"  />
                    </div>
                </div>
                <div class="col-xs-3">
                    <div class="slider-minmax1">
                    </div>
                    <c:out value="${userList.username}"  />
                </div>
                <div class="col-xs-3">
                    <div class="slider-minmax1">
                    </div>
                    <c:out value="${userList.email}"  />
                </div>
            </div>
</c:forEach>
            <div class="modal-footer">
                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal" onclick="window.open('../design/adminName.jsp','show')">继续查看权限</button>
                <button type="button" class="btn btn-xs btn-green" onclick="window.open('${pageContext.request.contextPath}/findAllAdmin','show')">回到主页</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
