<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>公告</title>
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
            <li class="nav-item"><a href="${pageContext.request.contextPath}/general/bulletin" class="nav-link active">公告</a></li>
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
<div class="container">
    <div class="jumbotron">
        <h2>教务公告</h2>
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    </div>
    <div id="bulletin">
        <h4>最新通知：</h4>
        <c:forEach var="bulletin" items="${bulletin}" varStatus="st">
            <p>
                <a href="${pageContext.request.contextPath}/general/bulletin.action?BId=${bulletin.BId}"><span class="b_title">${bulletin.BTitle}</span></a>
                <span class="b_time"><fmt:formatDate value="${bulletin.BDate}" pattern="yyyy-MM-dd"/></span>
            </p>
        </c:forEach>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination">

            <li class="page-item disabled"><a class="page-link" aria-disabled="true">共 ${b_page.totalPageCount} 页</a></li>
            <li class="page-item disabled"><a class="page-link" aria-disabled="true">第 ${b_page.pageNow} 页</a></li>
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/general/bulletin?pageNow=1">首页</a></li>

            <c:choose>
                <c:when test="${b_page.pageNow - 1 > 0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/general/bulletin?pageNow=${b_page.pageNow - 1}">上一页</a></li>
                </c:when>
                <c:when test="${b_page.pageNow - 1 <= 0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/general/bulletin?pageNow=1">上一页</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${b_page.totalPageCount==0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/general/bulletin?pageNow=${b_page.pageNow}">下一页</a></li>
                </c:when>
                <c:when test="${b_page.pageNow + 1 < b_page.totalPageCount}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/general/bulletin?pageNow=${b_page.pageNow + 1}">下一页</a></li>
                </c:when>
                <c:when test="${b_page.pageNow + 1 >= b_page.totalPageCount}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/general/bulletin?pageNow=${b_page.totalPageCount}">下一页</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${b_page.totalPageCount==0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/general/bulletin?pageNow=${b_page.pageNow}">尾页</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/general/bulletin?pageNow=${b_page.totalPageCount}">尾页</a></li>
                </c:otherwise>
            </c:choose>

        </ul>
    </nav>
</div>
</body>
</html>