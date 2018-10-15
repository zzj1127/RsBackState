<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/15
  Time: 15:58
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
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/slide.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
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
            <button class="btn btn-yellow btn-xs"  onclick="window.location.href='/beforeAdd'">添加资源 </button>
        </div>


    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-3 ">
                资源编号
            </div>
            <div class="col-xs-3">
                资源名
            </div>
            <div class="col-xs-3">
                提供者id
            </div>

            <div class="col-xs-3">
                操作
            </div>
        </div>
        <div class="tablebody">
<c:forEach var="resourceList" items="${resourceList}">
            <div class="row">
                <div class="col-xs-3 ">
                    ${resourceList.reid}
                </div>
                <div class="col-xs-3">
                        ${resourceList.rename}
                </div>
                <div class="col-xs-3">
                    <a href="/findUser?context=${resourceList.userid}">  ${resourceList.userid}</a>
                </div>
                <div class="col-xs-3">
                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#${resourceList.reid}">查看详情</button>
                    <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#delete${resourceList.reid}">删除资源</button>
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
            <a href="findAllResources?pageIndex=1" > <li class="gray">
                首页
            </li></a>



            <c:forEach begin="1" end="${pageUtil.pageCount}" var="i">
                <a href="/findAllResources?pageIndex=${i}" ><li class="gray"> ${i}</li></a>
            </c:forEach>

            <a href="/findAllResources?pageIndex=${pageUtil.pageIndex>1?pageUtil.pageIndex-1:1}" class='pre'><li  class="glyphicon glyphicon-menu-left"></li></a>
           <a href="/findAllResources?pageIndex=${pageUtil.pageIndex<pageUtil.pageCount?pageUtil.pageIndex+1:pageUtil.pageCount}" ><li  class="glyphicon glyphicon-menu-right"></li></a>
            <a href="/findAllResources?pageIndex=${pageUtil.pageCount}" ><li class="gray">末页</li></a>
        </ul>
    </footer>

    <!--弹出添加用户窗口-->
    <div class="modal fade" id="addResource" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加资源</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" name="frm">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-8 ">
                                    <input type="email" class="form-control input-sm duiqi" id="sName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">真实姓名：</label>
                                <div class="col-xs-8 ">
                                    <input type="" class="form-control input-sm duiqi" id="sLink" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">电子邮箱：</label>
                                <div class="col-xs-8">
                                    <input type="" class="form-control input-sm duiqi" id="sOrd" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">电话：</label>
                                <div class="col-xs-8">
                                    <input type="" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">总分类：</label>
                                <div class="col-xs-8">
                                    <select name="typeid" id="typeid"  onchange="changeselect1(this.value);" class=" form-control select-duiqi">
                                        <option value="">―请选择―</option>

                                        <c:forEach var="typeList" items="${typeList}">
                                            <option value="${typeList.typeid}"> ${typeList.typename}</option>
                                        </c:forEach>
                                    </select>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">细分类：</label>
                                <div class="col-xs-8">
                                    <select name="typeofnameid" id="typeofnameid"  class=" form-control select-duiqi" >
                                        <option value="">―请选择―</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="button" class="btn btn-xs btn-green">保 存</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
<c:forEach var="resourceList" items="${resourceList}">
    <!--弹出修改用户窗口-->

    <div class="modal fade" id="${resourceList.reid}" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">详细信息</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal" name="frm">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">资源名：</label>
                                <div class="col-xs-8 ">
                                    <input type="email" readonly="readonly" class="form-control input-sm duiqi" id="sName" placeholder="${resourceList.rename}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label" >迅雷：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" readonly="readonly" class="form-control input-sm duiqi" id="sLink" placeholder="${resourceList.thunder}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">百度网盘：</label>
                                <div class="col-xs-8">
                                    <input type="text" class="form-control input-sm duiqi" readonly="readonly" id="sOrd" placeholder="${resourceList.netdisk}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">网盘密码：</label>
                                <div class="col-xs-8">
                                    <input type="text" readonly="readonly" class="form-control input-sm duiqi" id="sKnot" placeholder=${resourceList.netdiskpwd}"">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">总分类：</label>
                                <div class="col-xs-8">
                                    <select name="typeid"   class=" form-control select-duiqi">
                                        <c:forEach var="typeList" items="${typeList}">
                                            <c:if test="${typeList.typeid==resourceList.typeid}">
                                            <option value="${typeList.typeid}"> ${typeList.typename}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>

                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">细分类：</label>
                                <div class="col-xs-8">
                                    <select name="typeofnameid"  class=" form-control select-duiqi" >
                                        <c:forEach var="typeOfNames" items="${typeOfNames}">
                                            <c:if test="${typeOfNames.typeofnameid==resourceList.typeofnameid}">
                                                <option value="${typeOfNames.typeofnameid}"> ${typeOfNames.typeofname}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->

        </div>
        <!-- /.modal-dialog -->
    </div>

    <!-- /.modal -->

    <!--弹出删除用户警告窗口-->
    <div class="modal fade" id="delete${resourceList.reid}" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        确定要删除名为${resourceList.rename}资源？删除后不可恢复！
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="button" class="btn  btn-xs btn-danger" onclick="window.location.href='/deleteRe?reid=${resourceList.reid}'">保 存</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</c:forEach>
</div>
<script>
    var subcat = new Array();
    <c:set value="0" var="i" />
    <c:forEach var="typeOfNames" items="${typeOfNames}">
    subcat[${i}]=new Array("${typeOfNames.typeid}","${typeOfNames.typeofname}","${typeOfNames.typeofnameid}")
    <c:set value="${i+1}" var="i" />
    </c:forEach>
var typeofnameid=document.getElementById("typeofnameid");
    function changeselect1(locationid)
    {
       typeofnameid.length = 1; //初始化下拉列表 清空下拉数据

        for (i=0; i<subcat.length; i++)
        {

            if (subcat[i][0] == locationid) //[0] [1] 第一列 第二列
            {

               typeofnameid.options[typeofnameid.length]= new Option(subcat[i][1], subcat[i][2]);

            } //建立option

        }
    }
</script>
</body>

</html>
