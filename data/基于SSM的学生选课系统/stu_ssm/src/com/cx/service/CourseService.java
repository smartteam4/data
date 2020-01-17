package com.cx.service;

import com.cx.pojo.Course;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface CourseService {


    // 查询所有课程信息，并设置session
    public List<Course> findAllCourse();

    // 分页查询课程信息
    public void showCourseByPage(HttpServletRequest request, HttpSession session);

    // 管理用户分页查询课程信息
    public void showManageCourseByPage(HttpServletRequest request, HttpSession session);

    // 删除课程信息
    public boolean deleteCourse(HttpServletRequest request);

    // 通过CId查询课程信息
    public void findByCId(HttpServletRequest request);

    // 修改课程信息
    public void manageUpdate(Course course, HttpServletRequest request);

    // 模糊查询课程信息
    public void findByFuzzy(HttpServletRequest request);

    // 添加课程信息
    public void addCourse(Course course, HttpServletRequest request);

    // 检查课程编号是否重复的方法
    public boolean checkCNum(String CNum);
}
