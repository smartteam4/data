<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改课程信息</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/updateCourse.js"></script>
</head>
<body onload="runTime()">
<div class="bg-dark row">
    <nav class="navbar navbar-expand navbar-dark col-5">
        <ul class="navbar-nav">
            <label class="navbar-brand text-light span-weight-bold">学生选课系统</label>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/home" class="nav-link">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/bulletin" class="nav-link">公告管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/course" class="nav-link active">课程管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/elective" class="nav-link">选课管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/person" class="nav-link">个人信息管理</a></li>
        </ul>
    </nav>
    <p id="bar_title" class="text-right text-light col-4">
        尊敬的<span class="text-primary"> ${username} </span>用户<br/>
        现在时间：<span id="time"></span>
        <input id="path" type="hidden" value="${pageContext.request.contextPath}"/>
    </p>
    <div class="col-3 text-right">
        <button onclick="updateManagePassword()" class="btn btn-warning">修改密码</button>
        <a href="${pageContext.request.contextPath}/logout.action"><button class="btn btn-danger" id="logout">注销</button></a>
    </div>
</div>
<div class="container">
    <div class="jumbotron">
        <h2>修改课程信息</h2>
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    </div>
    <form action="${pageContext.request.contextPath}/manage/updateCourse.action" id="form" method="post">
        <input type="hidden" name="CId" value="${course.CId}"/>
        <table class="table table-bordered table-striped text-center">
            <tr>
                <th>课程编号</th>
                <td>${course.CNum}</td>
            </tr>
            <tr>
                <th><span class="ths">课程名称</span><span id="s_name" class="text-right"></span></th>
                <td><input class="form-control-sm form-control-plaintext text-center" required
                           type="text" name="name" id="name" value="${course.CName}"/></td>
            </tr>
            <tr>
                <th>课程类型<span id="s_type" class="text-right"></span></th>
                <td>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="type1" name="type" value="1" checked class="custom-control-input">
                        <label class="custom-control-label" for="type1">专业课</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="type2" name="type" value="0" class="custom-control-input">
                        <label class="custom-control-label" for="type2">选修课</label>
                    </div>
                </td>
            </tr>
            <tr>
                <th>学分<span id="s_score" class="text-right"></span></th>
                <td><input class="form-control-sm form-control-plaintext text-center"
                           required pattern="[1-5]|[1-5]+\.+[0-9]"
                           type="text" name="score" id="score" value="${course.CScore}"/></td>
            </tr>
            <tr>
                <th>任课老师<span id="s_teacher" class="text-right"></span></th>
                <td><input class="form-control-sm form-control-plaintext text-center" required
                           type="text" name="teacher" id="teacher" value="${course.CTeacher}"/></td>
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