package com.cx.service;

import com.cx.pojo.Bulletin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface BulletinService {

    // 查找所有公告
    public void findAllBulletin(HttpSession session);

    // 通过分页查询公告
    public void showBulletinByPage(HttpServletRequest request, HttpSession session);

    // 通过BId查找公告
    public void findByBId(HttpServletRequest request);

    // 模糊查询公告
    public void findByFuzzy(HttpServletRequest request);

    // 删除公告的方法
    public void deleteBulletinByBId(HttpServletRequest request);

    // 更新公告的方法
    public void updateBulletinByBId(Bulletin bulletin, HttpServletRequest request);

    // 保存公告的方法
    public void addBulletin(Bulletin bulletin, HttpServletRequest request);
}
