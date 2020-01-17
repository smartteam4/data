// 显示系统时间
function showTime() {
    document.getElementById("time").textContent = (getTime(new Date()));
}

var timeId; // 定义Interval ID

// 动态显示系统时间
function runTime() {
    showTime();
    timeId = window.setInterval("showTime()",1000);
}

// 设置时间格式
function getTime(date) {
    var time = "";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();
    var week = date.getDay();
    var Week = ['日','一','二','三','四','五','六'];
    time += year + "-";
    time += month > 9 ? month + "-" : "0" + month + "-";
    time += day > 9 ? day + " " : "0" + day + " ";
    time += hour > 9 ? hour + ":" : "0" + hour + ":";
    time += minute > 9 ? minute + ":" : "0" + minute + ":";
    time += second > 9 ? second + " " : "0" + second + " ";
    time += "星期" + Week[week];
    return time;
}
// 设置时间格式
function getDate(date) {
    var time = "";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    time += year + "-";
    time += month > 9 ? month : "0" + month;
    return time;
}
//获取当前相对路径
//var path = document.getElementById("PageContext").value;
var path = "/stu_ssm";

/*window.onload = function () {
    console.log(path);
    if(typeof(path) == "undefined"){
        path = "";
    	console.log(path);
    } else {
        path = document.getElementById("PageContext").value;
        console.log(path);
    }
}*/
// 修改密码
function updatePassword() {
    window.open(path + "/general/updatePassword", "new", "width=500,height=270,left=100,top=100,resizable=no");
}
// 修改密码
function updateManagePassword() {
    window.open(path + "/manage/updatePassword", "new", "width=500,height=270,left=100,top=100,resizable=no");
}

// 删除课程方法
function deleteCourse(course) {
    var flag = confirm("确认删除该课程吗？");
    if(flag) {
        // 通过location.href跳转
        window.location.href = path + "/manage/deleteCourse?CId=" + course;
    }

}

// 删除用户方法
function deleteUser(UId) {
    var flag = confirm("确认删除该用户吗？");
    if(flag) {
        // 通过location.href跳转
        window.location.href = path + "/manage/deleteUser?UId=" + UId;
    }
}

// 删除公告方法
function deleteBulletin(BId) {
    var flag = confirm("确认删除该公告吗？");
    if(flag) {
        // 通过location.href跳转
        window.location.href = path + "/manage/deleteBulletin?BId=" + BId;
    }
}
function deleteElective(EId) {
    var flag = confirm("确认删除该选课信息吗？");
    if(flag) {
        // 通过location.href跳转
        window.location.href = path + "/manage/deleteElective?EId=" + EId;
    }
}