<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/21
  Time: 14:53
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
    <script src="js/bootstrap.min.js"></script>
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
            background-color: #eff3f6;overflow-x: hidden;
        }
    </style>
</head>
<body>
<div role="tabpanel" class="tab-pane" id="sitDetail">
    <div class="check-div form-inline">
        <span href="${pageContext.request.contextPath}/findAllAdmin" aria-controls="sitt" role="tab" data-toggle="tab" style="cursor: pointer;"><span class="glyphicon glyphicon glyphicon-chevron-left"></span>&nbsp;&nbsp;返回上一页</span>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-2 ">
                资源名
            </div>
            <div class="col-xs-2 ">
                迅雷
            </div>
            <div class="col-xs-2 ">
                百度网盘
            </div>
            <div class="col-xs-2 ">
                网盘密码
            </div>
            <div class="col-xs-1 ">
                总分类
            </div>
            <div class="col-xs-1 ">
                细分类
            </div>
            <div class="col-xs-2 ">
                图像
            </div>
        </div>
        <div class="tablebody">

    <%--1--%>
        <form  action="${pageContext.request.contextPath}/addRe" method="post"  enctype="multipart/form-data">
            <div class="row">

                <div class="col-xs-2 ">

                    <input type="text" name="rename" class=" input-sm "/>

                </div>

                <div class="col-xs-2 ">
                    <input type="text" name="thunder" class=" input-sm "/>
                </div>

                <div class="col-xs-2 ">
                    <input type="text" name="netdisk" class=" input-sm "/>
                </div>

                <div class="col-xs-2 ">
                    <input type="text" name="netdiskpwd" class=" input-sm " />
                </div>
                <input type="hidden" name="userid"  value="${user1.userId}">
                <div class="col-xs-1 ">
                    <select name="typeid" id="typeid"  onchange="changeselect1(this.value);" >

                        <option value="">请选择</option>
                        <c:forEach var="typeList" items="${typeList}">
                            <option value="${typeList.typeid}"> ${typeList.typename}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-xs-1 ">
                    <select name="typeofnameid" id="typeofnameid"  >
                        <option value="">请选择</option>
                    </select>
                </div>

                <div class="col-xs-2 ">
                    <div class=" input-sm " style="padding-top:23px ;">
                        <input type="file" name="file"  style="width: 132px;" />
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="reset" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="submit" class="btn btn-xs btn-green">保 存</button>
            </div>
        </form>
    <%--2--%>
        <form action="/addre" method="post"  enctype="multipart/form-data">
            <div class="row">
                <input type="hidden" name="userid"  value="${user1.userId}">
                <div class="col-xs-2 ">

                    <input type="text" name="rename" class=" input-sm "/>

                </div>

                <div class="col-xs-2 ">
                    <input type="text" name="thunder" class=" input-sm "/>
                </div>

                <div class="col-xs-2 ">
                    <input type="text" name="netdisk" class=" input-sm "/>
                </div>

                <div class="col-xs-2 ">
                    <input type="text"  name="netdiskpwd" class=" input-sm " />
                </div>

                <div class="col-xs-1 ">
                    <select name="typeid" id="typeid1"  onchange="changeselect2(this.value);" >

                        <option value="">请选择</option>
                        <c:forEach var="typeList" items="${typeList}">
                            <option value="${typeList.typeid}"> ${typeList.typename}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-xs-1 ">
                    <select name="typeofnameid" id="typeofnameid1"  >
                        <option value="">请选择</option>
                    </select>
                </div>

                <div class="col-xs-2 ">

                    <div class=" input-sm " style="padding-top:23px ;">
                        <input type="file" name="file"  multiple class="file-loading" style="width: 132px;" />
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button type="reset" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                <button type="submit" class="btn btn-xs btn-green">保 存</button>
            </div>
        </form>
    <%--3--%>
            <form action="/addre" method="post"  enctype="multipart/form-data">
            <div class="row">
                <input type="hidden" name="userid"  value="${user1.userId}">
                <div class="col-xs-2 ">

                    <input type="text" name="rename"  class=" input-sm "/>

                </div>

                <div class="col-xs-2 ">
                    <input type="text" name="thunder" class=" input-sm "/>
                </div>

                <div class="col-xs-2 ">
                    <input type="text" name="netdisk" class=" input-sm "/>
                </div>

                <div class="col-xs-2 ">
                    <input type="text" name="netdiskpwd" class=" input-sm " />
                </div>

                <div class="col-xs-1 ">
                    <select name="typeid" id="typeid2"  onchange="changeselect3(this.value);" >

                        <option value="">请选择</option>
                        <c:forEach var="typeList" items="${typeList}">
                            <option value="${typeList.typeid}"> ${typeList.typename}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-xs-1 ">
                    <select name="typeofnameid" id="typeofnameid2"  >
                        <option value="">请选择</option>
                    </select>
                </div>

                <div class="col-xs-2 ">

                    <div class=" input-sm " style="padding-top:23px ;">
                        <input type="file" name="file"  multiple class="file-loading" style="width: 132px;" />
                    </div>
                </div>

            </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button type="submit" class="btn btn-xs btn-green">保 存</button>
                </div>
            </form>
    <%--4--%>
                <form action="/addre" method="post"  enctype="multipart/form-data">
            <div class="row">
                <input type="hidden" name="userid"  value="${user1.userId}">
        <div class="col-xs-2 ">

            <input type="text" name="rename"  class=" input-sm "/>

        </div>

        <div class="col-xs-2 ">
            <input type="text" name="thunder" class=" input-sm "/>
        </div>

        <div class="col-xs-2 ">
            <input type="text" name="netdisk" class=" input-sm "/>
        </div>

        <div class="col-xs-2 ">
            <input type="text" name="netdiskpwd" class=" input-sm " />
        </div>

        <div class="col-xs-1 ">
            <select name="typeid" id="typeid3"  onchange="changeselect4(this.value);" >

                <option value="">请选择</option>
                <c:forEach var="typeList" items="${typeList}">
                    <option value="${typeList.typeid}"> ${typeList.typename}</option>
                </c:forEach>
            </select>
        </div>

        <div class="col-xs-1 ">
            <select name="typeofnameid" id="typeofnameid3"  >
                <option value="">请选择</option>
            </select>
        </div>

        <div class="col-xs-2 ">

            <div class=" input-sm " style="padding-top:23px ;">
                <input type="file" name="file" multiple class="file-loading" style="width: 132px;" />
            </div>
        </div>

    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                        <button type="submit" class="btn btn-xs btn-green">保 存</button>
                    </div>
                </form>
    <%--5--%>
                    <form action="/addre" method="post"  enctype="multipart/form-data">
             <div class="row">
                 <input type="hidden" name="userid"  value="${user1.userId}">
        <div class="col-xs-2 ">

            <input type="text" name="rename" class=" input-sm "/>

        </div>

        <div class="col-xs-2 ">
            <input type="text" name="thunder" class=" input-sm "/>
        </div>

        <div class="col-xs-2 ">
            <input type="text" name="netdisk" class=" input-sm "/>
        </div>

        <div class="col-xs-2 ">
            <input type="text" name="netdiskpwd" class=" input-sm " />
        </div>

        <div class="col-xs-1 ">
            <select name="typeid" id="typeid4"  onchange="changeselect5(this.value);" >
                <option value="">请选择</option>

                <c:forEach var="typeList" items="${typeList}">
                    <option value="${typeList.typeid}"> ${typeList.typename}</option>
                </c:forEach>
            </select>
        </div>

        <div class="col-xs-1 ">
            <select name="typeofnameid" id="typeofnameid4"  >
                <option value="">请选择</option>
            </select>
        </div>

        <div class="col-xs-2 ">

            <div class=" input-sm " style="padding-top:23px ;">
                <input type="file" name="file" multiple class="file-loading" style="width: 132px;" />
            </div>
        </div>

    </div>
                        <div class="modal-footer">
                            <button type="reset" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                            <button type="submit" class="btn btn-xs btn-green">保 存</button>
                        </div>
                    </form>

    <!--页码块-->

        </div>

    </div>

</div>
<script>
    var subcat = new Array();
    <c:set value="0" var="i" />
    <c:forEach var="typeOfNameList" items="${typeOfNameList}">
    subcat[${i}]=new Array("${typeOfNameList.typeid}","${typeOfNameList.typeofname}","${typeOfNameList.typeofnameid}")
    <c:set value="${i+1}" var="i" />
    </c:forEach>
    var typeofnameid=document.getElementById("typeofnameid");
    var typeofnameid1=document.getElementById("typeofnameid1");
    var typeofnameid2=document.getElementById("typeofnameid2");
    var typeofnameid3=document.getElementById("typeofnameid3");
    var typeofnameid4=document.getElementById("typeofnameid4");
    function changeselect1(locationid)
    {
        typeofnameid.length = 1; //初始化下拉列表 清空下拉数据
        console.log(subcat.length);
        for (i=0; i<subcat.length; i++)
        {

            if (subcat[i][0] == locationid) //[0] [1] 第一列 第二列
            {

                typeofnameid.options[typeofnameid.length]= new Option(subcat[i][1], subcat[i][2]);

            } //建立option

        }
    }
    function changeselect2(locationid)
    {
        typeofnameid1.length = 1; //初始化下拉列表 清空下拉数据
        console.log(subcat.length);
        for (i=0; i<subcat.length; i++)
        {

            if (subcat[i][0] == locationid) //[0] [1] 第一列 第二列
            {

                typeofnameid1.options[typeofnameid1.length]= new Option(subcat[i][1], subcat[i][2]);

            } //建立option

        }
    }
    function changeselect3(locationid)
    {
        typeofnameid2.length = 1; //初始化下拉列表 清空下拉数据
        console.log(subcat.length);
        for (i=0; i<subcat.length; i++)
        {

            if (subcat[i][0] == locationid) //[0] [1] 第一列 第二列
            {

                typeofnameid2.options[typeofnameid2.length]= new Option(subcat[i][1], subcat[i][2]);

            } //建立option

        }
    }
    function changeselect4(locationid)
    {
        typeofnameid3.length = 1; //初始化下拉列表 清空下拉数据
        console.log(subcat.length);
        for (i=0; i<subcat.length; i++)
        {

            if (subcat[i][0] == locationid) //[0] [1] 第一列 第二列
            {

                typeofnameid3.options[typeofnameid3.length]= new Option(subcat[i][1], subcat[i][2]);

            } //建立option

        }
    }
    function changeselect5(locationid)
    {
        typeofnameid4.length = 1; //初始化下拉列表 清空下拉数据
        console.log(subcat.length);
        for (i=0; i<subcat.length; i++)
        {

            if (subcat[i][0] == locationid) //[0] [1] 第一列 第二列
            {

                typeofnameid4.options[typeofnameid4.length]= new Option(subcat[i][1], subcat[i][2]);

            } //建立option

        }
    }
</script>
</body>

</html>
