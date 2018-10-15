<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/17
  Time: 12:49
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
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/slide.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/jquery.nouislider.css">
    <style>
        body{
            background-color: #eff3f6;
            overflow-x: hidden;
        }
    </style>
</head>
<body>
<div role="tabpanel" class="tab-pane" id="sitt">

    <div class="check-div form-inline" style="">
        <div class="col-lg-4 col-xs-7 col-md-6">
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addB">添加分类 </button>
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addA">修改分类 </button>
        </div>

    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-2 "style="padding-left: 20px;">
                总分类名称
            </div>
            <div class="col-xs-3"style="padding-left: 20px;">
                细分类名称
            </div>
            <div class="col-xs-2" style="padding-left: 2px;">
                细分类id
            </div>
            <div class="col-xs-2">
                总分类id
            </div>
            <div class="col-xs-3">
                分类设置
            </div>
        </div>
        <div class="tablebody">
            <c:forEach var="typeList" items="${typeList}">
                <c:set value="0" var="flag"></c:set>
                <c:set value="0" var="flag1"></c:set>
            <div class="sitTable">
                <table class="table  table-responsive" >
<tr>
                    <td valign="middle" class="col-xs-2" rowspan="12">${typeList.typename}</td>

</tr>
                <c:forEach var="typeOfNameList" items="${typeOfNameList}">

                    <c:if test="${typeOfNameList.typeid==typeList.typeid }">

                    <c:set var="flag" value="${flag+1}"/>
                    </c:if>
                </c:forEach>
                    <c:forEach var="typeOfNameList" items="${typeOfNameList}">
                       <c:if test="${typeOfNameList.typeid==typeList.typeid }">
                    <tr>
                        <td class="col-xs-3">${typeOfNameList.typeofname}</td>
                        <td class="col-xs-2">${typeOfNameList.typeofnameid}</td>
                        <td class="col-xs-2" style="padding-left: 40px!important;">${typeOfNameList.typeid}</td>
                        <td class="col-xs-3"style="padding-left: 50px!important;">

                            <button class="btn btn-xs" data-toggle="modal" data-target="#revise${typeOfNameList.typeofnameid}">修改细分类</button>
                            <button class="btn  btn-xs" data-toggle="modal" data-target="#delete${typeOfNameList.typeid}">添加细分类</button>
                        </td>
                    </tr>
                       </c:if>
                        <c:if test="${flag==0 and flag1<1}">
                            <c:set var="flag1" value="${flag1+1}"/>
                            <tr>
                                <td class="col-xs-3"></td>
                                <td class="col-xs-2"></td>
                                <td class="col-xs-2" style="padding-left: 40px!important;"></td>
                                <td class="col-xs-3"style="padding-left: 50px!important;">


                                    <button class="btn  btn-xs" data-toggle="modal" data-target="#delete${typeList.typeid}">添加细分类</button>
                                </td>
                            </tr>

                       </c:if>
                    </c:forEach>

                </table>
            </div>
            </c:forEach>
        </div>

    </div>
    <!--页码块-->

    <!--弹出添加分类窗口-->
    <div class="modal fade" id="addA" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改分类</h4>
                </div>
                <form class="form-horizontal" action="/updatetype" method="post">
                    <div class="modal-body">
                        <div class="container-fluid">

                            <div class="form-group ">
                                <label for="sKnot" class="col-xs-3 control-label">选择分类：</label>
                                <div class="col-xs-8">
                                    <select name="typeid" id="typeid"  class="form-control select-duiqi">
                                        <option value="">―请选择―</option>
                                        <c:forEach var="typeList" items="${typeList}">
                                            <option value="${typeList.typeid}"> ${typeList.typename}</option>
                                        </c:forEach>
                                    </select>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">分类名称：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" name="typename" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">分类备注：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" name="typedesc" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                        <input type="submit" class="btn btn-xs btn-green"value="修改"/>
                    </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal --
    <!--弹出添加分类窗口-->
    <div class="modal fade" id="addB" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加分类</h4>
                </div>
                <form class="form-horizontal" action="/addtype" method="post">
                <div class="modal-body">
                    <div class="container-fluid">

                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">名称：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" name="typename" class="form-control input-sm duiqi" id="sName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">备注：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" name="typedesc" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                </div>
                            </div>


                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <input type="submit" class="btn btn-xs btn-green"value="添加"/>
                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!--弹出修改细分类窗口-->
<c:forEach var="typeOfNameList" items="${typeOfNameList}">

    <div class="modal fade" id="revise${typeOfNameList.typeofnameid}" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改细分类</h4>
                </div>
                <form class="form-horizontal"  action="${pageContext.request.contextPath}/changeTon" method="post">
                <div class="modal-body">

                    <div class="container-fluid">

                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">细分类id：</label>
                                <div class="col-xs-7">
                                    <input type="text" readonly="readonly" name="typeofnameid" class="form-control input-sm duiqi" id="sKnot" value="${typeOfNameList.typeofnameid}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">名称：</label>
                                <div class="col-xs-7">
                                    <input type="text" class="form-control input-sm duiqi" name="typeofname" id="sKnot" value="${typeOfNameList.typeofname}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">总分类：</label>
                                <div class="col-xs-7">
                                    <select name="typeid" id="typeid" class=" form-control select-duiqi">
                                        <option value="">―请选择―</option>

                                        <c:forEach var="typeList" items="${typeList}">
                                            <c:choose>
                                            <c:when test="${typeList.typeid==typeOfNameList.typeid}">
                                            <option value="${typeList.typeid}" selected="selected"> ${typeList.typename}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${typeList.typeid}" > ${typeList.typename}</option>
                                            </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    </select>

                                </div>
                            </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <input type="submit" class="btn btn-xs btn-green" value="保存"/>
                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</c:forEach>
    <!-- /.modal -->
    <!--弹出添加细分类警告窗口-->
<c:forEach var="typeList" items="${typeList}">
    <div class="modal fade" id="delete${typeList.typeid}" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加${typeList.typename}的细分类</h4>
                </div>
                <form action="/addTon" method="post">
                <div class="modal-body">
                            <input type="hidden"  name="typeid"  value="${typeList.typeid}">

                    <div class="form-group">
                        <label for="sKnot" class="col-xs-4 control-label">细分类名称：</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control input-sm duiqi" name="typeofname" id="sKnot" >
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <input type="submit" class="btn btn-green btn-xs" value="保存">
                </div>
                </form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</c:forEach>
    <!-- /.modal -->
</div>

</body>
</html>

