package com.cx.service.impl;

import com.cx.mapper.BulletinMapper;
import com.cx.pojo.Bulletin;
import com.cx.service.BulletinService;
import com.cx.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class BulletinServiceImpl implements BulletinService {

    @Autowired
    private BulletinMapper dao;
    @Autowired
    private Bulletin bulletin;
    @Autowired
    private PageUtil page;

    // 查询所有公告
    @Override
    public void findAllBulletin(HttpSession session) {
        // 如果查询条数大于0则返回list,否则返回null
        if (dao.findAll().size() > 0){
            // 通过session保存公告信息
            session.setAttribute("bulletin", dao.findAll());
        }
    }

    // 通过分页查询课程信息
    @Override
    public void showBulletinByPage(HttpServletRequest request, HttpSession session) {

        // 获得当前所在页数
        String pageNow = request.getParameter("pageNow");
        // 定义一个course数组
        List<Bulletin> list;
        //查询用户总数
        int totalCount = (int) dao.getBulletinCount();
        if (pageNow != null) { // 当前页数不为空,返回当前页数
            page = new PageUtil(totalCount, Integer.parseInt(pageNow));
            list = dao.selectByPage(page.getStartPos(), page.getPageSize());
        } else { // 当前页数为空则返回第一页
            page = new PageUtil(totalCount, 1);
            list = dao.selectByPage(page.getStartPos(), page.getPageSize());
        }
        session.setAttribute("b_page", page);
        session.setAttribute("bulletin", list);
    }

    // 通过BId查询公告信息
    @Override
    public void findByBId(HttpServletRequest request) {
        // 通过BId查找信息后赋值给bulletin
        bulletin = dao.findByBId(Integer.parseInt(request.getParameter("BId")));
        // 如果bulletin不为空则通过session保存公告信息
        if (bulletin != null){
            request.setAttribute("bulletinContent", bulletin);
        }
    }

    // 模糊查询公告信息
    @Override
    public void findByFuzzy(HttpServletRequest request) {
        // 通过request对象获得查询参数key和value
        String key = request.getParameter("key");
        String value = request.getParameter("value");
        System.out.println(key + value);
        // 通过dao层查询数据库内容
        List<Bulletin> list = dao.findByFuzzy(key, value);
        // 判断查询的数据的条数是否大于0
        if (list.size() > 0){
            // 通过request对象返回查询的内容
            request.setAttribute("bulletin", list);
        } else {
            request.setAttribute("err", "查询失败！");
        }
    }

    // 删除公告的方法
    @Override
    public void deleteBulletinByBId(HttpServletRequest request) {
        // 通过request对象获得BId
        // 通过dao删除用户，判断数据库修改的行数是否大于0
        if (dao.delete(Integer.parseInt(request.getParameter("BId"))) > 0){
            request.setAttribute("msg", "删除成功！");
        } else {
            request.setAttribute("msg", "删除失败！");
        }
    }

    // 更新公告的方法
    @Override
    public void updateBulletinByBId(Bulletin bulletin, HttpServletRequest request) {
        if(dao.update(bulletin) > 0){
            request.setAttribute("msg", "更新成功！");
        } else {
            request.setAttribute("msg", "更新失败！");
        }
    }

    // 添加公告的方法
    @Override
    public void addBulletin(Bulletin bulletin, HttpServletRequest request) {
        if(dao.save(bulletin) > 0){
            request.setAttribute("msg", "保存成功！");
        } else {
            request.setAttribute("msg", "保存失败！");
        }
    }
}
