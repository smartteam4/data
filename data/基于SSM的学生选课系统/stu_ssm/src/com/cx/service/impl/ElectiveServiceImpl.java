package com.cx.service.impl;

import com.cx.mapper.ElectiveMapper;
import com.cx.pojo.Elective;
import com.cx.pojo.User;
import com.cx.service.ElectiveService;
import com.cx.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class ElectiveServiceImpl implements ElectiveService {

    @Autowired
    private ElectiveMapper dao;
    @Autowired
    private User user;
    @Autowired
    private Elective elective;
    @Autowired
    private PageUtil page;

    // 查找用户选课信息
    @Override
    public Elective findByUId(Integer UId) {
        return dao.findByUId(UId);
    }

    // 保存选课信息
    @Override
    public void saveElective(HttpServletRequest request, HttpSession session) {
        // 通过session获取用户信息
        user = (User) session.getAttribute("user");
        // 把获得的用户ID赋值给elective对象
        elective.setUId(user.getUId());
        // 通过request对象获得课程ID，使用强转设置课程ID
        elective.setCId(Integer.parseInt(request.getParameter("CId")));

        // 通过用户ID查找用户选课信息，如果用户已经存在选课信息则返回提示
        if(dao.findByUId(user.getUId()) != null){
            request.setAttribute("msg", "你已经选过课了");
        } else {
            if (dao.save(elective) > 0){
                request.setAttribute("msg", "选课成功！");
            } else {
                request.setAttribute("msg", "选课失败！");
            }
        }
    }

    // 删除选课信息
    @Override
    public void deleteElective(HttpServletRequest request, HttpSession session) {
        // 通过session获取用户信息
        user = (User) session.getAttribute("user");
        // 把获得的用户ID赋值给elective对象
        elective.setUId(user.getUId());
        // 通过request对象获得课程ID，使用强转设置课程ID
        elective.setCId(Integer.parseInt(request.getParameter("CId")));
        if(dao.findByUId(user.getUId()) == null){
            request.setAttribute("msg", "你还没有选课！");
        } else {
            // 通过用户ID找到选课信息，通过选课ID删除选课信息
            if (dao.delete(dao.findByUId(user.getUId()).getEId()) > 0){
                request.setAttribute("msg", "取消成功！");
            } else {
                request.setAttribute("msg", "取消失败！");
            }
        }
    }

    // 通过分页查询选课信息
    @Override
    public void showElectiveByPage(HttpServletRequest request, HttpSession session) {
        // 获得当前所在页数
        String pageNow = request.getParameter("pageNow");
        // 定义一个course数组
        List<Elective> list;
        //查询选课信息总数
        int totalCount = (int) dao.getElectiveCount();
        if (pageNow != null) { // 当前页数不为空,返回当前页数
            page = new PageUtil(totalCount, Integer.parseInt(pageNow));
            list = dao.selectElectiveByPage(page.getStartPos(), page.getPageSize());
        } else { // 当前页数为空则返回第一页
            page = new PageUtil(totalCount, 1);
            list = dao.selectElectiveByPage(page.getStartPos(), page.getPageSize());
        }
        session.setAttribute("e_page", page);
        session.setAttribute("elective", list);
    }

    // 模糊查询选课信息
    @Override
    public void findByFuzzy(HttpServletRequest request) {
        // 通过request对象获得查询参数key和value
        String key = request.getParameter("key");
        String value = request.getParameter("value");
        System.out.println(key + value);
        // 通过dao层查询数据库内容
        List<Elective> list = dao.findByFuzzy(key, value);
        // 判断查询的数据的条数是否大于0
        if (list.size() > 0){
            // 通过request对象返回查询的内容
            request.setAttribute("elective", list);
            // 重新设置page的值
            page.setPageNow(1);
            page.setTotalCount(list.size());
            page.setTotalPageCount(1);
            request.setAttribute("e_page", page);
        } else {
            request.setAttribute("msg", "查询失败！");
        }
    }

    // 删除选课信息
    @Override
    public void manageDeleteElective(HttpServletRequest request) {
        // 通过request对象传递EId删除选课信息
        if(dao.delete(Integer.parseInt(request.getParameter("EId"))) > 0){
            request.setAttribute("msg", "删除成功！");
        } else {
            request.setAttribute("msg", "删除失败！");
        }
    }
}
