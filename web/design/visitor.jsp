<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/14
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

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

<!-- 权限管理模块 -->
<div role="tabpanel" class="tab-pane" id="char">

    <div class="check-div">
        <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="addChar"  onclick=" window.open('../design/adminName.jsp','show')">查看权限</button>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-4 ">
                用户id
            </div>
            <div class="col-xs-1">
                用户名
            </div>
            <div class="col-xs-5">
                邮箱
            </div>

            <div class="col-xs-2">
                操作
            </div>
        </div>
        <div class="tablebody">
<c:forEach var="userList" items="${userList}">
            <div class="row">

                <div class="col-xs-4 ">
                   ${userList.userId}
                </div>
                <div class="col-xs-1">
                    </span><span>${userList.username}</span>
                </div>
                <div class="col-xs-5">
                        ${userList.email}
                </div>
                <div class="col-xs-2">
<input type="hidden" value="${user1.userState}" id="state">
                    <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteChar" onclick="check('/changevisitor?userId=${userList.userId}')">删除该游客</button>
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
            <a href="findvisitor?pageIndex=1" > <li class="gray">
                首页
            </li></a>



            <c:forEach begin="1" end="${pageUtil.pageCount}" var="i">
                <a href="/findvisitor?pageIndex=${i}" ><li class="gray"> ${i}</li></a>
            </c:forEach>

          <a href="/findvisitor?pageIndex=${pageUtil.pageIndex>1?pageUtil.pageIndex-1:1}" class='pre'><li  class="glyphicon glyphicon-menu-left"></li></a>
          <a href="/findvisitor?pageIndex=${pageUtil.pageIndex<pageUtil.pageCount?pageUtil.pageIndex+1:pageUtil.pageCount}" ><li  class="glyphicon glyphicon-menu-right"></li></a>
            <a href="/findvisitor?pageIndex=${pageUtil.pageCount}" ><li class="gray">末页</li></a>
        </ul>
    </footer>

</div>
</body>
<script>
    function check(url) {
        var state=document.getElementById("state").value;
        console.log(state)
        if(state==2||state==3){
            window.open(url,'show')
        }
        else {
            alert('您没有权限');
        }
    }
</script>
</html>

