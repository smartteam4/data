<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
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
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/home" class="nav-link">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/bulletin" class="nav-link">公告</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/course" class="nav-link">选课</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/person" class="nav-link active">个人信息</a></li>
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
        <h2>个人信息</h2>
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    </div>
    <p class="text-center text-info font-weight-bold font-italic">${msg}</p>
    <table class="table table-bordered table-striped text-center">
        <tr>
            <th>用户名</th>
            <td>${user.UUsername}</td>
        </tr>
        <tr>
            <th>姓名</th>
            <td>${user.UName}</td>
        </tr>
        <tr>
            <th>性别</th>
            <td>${user.USex eq 1 ? '男' : '女'}</td>
        </tr>
        <tr>
            <th>班级</th>
            <td>${user.UClass}</td>
        </tr>
        <tr>
            <th>邮箱</th>
            <td>${user.UEmail}</td>
        </tr>
        <tr>
            <th>手机号</th>
            <td>${user.UPhone}</td>
        </tr>
        <tr>
            <td colspan="2"><a href="${pageContext.request.contextPath}/general/updatePerson" class="btn btn-secondary">修改</a></td>
        </tr>
    </table>
</div>
</body>
</html>