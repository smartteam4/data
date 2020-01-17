<%--
  Created by IntelliJ IDEA.
  User: 12878
  Date: 19/12/11
  Time: 16:09:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>选课管理</title>
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
                window.location.href="${pageContext.request.contextPath}/manage/elective";
            }
        });
    </script>
</head>
<body onload="runTime()">
<div class="bg-dark row">
    <nav class="navbar navbar-expand navbar-dark col-5">
        <ul class="navbar-nav">
            <label class="navbar-brand text-light span-weight-bold">学生选课系统</label>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/home" class="nav-link">首页</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/bulletin" class="nav-link">公告管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/course" class="nav-link">课程管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/elective" class="nav-link active">选课管理</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/manage/person" class="nav-link">个人信息管理</a></li>
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
<div class="container">
    <div class="jumbotron">
        <h2>选课管理</h2>
        <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    </div>
    <form action="${pageContext.request.contextPath}/manage/elective.search" method="post">
        <div class="form-inline">
            <label>查询课程：</label>
            <select name="key" class="custom-select">
                <option value="c_num">课程编号</option>
                <option value="c_name">课程名称</option>
                <option value="c_teacher">任课教师</option>
                <option value="u_username">用户名</option>
                <option value="u_name">用户姓名</option>
                <option value="u_class">所属班级</option>
            </select>
            <input type="text" class="form-control" required name="value"/>
            <input type="submit" class="btn btn-success" value="查询"/>
        </div>
    </form>
    <table class="table table-bordered table-striped text-center">
        <tr>
            <th>序号</th>
            <th>课程编号</th>
            <th>课程名称</th>
            <th>课程类型</th>
            <th>学分</th>
            <th>任课教师</th>
            <th>用户名</th>
            <th>用户姓名</th>
            <th>所属班级</th>
            <th>操作</th>
        </tr>
        <c:forEach var="elective" items="${elective}" varStatus="st">
            <tr>
                <td>
                    <c:choose>
                        <c:when test="${e_page.pageNow == 1}">
                            ${st.count }
                        </c:when>
                        <c:when test="${e_page.pageNow != 1}">
                            ${st.count + 6 * (e_page.pageNow-1) }
                        </c:when>
                    </c:choose>
                </td>
                <td>${elective.course.CNum}</td>
                <td>${elective.course.CName}</td>
                <td>${elective.course.CType eq 1 ? '专业课' : '选修课'}</td>
                <td>${elective.course.CScore}</td>
                <td>${elective.course.CTeacher}</td>
                <td>${elective.user.UUsername}</td>
                <td>${elective.user.UName}</td>
                <td>${elective.user.UClass}</td>
                <td>
                    <button onclick="deleteElective(${elective.EId})" class="btn-sm btn-danger">删除</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">

            <li class="page-item disabled"><a class="page-link" aria-disabled="true">共 ${e_page.totalPageCount} 页</a></li>
            <li class="page-item disabled"><a class="page-link" aria-disabled="true">第 ${e_page.pageNow} 页</a></li>
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/elective?pageNow=1">首页</a></li>

            <c:choose>
                <c:when test="${e_page.pageNow - 1 > 0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/elective?pageNow=${e_page.pageNow - 1}">上一页</a></li>
                </c:when>
                <c:when test="${e_page.pageNow - 1 <= 0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/elective?pageNow=1">上一页</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${e_page.totalPageCount==0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/elective?pageNow=${e_page.pageNow}">下一页</a></li>
                </c:when>
                <c:when test="${e_page.pageNow + 1 < e_page.totalPageCount}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/elective?pageNow=${e_page.pageNow + 1}">下一页</a></li>
                </c:when>
                <c:when test="${e_page.pageNow + 1 >= e_page.totalPageCount}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/elective?pageNow=${e_page.totalPageCount}">下一页</a></li>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${e_page.totalPageCount==0}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/elective?pageNow=${e_page.pageNow}">尾页</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/manage/elective?pageNow=${e_page.totalPageCount}">尾页</a></li>
                </c:otherwise>
            </c:choose>

        </ul>
    </nav>
</div>

</body>
</html>