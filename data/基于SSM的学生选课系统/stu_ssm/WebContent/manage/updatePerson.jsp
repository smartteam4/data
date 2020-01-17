<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改信息</title>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css"/>
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <!-- bootstrap.bundle.min.js 用于弹窗、提示、下拉菜单，包含了 popper.min.js -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/content.js"></script>
</head>
<body onload="runTime()">
<div class="bg-dark row">
    <nav class="navbar navbar-expand navbar-dark col-5">
        <ul class="navbar-nav">
            <label class="navbar-brand text-light font-weight-bold">学生选课系统</label>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/home" class="nav-link">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/bulletin" class="nav-link">公告管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/course" class="nav-link">课程管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/elective" class="nav-link">选课管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/person" class="nav-link active">个人信息管理</a></li>
        </ul>
    </nav>
    <p id="bar_title" class="text-right text-light col-4">
        尊敬的<span class="text-primary"> ${username} </span>用户<br/>
        现在时间：<span id="time"></span>
    </p>
    <div class="col-3 text-right">
        <button onclick="updatePassword()" class="btn btn-warning">修改密码</button>
        <a href="${pageContext.request.contextPath}/logout.action"><button class="btn btn-danger" id="logout">注销</button></a>
    </div>
</div>
<div class="container">
    <div class="jumbotron">
        <h2>修改信息</h2>
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    </div>
    <form action="${pageContext.request.contextPath}/manage/updatePerson.action" id="form" method="post">
        <input type="hidden" name="UId" value="${user.UId}"/>
        <table class="table table-bordered table-striped text-center">
            <tr>
                <th>用户名</th>
                <td>${user.UUsername}</td>
            </tr>
            <tr>
                <th>密码</th>
                <td><input class="form-control-sm form-control-plaintext text-center" required
                           type="text" name="password" id="password" value="${user.UPassword}"/></td>
            </tr>
            <tr>
                <th><span class="ths">姓名</span><span id="s_name" class="text-right"></span></th>
                <td><input class="form-control-sm form-control-plaintext text-center" required
                           type="text" name="name" id="name" value="${user.UName}"/></td>
            </tr>
            <tr>
                <th>性别<span id="s_sex" class="text-right"></span></th>
                <td>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="sex1" name="sex" value="1" checked class="custom-control-input">
                        <label class="custom-control-label" for="sex1">男</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="sex2" name="sex" value="0" class="custom-control-input">
                        <label class="custom-control-label" for="sex2">女</label>
                    </div>
                </td>
            </tr>
            <tr>
                <th>班级<span id="s_class" class="text-right"></span></th>
                <td><input class="form-control-sm form-control-plaintext text-center" required
                           type="text" name="classes" id="classes" value="${user.UClass}"/></td>
            </tr>
            <tr>
                <th>邮箱<span id="s_email" class="text-right"></span></th>
                <td><input class="form-control-sm form-control-plaintext text-center"
                           required pattern="[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)"
                           type="text" name="email" id="email" value="${user.UEmail}"/></td>
            </tr>
            <tr>
                <th>用户类型<span id="s_type" class="text-right"></span></th>
                <td>
                    <select class="custom-select" name="type">
                        <option value="0">管理员</option>
                        <option value="1">普通用户</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>手机号<span id="s_phone" class="text-right"></span></th>
                <td><input class="form-control-sm form-control-plaintext text-center"
                           required pattern="1[3|4|5|7|8|9][0-9]\d{8}" maxlength="11"
                           type="text" name="phone" id="phone" value="${user.UPhone}"/></td>
            </tr>
            <tr>
                <th>用户状态<span id="s_status" class="text-right"></span></th>
                <td>
                    <select class="custom-select" name="status">
                        <option value="1">启用</option>
                        <option value="0">禁用</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" class="btn btn-secondary" value="提交" /></td>
            </tr>
        </table>
    </form>
</div>
<style type="text/css" rel="stylesheet">
    table tr th{
        width: 40%;
        position: relative;
    }
</style>
</body>
</html>