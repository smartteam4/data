package com.cx.service.impl;

import com.cx.mapper.CourseMapper;
import com.cx.pojo.Course;
import com.cx.pojo.Elective;
import com.cx.pojo.User;
import com.cx.service.CourseService;
import com.cx.service.ElectiveService;
import com.cx.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    // 自动注入
    @Autowired
    private CourseMapper dao;
    @Autowired
    private PageUtil page;
    @Autowired
    private ElectiveService electiveService;
    @Autowired
    private User user;
    @Autowired
    private Elective elective;
    @Autowired
    private Course course;

    // 查找所有课程信息，并设置session
    @Override
    public List<Course> findAllCourse() {
        // 如果得到的数据大于0则返回，否则返回null
        return dao.findAll().size() > 0 ? dao.findAll() : null;
    }

    // 通过分页查询课程信息
    @Override
    public void showCourseByPage(HttpServletRequest request, HttpSession session) {
        // 通过session获得用户信息
        user = (User) session.getAttribute("user");
        // 通过用户ID查找选课信息
        elective = electiveService.findByUId(user.getUId());
        // 判断课程ID是否为空
        if(elective != null){
            // 通过选课信息表的课程ID查找课程信息
            course = dao.findByCId(elective.getCId());
            // 通过request设置已选课信息
            request.setAttribute("selectedCourse", course);
        }
        // 获得当前所在页数
        String pageNow = request.getParameter("pageNow");
        // 定义一个course数组
        List<Course> course;
        //查询课程总数
        int totalCount = (int) dao.getCourseCount();
        if (pageNow != null) { // 当前页数不为空,返回当前页数
            page = new PageUtil(totalCount, Integer.parseInt(pageNow));
            course = dao.selectByPage(page.getStartPos(), page.getPageSize());
        } else { // 当前页数为空则返回第一页
            page = new PageUtil(totalCount, 1);
            course = dao.selectByPage(page.getStartPos(), page.getPageSize());
        }
        session.setAttribute("c_page", page);
        session.setAttribute("course", course);
    }

    /**管理用户方法**/

    // 通过分页查询课程信息
    @Override
    public void showManageCourseByPage(HttpServletRequest request, HttpSession session) {
        // 获得当前所在页数
        String pageNow = request.getParameter("pageNow");
        // 定义一个course数组
        List<Course> course;
        //查询课程总数
        int totalCount = (int) dao.getCourseCount();
        if (pageNow != null) { // 当前页数不为空,返回当前页数
            page = new PageUtil(totalCount, Integer.parseInt(pageNow));
            course = dao.selectByPage(page.getStartPos(), page.getPageSize());
        } else { // 当前页数为空则返回第一页
            page = new PageUtil(totalCount, 1);
            course = dao.selectByPage(page.getStartPos(), page.getPageSize());
        }
        session.setAttribute("c_page", page);
        session.setAttribute("course", course);
    }

    // 删除课程的方法
    @Override
    public boolean deleteCourse(HttpServletRequest request) {
        // 判断数据库返回修改的行数是否大于1(删除的行数)
        if(dao.deleteCourse(Integer.parseInt(request.getParameter("CId"))) > 0){
            request.setAttribute("msg","删除成功！");
            return true;
        } else {
            request.setAttribute("msg", "删除失败！");
            return false;
        }
    }

    // 通过CId查询课程信息，并通过request传递课程信息
    @Override
    public void findByCId(HttpServletRequest request) {
        // 通过request对象获得CId，使用dao层来查询课程信息
        request.setAttribute("course", dao.findByCId(Integer.parseInt(request.getParameter("CId"))));
    }

    // 修改课程信息
    @Override
    public void manageUpdate(Course course, HttpServletRequest request) {
        if(dao.manageUpdate(course) >0){
            request.setAttribute("msg", "修改成功");
        } else {
            request.setAttribute("msg", "修改失败");
        }
    }

    // 模糊查询课程信息
    @Override
    public void findByFuzzy(HttpServletRequest request) {
        // 通过request对象获得查询参数key和value
        String key = request.getParameter("key");
        String value = request.getParameter("value");
        System.out.println(key + value);
        // 通过dao层查询数据库内容
        List<Course> list = dao.findByFuzzy(key, value);
        // 判断查询的数据的条数是否大于0
        if (list.size() > 0){
            // 通过request对象返回查询的内容
            request.setAttribute("course", list);
            // 重新设置page的值
            page.setPageNow(1);
            page.setTotalCount(list.size());
            page.setTotalPageCount(1);
            request.setAttribute("_page", page);
        } else {
            request.setAttribute("msg", "查询失败！");
        }
    }

    // 添加课程信息的方法
    @Override
    public void addCourse(Course course, HttpServletRequest request) {
        if(dao.save(course) > 0){
            request.setAttribute("msg", "添加成功！");
        } else {
            request.setAttribute("msg", "添加失败！");
        }
    }

    // 检查课程编号是否重复的方法
    @Override
    public boolean checkCNum(String CNum) {
        // 如果存在则返回true
        return dao.checkCNum(CNum) > 0;
    }

}
