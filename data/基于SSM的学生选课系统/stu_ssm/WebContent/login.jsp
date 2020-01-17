<%--
  Created by IntelliJ IDEA.
  User: 12878
  Date: 19/11/28
  Time: 9:30:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/content.css"/>
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <!-- bootstrap.bundle.min.js 用于弹窗、提示、下拉菜单，包含了 popper.min.js -->
    <script src="js/popper.min.js"></script>
    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
</head>
<body>
<div class="container">
    <form action="login.action" id="form" method="post" role="form">
        <h2 class="text-center">用户登录</h2>
        <span class="text-danger text-center font-italic msg">${error }</span>
        <span class="text-info text-center font-italic msg">${msg }</span>
        <div class="form-group">
            <span class="text-danger">*</span><label>用户名：</label><label class="lab"></label>
            <span id="s_username"></span>
            <input type="text" name="username" id="username"
                   class="form-control" autofocus="true"/>
        </div>
        <div class="form-group">
            <span class="text-danger">*</span><label>密码：</label>
            <span id="s_password"></span>
            <input type="password" name="password" id="password"
                   class="form-control"/>
        </div>

        <div class="form-group text-center">
            <input type="submit" class="btn btn-success" value="登录"/>
            <input type="reset" class="btn btn-warning" value="重置"/>
            <a href="reg" class="btn btn-primary float-right">注册</a>
        </div>
    </form>
</div>
</body>
</html>