package com.cx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用来控制页面之间的跳转
 */
@Controller
public class GeneralController {

    // 跳转到登录页面
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    // 跳转到注册页面
    @RequestMapping("/reg")
    public String reg(){
        return "reg";
    }

    // 跳转到普通用户首页
    @RequestMapping("/general/home")
    public String home(){
        return "general/home";
    }

    // 跳转到修改密码页面
    @RequestMapping("/general/updatePassword")
    public String updatePassword(){
        return "general/updatePassword";
    }
}
