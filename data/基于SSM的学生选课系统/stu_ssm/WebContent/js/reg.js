window.onload = function () {
    //1.给表n单绑定onsubmit事件
    document.getElementById("form").onsubmit = function () {
        return checkUsername() && checkPassword() && checkPassword2() && checkName()
            && checkClass() && checkEmail() && checkPhone();

    };

    //分别绑定离焦事件
    document.getElementById("username").onblur = checkUsername;
    document.getElementById("password").onblur = checkPassword;
    document.getElementById("password2").onblur = checkPassword2;
    document.getElementById("name").onblur = checkName;
    document.getElementById("classes").onblur = checkClass;
    document.getElementById("email").onblur = checkEmail;
    document.getElementById("phone").onblur = checkPhone;
};
// 返回登录跳转到login.jsp
function login() {
    window.location.href = "../login.jsp";
}

//校验用户名
function checkUsername(){
    //1.获取用户名的值
    var username = document.getElementById("username").value;
    //2.定义正则表达式
    var c_username = /^\w{6,12}$/;
    //3.判断值是否符合正则的规则
    var flag = c_username.test(username);
    //4.提示信息
    var s_username = document.getElementById("s_username");

    if(flag){
        //提示验证成功
        s_username.innerHTML = "√";
        s_username.style.color = "green";
    }else{
        //提示红色用户名有误
        s_username.innerHTML = "用户名为6-20位字符";
        s_username.style.color = "red";
    }
    return flag;
}

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
//校验姓名
function checkName() {
    //1.获取姓名的值
    var name =  document.getElementById("name").value;
    var s_name = document.getElementById("s_name");
    var flag = name != null && name != "";
    if(flag){
        //提示验证成功
        s_name.innerHTML = "√";
        s_name.style.color = "green";
    }else{
        //提示红色用户名有误
        s_name.innerHTML = "请输入姓名!";
        s_name.style.color = "red";
    }
    return flag;
}
//校验班级不为空
function checkClass() {
    //1.获取班级的值
    var classes =  document.getElementById("classes").value;
    var s_class = document.getElementById("s_class");
    var flag = classes != null && classes != "";
    if(flag){
        //提示验证成功
        s_class.innerHTML = "√";
        s_class.style.color = "green";
    }else{
        //提示红色用户名有误
        s_class.innerHTML = "请输入班级!";
        s_class.style.color = "red";
    }
    return flag;
}
//校验邮箱
function checkEmail() {
    //1.获取邮箱的值
    var email =  document.getElementById("email").value;
    var s_email = document.getElementById("s_email");
    var c_email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    var flag = c_email.test(email);
    if(flag){
        //提示验证成功
        s_email.innerHTML = "√";
        s_email.style.color = "green";
    }else{
        //提示红色用户名有误
        s_email.innerHTML = "请输入正确的邮箱!";
        s_email.style.color = "red";
    }
    return flag;
}
//校验手机号
function checkPhone() {
    //1.获取手机号的值
    var phone =  document.getElementById("phone").value;
    //2.定义正则表达式
    var c_phone = /^1[3|4|5|7|8|9][0-9]\d{8}$/;
    //3.判断值是否符合正则的规则
    var flag = c_phone.test(phone);
    //4.提示信息
    var s_phone = document.getElementById("s_phone");
    if(flag){
        //提示验证成功
        s_phone.innerHTML = "√";
        s_phone.style.color = "green";
    }else{
        //提示红色用户名有误
        s_phone.innerHTML = "请输入正确的手机号!";
        s_phone.style.color = "red";
    }
    return flag;
}
/**判断用户名是否已存在**/
$(function(){
	$("#username").blur(function(){
		var value = $("#username").val();
		if(value != "" && value != null){
			// 使用ajax发送请求
			$.ajax({
				url: "checkUsername", //向服务器发送ajax请求的地址
				cache: false, // 是否缓存，false标志不缓存
				data: "username="+value, // 在地址栏后面设置username参数
				success: function(result) { // 访问成功后执行该方法，参数result是后台输出到前台的结果。
                    console.log(result);
				    // 根据验证通过与否分别设置id为"sp"的span标签的颜色为绿/红色，同时将获取到的数据写入该标签
					if(result != "" && result == "false") {
						$("#s_username").css("color","green");
						$("#s_username").text("√");
						$('#username').css("border","1px solid green");
					} else {
						$("#s_username").css("color","red");
						$("#s_username").text("×");
						$("input[name='username']").val(""); // 清空组件内容
						$('#username').css("border","1px solid red");
					}
				}
			});
		}
	});
});