package com.cx.service;

import com.cx.pojo.Elective;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface ElectiveService {

    // 查找用户选课信息
    public Elective findByUId(Integer UId);

    // 保存选课信息
    public void saveElective(HttpServletRequest request, HttpSession session);

    // 删除选课信息
    public void deleteElective(HttpServletRequest request, HttpSession session);

    // 通过分页显示选课信息
    public void showElectiveByPage(HttpServletRequest request, HttpSession session);

    // 模糊查询选课信息
    public void findByFuzzy(HttpServletRequest request);

    // 管理员删除选课信息
    public void manageDeleteElective(HttpServletRequest request);
}
