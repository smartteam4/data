<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人信息管理</title>
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
    <script type="text/javascript">
        // 服务器传回提示信息，通过alert提示，然后刷新页面
        $(function(){
            if(${not empty msg}){
                alert("${msg}");
                window.location.href="${pageContext.request.contextPath}/manage/person";
            }
        });
    </script>
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
        <button onclick="updateManagePassword()" class="btn btn-warning">修改密码</button>
        <a href="${pageContext.request.contextPath}/logout.action"><button class="btn btn-danger" id="logout">注销</button></a>
    </div>
</div>
<div class="container-fluid">
    <div class="jumbotron">
        <h2>个人信息管理</h2>
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    </div>
    <p><a href="${pageContext.request.contextPath}/manage/addPerson"><button class="btn btn-primary" >添加用户</button></a></p>
    <form action="${pageContext.request.contextPath}/manage/person.search" method="post">
        <div class="form-inline">
            <label>查询课程：</label>
            <select name="key" class="custom-select">
                <option value="u_username">用户名</option>
                <option value="u_name">用户姓名</option>
                <option value="u_class">所属班级</option>
                <option value="u_phone">手机号</option>
            </select>
            <input type="text" class="form-control" required name="value"/>
            <input type="submit" class="btn btn-success" value="查询"/>
        </div>
    </form>
    <table class="table table-bordered table-striped text-center">
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>用户密码</th>
            <th>用户姓名</th>
            <th>用户性别</th>
            <th>用户班级</th>
            <th>用户邮箱</th>
            <th>用户类型</th>
            <th>用户手机号</th>
            <th>用户状态</th>
            <th>操作</th>
        </tr>
        <c:forEach var="user" items="${user}" varStatus="st">
            <tr>
                <td>
                    <c:choose>
                        <c:when test="${u_page.pageNow == 1}">
                            ${st.count }
                        </c:when>
                        <c:when test="${u_page.pageNow != 1}">
                            ${st.count + 6 * (u_page.pageNow-1) }
                        </c:when>
                    </c:choose>
                </td>
                <td>${user.UUsername}</td>
                <td>${user.UPassword}</td>
                <td>${user.UName}</td>
                <td>${user.USex eq 1 ? '男' : '女'}</td>
                <td>${user.UClass}</td>
                <td>${user.UEmail}</td>
                <td>${user.UType eq 1 ? '普通用户' : '管理员'}</td>
                <td>${user.UPhone}</td>
                <td>${user.UStatus eq 1 ? '启用' : '禁用'}</td>
                <td>
                    <button onclick="deleteUser(${user.UId})" class="btn-sm btn-danger">删除</button>
                    <a href="${pageContext.request.contextPath}/manage/updatePerson?UId=${user.UId}"><button class="btn-sm btn-secondary">更新</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">

            <li class="page-item disabled"><a class="page-link" aria-disabled="true">共 ${u_page.totalPageCount} 页</a></li>
            <li class="page-item disabled"><a class="page-link" aria-disabled="true">第 ${u_page.pageNow} 页</a></li>
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/person?pageNow=1">首页</a></li>

            <c:choose>
                <c:when test="${u_page.pageNow - 1 > 0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/person?pageNow=${u_page.pageNow - 1}">上一页</a></li>
                </c:when>
                <c:when test="${u_page.pageNow - 1 <= 0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/person?pageNow=1">上一页</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${u_page.totalPageCount==0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/person?pageNow=${u_page.pageNow}">下一页</a></li>
                </c:when>
                <c:when test="${u_page.pageNow + 1 < u_page.totalPageCount}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/person?pageNow=${u_page.pageNow + 1}">下一页</a></li>
                </c:when>
                <c:when test="${u_page.pageNow + 1 >= u_page.totalPageCount}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/person?pageNow=${u_page.totalPageCount}">下一页</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${u_page.totalPageCount==0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/person?pageNow=${u_page.pageNow}">尾页</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/person?pageNow=${u_page.totalPageCount}">尾页</a></li>
                </c:otherwise>
            </c:choose>

        </ul>
    </nav>
</div>
</body>
</html>