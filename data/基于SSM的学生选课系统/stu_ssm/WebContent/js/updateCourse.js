window.onload = function () {
    //1.给表n单绑定onsubmit事件
    document.getElementById("form").onsubmit = function () {
        return checkName() && checkScore() && checkTeacher();
    };
    // 绑定离焦事件
    document.getElementById("name").onblur = checkName;
    document.getElementById("score").onblur = checkScore;
    document.getElementById("teacher").onblur = checkTeacher;
};

// 校验课程名称
function checkName() {
    // 获得teacher的值
    var name = document.getElementById("name").value;
    // 绑定提示信息组件
    var s_name = document.getElementById("s_name");
    // 校验
    if(name != null && name != ""){
        //提示验证成功
        s_name.innerHTML = "√";
        s_name.style.color = "green";
        return true;
    }else{
        //提示红色用户名有误
        s_name.innerHTML = "请输入任课老师!";
        s_name.style.color = "red";
        return false;
    }
}

// 校验学分
function checkScore() {
    // 获取学分的值
    var score = document.getElementById("socre").value;
    // 绑定提示信息组件
    var s_score = document.getElementById("s_score");
    // 定义正则表达式，可以为整数，也可以带小数
    var c_score1 = /^[1-5]$/;
    var c_score2 = /^[1-5]+\.+[0-9]$/;
    if(c_score1.test(score) || c_score2.test(score)){
        //提示验证成功
        s_score.innerHTML = "√";
        s_score.style.color = "green";
        return true;
    }else{
        //提示红色用户名有误
        s_score.innerHTML = "学分为1-5分，可以带1位小数";
        s_score.style.color = "red";
    }
}

// 校验任课老师
function checkTeacher() {
    // 获得teacher的值
    var teacher = document.getElementById("teacher").value;
    // 绑定提示信息组件
    var s_teacher = document.getElementById("s_teacher");
    // 校验
    if(teacher != null && teacher != ""){
        //提示验证成功
        s_teacher.innerHTML = "√";
        s_teacher.style.color = "green";
        return true;
    }else{
        //提示红色用户名有误
        s_teacher.innerHTML = "请输入任课老师!";
        s_teacher.style.color = "red";
        return false;
    }

}