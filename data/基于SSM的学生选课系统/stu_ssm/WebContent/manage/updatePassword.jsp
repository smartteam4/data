<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
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
        $(function(){
            document.getElementById("form").onsubmit = function () {
                return checkPassword() && checkPassword2();
            };
            //绑定离焦事件
            document.getElementById("password").onblur = checkPassword;
            document.getElementById("password2").onblur = checkPassword2;

            // 如果服务器传回信息，则使用alert提示并关闭页面
            if(${not empty msg}){
                alert("${msg}");
                window.close();
            }
        });
        //校验密码
        function checkPassword(){
            //1.获取密码的值
            var password = document.getElementById("password").value;
            //2.定义正则表达式
            var c_password = /^\w{6,16}$/;
            //3.判断值是否符合正则的规则
            var flag = c_password.test(password);
            //4.提示信息
            var s_password = document.getElementById("s_password");

            if(flag){
                //提示验证成功
                s_password.innerHTML = "√";
                s_password.style.color = "green";
            }else{
                //提示红色用户名有误
                s_password.innerHTML = "密码为6-20位字符";
                s_password.style.color = "red";
            }
            return flag;
        }
        //校验确认密码
        function checkPassword2() {
            //1.获取确认密码的值
            var password = document.getElementById("password").value;
            var password2 = document.getElementById("password2").value;
            //3.判断值是否相等
            var flag = password == password2 && password2 != null && password2 != "";
            //4.提示信息
            var s_password2 = document.getElementById("s_password2");

            if(flag){
                //提示验证成功
                s_password2.innerHTML = "√";
                s_password2.style.color = "green";
            }else{
                //提示红色用户名有误
                s_password2.innerHTML = "两次输入的密码不一致!";
                s_password2.style.color = "red";
            }
            return flag;
        }
    </script>
</head>
<body>
<form action="${pageContext.request.contextPath}/manage/updatePassword.action" id="form" method="post">
    <div class="form-group">
        <label>新密码：</label><span id="s_password"></span>
        <input class="form-control" name="password" id="password" type="password" />
    </div>
    <div class="form-group">
        <label>确认密码：</label><span id="s_password2"></span>
        <input class="form-control" name="password2" id="password2" type="password" />
    </div>
    <div class="form-group">
        <input type="submit" class="btn btn-success form-control" value="修改密码"/>
    </div>
</form>
</body>
</html>