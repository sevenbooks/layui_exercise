<%--
  Created by IntelliJ IDEA.
  User: 16097
  Date: 2020/5/30
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="resources/layui/css/layui.css">
</head>
<body>

<script src="resources/layui/layui.js"></script>

<fieldset class="layui-elem-field site-demo-button" style="margin-top: 30px;">
    <legend>按钮主题</legend>
    <div>
        <button type="button" class="layui-btn layui-btn-primary">原始按钮</button>
        <button type="button" class="layui-btn">默认按钮</button>
        <button type="button" class="layui-btn layui-btn-normal">百搭按钮</button>
        <button type="button" class="layui-btn layui-btn-warm">暖色按钮</button>
        <span class="layui-btn layui-btn-warm">暖色按钮</span>
        <a class="layui-btn layui-btn-warm">暖色按钮</a>
        <button type="button" class="layui-btn layui-btn-danger">警告按钮</button>
        <button type="button" class="layui-btn layui-btn-disabled">禁用按钮</button>
    </div>
</fieldset>

<script type="text/javascript">
    layui.use(["jquery"], function() {
        var $ = layui.jquery;
        $(".layui-btn").click(function () {
            alert($(this).html());
        })

    })
</script>

</body>
</html>
