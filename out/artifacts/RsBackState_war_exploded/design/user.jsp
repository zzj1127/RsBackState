<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/9
  Time: 13:56
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
            background-color: #eff3f6; overflow-x: hidden;
        }
    </style>
</head>
<body>

<div role="tabpanel" class="tab-pane" id="user">
    <div class="check-div form-inline">
        <div class="col-xs-3">
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加用户 </button>
        </div>
        <div class="col-xs-4">
            <form action="/findUser" method="post">
                <input type="text" name="context" class="form-control input-sm" placeholder="输入文字搜索">
                <button type="submit" class="btn btn-white btn-xs ">查 询 </button>
            </form>
        </div>

    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-2 ">
                头像
            </div>
            <div class="col-xs-2">
                用户名
            </div>
            <div class="col-xs-2">
                真实姓名
            </div>
            <div class="col-xs-2">
                电话
            </div>
            <div class="col-xs-2">
                状态
            </div>
            <div class="col-xs-2">
                操作
            </div>
        </div>
        <div class="tablebody">
            <c:forEach var="userList" items="${userList}">
            <div class="row">
                <div class="col-xs-2 ">
                    <img src="http://ntzj126.cn/img/<c:out value="${userList.userimg}" />" width="50px" height="50px" />
                </div>
                <div class="col-xs-2">
                    <c:out value="${userList.username}" />
                </div>
                <div class="col-xs-2">
                    <c:out value="${userList.realname}" />
                </div>
                <div class="col-xs-2">
                    <c:out value="${userList.userPhone}" />
                </div>
                <div class="col-xs-2">
                    <c:if test="${userList.userState==0}">
普通用户
                    </c:if>
                    <c:if test="${userList.userState==3}">
                      管理员
                    </c:if>
                    <c:if test="${userList.userState==1}">
                        游客(正在审核)
                    </c:if>
                    <c:if test="${userList.userState==2}">
                       超级管理员
                    </c:if>
                    <c:if test="${userList.userState==4}">
                        审核未通过
                    </c:if>
                </div>
                <div class="col-xs-2">
                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#${userList.userId}">修改</button>
                    <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser${userList.userId}">删除</button>
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
            <a href="findAllUsers?pageIndex=1" > <li class="gray">
                首页
            </li></a>



            <c:forEach begin="1" end="${pageUtil.pageCount}" var="i">
                <a href="/findAllUsers?pageIndex=${i}" ><li class="gray"> ${i}</li></a>
            </c:forEach>

            <a href="/findAllUsers?pageIndex=${pageUtil.pageIndex>1?pageUtil.pageIndex-1:1}" class='pre'><li  class="glyphicon glyphicon-menu-left"></li></a>
            <a href="/findAllUsers?pageIndex=${pageUtil.pageIndex<pageUtil.pageCount?pageUtil.pageIndex+1:pageUtil.pageCount}" ><li  class="glyphicon glyphicon-menu-right"></li></a>
            <a href="/findAllUsers?pageIndex=${pageUtil.pageCount}" ><li class="gray">末页</li></a>
        </ul>
    </footer>

    <!--弹出添加用户窗口-->
    <div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
                </div>
                <form class="form-horizontal" action="/register" method="post">
                <div class="modal-body">
                    <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" class="form-control input-sm duiqi" name="username" id="sName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" class="form-control input-sm duiqi" name="realname" id="sLink" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
                                <div class="col-xs-8">
                                    <input type="Email" class="form-control input-sm duiqi" name="email" id="sOrd" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">电话：</label>
                                <div class="col-xs-8">
                                    <input type="Phone" class="form-control input-sm duiqi" name="userPhone" id="sKnot" placeholder="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">权限：</label>
                                <div class="col-xs-8">
                                    <select class=" form-control select-duiqi" name="userState">
                                        <option value="3">管理员</option>
                                        <option value="0">普通用户</option>
                                        <option value="1">游客</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="situation" class="col-xs-3 control-label">性别：</label>
                                <div class="col-xs-8">
                                    <label class="control-label" for="anniu">
                                        <input type="radio" name="sex" id="normal" value="男">男</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="control-label" for="meun">
                                        <input type="radio" name="sex" id="forbid" value="女">女</label>
                                </div>
                            </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="submit" class="btn btn-xs btn-green">保 存</button>
                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!--弹出修改用户窗口-->
<c:forEach var="userList" items="${userList}">
    <div class="modal fade" id="${userList.userId}" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
                </div>
                <form class="form-horizontal" action="/changeUserInfo" method="post">
                <div class="modal-body">


                    <div class="container-fluid">

                            <div class="form-group ">
                                <input type="hidden" name="userId" value="${userList.userId}">
                                <label for="sName" class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" class="form-control input-sm duiqi" name="username" id="sName" value="<c:out value="${userList.username}" />">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
                                <div class="col-xs-8 ">
                                    <input type="name" class="form-control input-sm duiqi" name="realname" id="sLink"value="<c:out value="${userList.realname}" />">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
                                <div class="col-xs-8">
                                    <input type="email" class="form-control input-sm duiqi" name="email" id="sOrd" value="<c:out value="${userList.email}" />">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">电话：</label>
                                <div class="col-xs-8">
                                    <input type="Phone" class="form-control input-sm duiqi" id="sKnot" name="userPhone" value="<c:out value='${userList.userPhone}' />">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">权限：</label>
                                <div class="col-xs-8">
                                    <select class=" form-control select-duiqi" name="userState">
                                        <c:if test="${userList.userState==3}">
                                        {
                                        <option value="3" selected="selected">管理员</option>
                                        <option value="0">普通用户</option>
                                        <option value="1">游客</option>
                                        }</c:if>

                                        <c:if test="${userList.userState==1}">
                                            {
                                            <option value="3" >管理员</option>
                                            <option value="0">普通用户</option>
                                            <option value="1" selected="selected">游客</option>
                                            }</c:if>
                                        <c:if test="${userList.userState==0}">
                                            {
                                            <option value="3" >管理员</option>
                                            <option value="0" selected="selected">普通用户</option>
                                            <option value="1">游客</option>
                                            }</c:if>
                                    </select>
                                </div>

                            </div>
                            <div class="form-group">
                                <label for="situation" class="col-xs-3 control-label">性别：</label>
                                <div class="col-xs-8">
                                    <label class="control-label" for="anniu">
                                        <input type="radio" name="sex" value="男" id="normal">男</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="control-label" for="meun">
                                        <input type="radio" name="sex" value="女" id="forbid">女</label>
                                </div>
                            </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="submit" class="btn btn-xs btn-green" >保 存</button>
                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!--弹出删除用户警告窗口-->
    <div class="modal fade" id="deleteUser${userList.userId}" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>

                <div class="modal-body">
                    <div class="container-fluid">
                        确定要删除用户名${userList.username}吗？删除后不可恢复！
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="submit" class="btn  btn-xs btn-danger"onclick="window.location.href='/delete?userId=${userList.userId}'">保 存</button>
                </div>
            </div>

            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</c:forEach>
</div>

</body>
</html>
