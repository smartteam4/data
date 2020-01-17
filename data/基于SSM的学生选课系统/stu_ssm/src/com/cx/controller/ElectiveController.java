package com.cx.controller;

import com.cx.service.ElectiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ElectiveController {

    @Autowired
    private ElectiveService electiveService;

    /**普通用户的方法**/
    // 选课的方法
    @RequestMapping("/general/selectCourse")
    public String selectCourse(HttpServletRequest request, HttpSession session){
        // 通过request获得课程ID
        electiveService.saveElective(request, session);
        return "general/course";
    }

    // 取消选课的方法
    @RequestMapping("/general/cancelCourse")
    public String cancelCourse(HttpServletRequest request, HttpSession session){
        // 通过request获得课程ID
        electiveService.deleteElective(request, session);
        return "general/course";
    }


    /**管理用户的方法**/
    // 通过分页显示学生选课信息
    @RequestMapping("/manage/elective")
    public String ShowElective(HttpServletRequest request, HttpSession session){
        electiveService.showElectiveByPage(request, session);
        return "manage/elective";
    }

    // 模糊查询课程信息
    @RequestMapping("/manage/elective.search")
    public String findByFuzzy(HttpServletRequest request){
        electiveService.findByFuzzy(request);
        return "manage/elective";
    }

    // 删除选课信息
    @RequestMapping("/manage/deleteElective")
    public String deleteElective(HttpServletRequest request){
        electiveService.manageDeleteElective(request);
        return "manage/elective";
    }
}
