window.onload = function () {
    //1.给表n单绑定onsubmit事件
    document.getElementById("form").onsubmit = function () {
        return checkUsername() && checkPassword();

    };

    //给用户名和密码框分别绑定离焦事件
    document.getElementById("username").onblur = checkUsername;
    document.getElementById("password").onblur = checkPassword;
};

function reg() {
    window.location.href = "../reg.jsp";
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
    //1.获取用户名的值
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
				    // 根据验证通过与否分别设置id为"sp"的span标签的颜色为绿/红色，同时将获取到的数据写入该标签
					if(result != "" && result == "true") {
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