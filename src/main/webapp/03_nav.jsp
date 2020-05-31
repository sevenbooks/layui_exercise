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

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>水平导航菜单</legend>
</fieldset>

<ul class="layui-nav">
    <li class="layui-nav-item"><a href="">最新活动</a></li>
    <li class="layui-nav-item layui-this">
        <a href="javascript:;">产品</a>
        <dl class="layui-nav-child">
            <dd><a href="">选项1</a></dd>
            <dd><a href="">选项2</a></dd>
            <dd><a href="">选项3</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="">大数据</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">解决方案</a>
        <dl class="layui-nav-child">
            <dd><a href="">移动模块</a></dd>
            <dd><a href="">后台模版</a></dd>
            <dd class="layui-this"><a href="">选中项</a></dd>
            <dd><a href="">电商平台</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href="">社区</a></li>
</ul>

<script type="text/javascript">
    layui.use(["element"],function () {

    })
</script>

</body>
</html>
