<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新公告</title>
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
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/bulletin" class="nav-link active">公告管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/course" class="nav-link">课程管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/elective" class="nav-link">选课管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/person" class="nav-link">个人信息管理</a></li>
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
        <h2>更新公告</h2>
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    </div>
    <div id="b_c_content">
        <form action="${pageContext.request.contextPath}/manage/updateBulletin.action" method="post">
            <input type="hidden" name="BId" value="${bulletinContent.BId}" />
            <div class="form-group">
                <h4>标题</h4>
                <input type="text" name="title" required value="${bulletinContent.BTitle}" class="form-control"/>
            </div>
            <div class="form-group">
                <h4>发布时间：</h4>
                <input type="date" class="form-control" name="date" value="<fmt:formatDate value="${bulletinContent.BDate}" pattern="yyyy-MM-dd"/>">

            </div>
            <div class="form-group">
                <h4>内容</h4>
                <textarea required name="content" rows="10" maxlength="1000" class="form-control">
                    ${bulletinContent.BContent}
                </textarea>
            </div>
            <div class="form-group">
                <h4>落款</h4>
                <textarea name="drop" rows="5" maxlength="25" required class="text-right form-control">
                    ${bulletinContent.BDrop}
                </textarea>
            </div>
            <div class="form-group">
                <input type="submit" value="更新公告" class="form-control btn btn-success" />
            </div>
        </form>
    </div>
</div>
</body>
</html>