<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
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
<body id="bo" onload="runTime()">
<div class="bg-dark row">
    <nav class="navbar navbar-expand navbar-dark col-5">
        <ul class="navbar-nav">
            <label class="navbar-brand text-light font-weight-bold">学生选课系统</label>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/home" class="nav-link active">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/bulletin" class="nav-link">公告</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/course" class="nav-link">选课</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/person" class="nav-link">个人信息</a></li>
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
<div class="container-fluid">
    <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    <div class="container">
        <div class="row">
            <a href="${pageContext.request.contextPath}/general/bulletin" class="Features col-4 text-center row">
                <span class="col-3">📝</span>
                <div class="col-9">
                    <h5>公告</h5>
                    <p>教务处发布的公告</p>
                </div>
            </a>
            <a href="${pageContext.request.contextPath}/general/course" class="Features col-4 text-center row">
                <span class="col-3">📰</span>
                <div class="col-9">
                    <h5>选课</h5>
                    <p>查看选课信息进行选课</p>
                </div>
            </a>
            <a href="${pageContext.request.contextPath}/general/person" class="Features col-4 text-center row">
                <span class="col-3">👨</span>
                <div class="col-9">
                    <h5>个人</h5>
                    <p>查看修改自己的个人信息</p>
                </div>
            </a>
        </div>
    </div>
</div>
</body>
</html>