/**判断课程编号是否已存在**/
$(function(){
    $("#num").blur(function(){
        var value = $("#num").val();
        if(value != "" && value != null){
            // 使用ajax发送请求
            $.ajax({
                url: "checkCNum", //向服务器发送ajax请求的地址
                cache: false, // 是否缓存，false标志不缓存
                data: "num="+value, // 在地址栏后面设置username参数
                success: function(result) { // 访问成功后执行该方法，参数result是后台输出到前台的结果。
                    // 根据验证通过与否分别设置id为"sp"的span标签的颜色为绿/红色，同时将获取到的数据写入该标签
                    if(result != "" && result == "false") {
                        $("#s_num").css("color","green");
                        $("#s_num").text("√");
                        $('#num').css("border","1px solid green");
                    } else {
                        $("#s_num").css("color","red");
                        $("#s_num").text("×");
                        $("input[name='num']").val(""); // 清空组件内容
                        $('#num').css("border","1px solid red");
                    }
                }
            });
        }
    });
});