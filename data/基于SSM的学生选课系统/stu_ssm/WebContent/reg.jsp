<%--
  Created by IntelliJ IDEA.
  User: 12878
  Date: 19/11/28
  Time: 13:46:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/content.css"/>
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <!-- bootstrap.bundle.min.js 用于弹窗、提示、下拉菜单，包含了 popper.min.js -->
    <script src="js/popper.min.js"></script>
    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/reg.js"></script>
</head>
<body>
    <div class="container">
        <form action="reg.action" id="form" method="post" role="form">
            <h2 class="text-center">用户注册</h2>
            <span class="text-danger text-center font-italic msg">${error }</span>
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
            <div class="form-group">
                <span class="text-danger">*</span><label>确认密码：</label>
                <span id="s_password2"></span>
                <input type="password" name="password2" id="password2"
                       class="form-control"/>
            </div>
            <div class="form-group">
                <span class="text-danger">*</span><label>姓名：</label>
                <span id="s_name"></span>
                <input type="text" name="name" id="name"
                       class="form-control"/>
            </div>
            <div class="form-group">
                <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="sex1" name="sex" value="1" checked class="custom-control-input">
                    <label class="custom-control-label" for="sex1">男</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" id="sex2" name="sex" value="0" class="custom-control-input">
                    <label class="custom-control-label" for="sex2">女</label>
                </div>
            </div>
            <div class="form-group">
                <span class="text-danger">*</span><label>班级：</label>
                <span id="s_class"></span>
                <input type="text" name="classes" id="classes"
                       class="form-control"/>
            </div>
            <div class="form-group">
                <label>邮箱：</label>
                <span id="s_email"></span>
                <input type="text" name="email" id="email"
                       class="form-control"/>
            </div>
            <div class="form-group">
                <span class="text-danger">*</span><label>用户类型：</label>
                <select class="custom-select" name="type">
                    <option value="1">普通用户</option>
                </select>
            </div>
            <div class="form-group">
                <label>手机号：</label>
                <span id="s_phone"></span>
                <input type="text" name="phone" id="phone"
                       class="form-control"/>
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-success" value="注册" />
				<input type="reset" class="btn btn-warning" value="重置" />
                <a href="login" class="btn float-right btn-primary">返回登录</a>
            </div>
        </form>
    </div>
</body>
</html>