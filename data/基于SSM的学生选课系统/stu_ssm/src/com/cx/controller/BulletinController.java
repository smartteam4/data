package com.cx.controller;

import com.cx.pojo.Bulletin;
import com.cx.service.BulletinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class BulletinController {

    @Autowired
    private BulletinService bulletinService;
    @Autowired
    private Bulletin bulletin;

    // 跳转到公告页面
    @RequestMapping("/general/bulletin")
    public String bulletin(HttpServletRequest request, HttpSession session){
        bulletinService.showBulletinByPage(request, session);
        return "general/bulletin";
    }

    // 跳转到公告详情页面
    @RequestMapping("/general/bulletin.action")
    public String bulletinContent(HttpServletRequest request){
        bulletinService.findByBId(request);
        return "general/bulletinContent";
    }

    // 管理员操作

    // 跳转到公告页面
    @RequestMapping("/manage/bulletin")
    public String ManageBulletin(HttpServletRequest request, HttpSession session){
        bulletinService.showBulletinByPage(request, session);
        return "manage/bulletin";
    }

    // 模糊查询公告信息
    @RequestMapping("/manage/bulletin.search")
    public String findByFuzzy(HttpServletRequest request){
        bulletinService.findByFuzzy(request);
        return "manage/bulletin";
    }

    // 删除公告的方法
    @RequestMapping("/manage/deleteBulletin")
    public String deleteBulletin(HttpServletRequest request){
        bulletinService.deleteBulletinByBId(request);
        return "manage/bulletin";
    }

    // 跳转到管理用户用户修改公告界面
    @RequestMapping("/manage/updateBulletin")
    public String updateBulletin(HttpServletRequest request){
        bulletinService.findByBId(request);
        return "manage/updateBulletin";
    }

    // 管理员修改公告的方法
    @RequestMapping("/manage/updateBulletin.action")
    public String updateBulletinAction(Integer BId, String title, String date, String content,
                                       String drop, HttpServletRequest request){
        bulletin.setBId(BId);
        bulletin.setBTitle(title);
        bulletin.setBDate(java.sql.Date.valueOf(date));
        bulletin.setBContent(content);
        bulletin.setBDrop(drop);
        bulletinService.updateBulletinByBId(bulletin, request);
        return "manage/bulletin";
    }

    // 保存公告
    @RequestMapping("/manage/addBulletin.action")
    public String addBulletinAction(String title, String date, String content,
                                       String drop, HttpServletRequest request){
        bulletin.setBTitle(title);
        bulletin.setBDate(java.sql.Date.valueOf(date));
        bulletin.setBContent(content);
        bulletin.setBDrop(drop);
        bulletinService.addBulletin(bulletin, request);
        return "manage/bulletin";
    }
}
