package com.cx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManageController {

    // 跳转到管理用户首页
    @RequestMapping("/manage/home")
    public String home(){
        return "manage/home";
    }

    // 跳转到管理用户添加用户界面
    @RequestMapping("/manage/addPerson")
    public String addPerson(){
        return "manage/addPerson";
    }

    // 跳转到管理用户添加课程界面
    @RequestMapping("/manage/addCourse")
    public String addCourse(){
        return "manage/addCourse";
    }

    // 跳转到管理用户添加公告界面
    @RequestMapping("/manage/addBulletin")
    public String addBulletin(){
        return "manage/addBulletin";
    }

    // 跳转到修改密码页面
    @RequestMapping("/manage/updatePassword")
    public String updatePassword(){
        return "manage/updatePassword";
    }
}
