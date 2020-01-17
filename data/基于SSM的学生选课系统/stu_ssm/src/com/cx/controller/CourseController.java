package com.cx.controller;

import com.cx.pojo.Course;
import com.cx.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private Course course;
    /**普通用户的方法**/

    // 分页查询用户的方法
    @RequestMapping("/general/course")
    public String pagingGeneralCourse(HttpServletRequest request, HttpSession session){
        courseService.showCourseByPage(request,session);
        return "general/course";
    }

    /**管理员的方法**/

    // 分页查询用户的方法
    @RequestMapping("/manage/course")
    public String showPagingManageCourse(HttpServletRequest request, HttpSession session){
        courseService.showManageCourseByPage(request,session);
        return "manage/course";
    }

    // 删除课程信息
    @RequestMapping("/manage/deleteCourse")
    public String deleteCourse(HttpServletRequest request){
        // 通过service层删除课程信息，request传递接受参数
        courseService.deleteCourse(request);
        return "manage/course";
    }


    // 跳转到修改课程信息
    @RequestMapping("/manage/updateCourse")
    public String updateCoursePage(HttpServletRequest request){
        courseService.findByCId(request);
        return "manage/updateCourse";
    }

    // 管理员修改课程信息的方法
    @RequestMapping("/manage/updateCourse.action")
    public String manageUpdateCourse(Integer CId, String name, Integer type, Double score,
                                     String teacher, HttpServletRequest request) {
        // 把用户提交的数据赋值给course对象
        course.setCId(CId);
        course.setCName(name);
        course.setCType(type);
        course.setCScore(score);
        course.setCTeacher(teacher);
        // 通过业务层进行数据处理
        courseService.manageUpdate(course, request);
        return "manage/course";
    }

    // 模糊查询课程信息
    @RequestMapping("/manage/course.search")
    public String findByFuzzy(HttpServletRequest request){
        courseService.findByFuzzy(request);
        return "manage/course";
    }

    // 管理员添加课程信息的方法
    @RequestMapping("/manage/addCourse.action")
    public String addCourse(String num, String name, Integer type, double score,
                            String teacher, HttpServletRequest request){
        // 获得提交的数据赋值给course
        course.setCNum(num);
        course.setCName(name);
        course.setCType(type);
        course.setCScore(score);
        course.setCTeacher(teacher);
        // 通过业务层完成课程信息的添加
        courseService.addCourse(course, request);
        return "manage/course";
    }

    // 检查课程编号是否存在重复的方法
    @RequestMapping("manage/checkCNum")
    @ResponseBody
    public boolean checkCNum(String num) {
        return courseService.checkCNum(num);
    }
}
