<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/18
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
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
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/slide.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/jquery.nouislider.css">
    <style>
        body{
            background-color: #eff3f6;overflow-x: hidden;
        }
    </style>
</head>
<body>
<div role="tabpanel" class="tab-pane" id="stud">
    <div class="check-div form-inline">
        <div class="col-xs-5">
            <input type="text" class=" form-control input-sm" placeholder="输入文字搜索" style="	!height: 40px!important;">
            <button class="btn btn-white btn-xs ">查 询 </button>
        </div>


    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-2 ">
                序号
            </div>
            <div class="col-xs-1 ">
                资源名
            </div>
            <div class="col-xs-2">
                评论者
            </div>
            <div class="col-xs-2">
                评论内容
            </div>
            <div class="col-xs-2 ">
                评论时间
            </div>
            <div class="col-xs-1">
                操作
            </div>
        </div>
        <div class="tablebody">
            <c:set var="index" value="0" />
<c:forEach var="commtlist" items="${commtlist}">
    <c:set var="index" value="${index+1}" />
            <div class="row">
                <div class="col-xs-2 ">
                        ${index}
                </div>
                <div class="col-xs-1">
    <c:forEach var="resourcesList" items="${resourcesList}">
        <c:if test="${resourcesList.reid== commtlist.reid }">
                   ${resourcesList.rename}
        </c:if>
    </c:forEach>
                </div>
                <div class="col-xs-2">
                    <c:forEach var="userList" items="${userList}">
                        <c:if test="${userList.userId== commtlist.userid }">
                            ${userList.username}
                        </c:if>
                    </c:forEach>

                </div>
                <div class="col-xs-2">
                        ${commtlist.comment}
                </div>
                <div class="col-xs-2">
                        ${commtlist.commenttime}
                </div>

                <div class="col-xs-1">
                    <button class="btn btn-danger btn-xs" onclick="window.location.href='/deleteComnment?commentid=${commtlist.commentid}'" >删除评论 </button>
                </div>
            </div>
</c:forEach>
        </div>

    </div>
    <!--页码块-->
    <footer class="footer">
        <ul class="pagination">
            <li>
                共${pageUtil.pageNumber}条 ,
            </li>
            <li>
                当前第${pageUtil.pageIndex}页
            </li>
            <a href="findAllComnment?pageIndex=1" > <li class="gray">
                首页
            </li></a>



            <c:forEach begin="1" end="${pageUtil.pageCount}" var="i">
                <a href="/findAllComnment?pageIndex=${i}" ><li class="gray"> ${i}</li></a>
            </c:forEach>

            <a href="/findAllComnment?pageIndex=${pageUtil.pageIndex>1?pageUtil.pageIndex-1:1}" class='pre'><li  class="glyphicon glyphicon-menu-left"></li></a>
            <a href="/findAllComnment?pageIndex=${pageUtil.pageIndex<pageUtil.pageCount?pageUtil.pageIndex+1:pageUtil.pageCount}" ><li  class="glyphicon glyphicon-menu-right"></li></a>
            <a href="/findAllComnment?pageIndex=${pageUtil.pageCount}" ><li class="gray">末页</li></a>
        </ul>
    </footer>


    <!--弹出删除违约记录警告窗口-->
   <!-- /.modal -->

</div>

</body>
</html>
