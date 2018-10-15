<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/8/10
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
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


<div role="tabpanel" class="tab-pane" id="chan">
    <div class="check-div">
        更改密码后，需要重新登录
    </div>
    <div style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
        <form class="form-horizontal" action="/reset" method="post">
            <input type="hidden" name="username" value="${user1.username}" >
            <div class="form-group">
                <label for="sKnot" class="col-xs-4 control-label">原密码：</label>
                <div class="col-xs-5">
                    <input type="old-password" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                </div>
            </div>
            <div class="form-group">
                <label for="sKnot" class="col-xs-4 control-label">新密码：</label>
                <div class="col-xs-5">
                    <input type="password" name="password" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                </div>
            </div>
            <div class="form-group">
                <label for="sKnot" class="col-xs-4 control-label">重复密码：</label>
                <div class="col-xs-5">
                    <input type="re-password" class="form-control input-sm duiqi" id="sKnot" placeholder="" style="margin-top: 7px;">
                </div>

            </div>
            <div class="form-group text-right">

                <div class="col-xs-offset-4 col-xs-5" style="margin-left: 169px;">
                    <button type="reset" class="btn btn-xs btn-white">取 消</button>
                    <button type="submit" class="btn btn-xs btn-green">保存</button>
                </div>
            </div>
        </form>

    </div>

</div>

</body>
</html>
