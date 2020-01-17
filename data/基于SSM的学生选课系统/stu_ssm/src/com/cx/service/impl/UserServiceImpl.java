package com.cx.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cx.mapper.ElectiveMapper;
import com.cx.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cx.mapper.UserMapper;
import com.cx.pojo.User;
import com.cx.service.UserService;

/**
 * 用户业务实现类
 * @author 崔信
 *实现用户的业务
 */
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper dao;
	@Autowired
	private User user;
	@Autowired
	private PageUtil page;
	@Autowired
	ElectiveMapper electiveDao;

	@Override
	public List<User> findAllUsers(HttpSession session) {
		session.setAttribute("user",dao.findAll());
		return dao.findAll().size() > 0 ? dao.findAll() : null;
	}

	// 保存用户信息，通过request返回信息
	@Override
	public boolean saveUser(User user, HttpServletRequest request) {
		if(dao.checkUsername(user.getUUsername()) > 0) {
			// 用户重新提交注册，通过request返回false并返回提示信息
			request.setAttribute("error", "请勿重复刷新注册！");
			return true;
		} else {
			if (dao.save(user) > 0) {
				// 修改数据库的行数大于0（保存成功），通过request返回true并返回提示信息
				request.setAttribute("msg", "恭喜您注册成功了，赶快登录吧！");
				return true;
			}
		}
		// 修改数据库的行数部大于0（保存失败），通过request返回false并返回提示信息
		request.setAttribute("error", "注册失败，请联系系统管理员！");
		return false;
	}

	// 登录，检查用户名和密码是否正确
	@Override
	public boolean login(User user, HttpServletRequest request, HttpSession session) {
		// 判断用户名和密码是否存在，如果存在则返回true，否则返回false
		if (dao.login(user) > 0) {
			// 通过session保存用户名
			session.setAttribute("username", user.getUUsername());
			// 执行一遍findUser方法，保存用户信息到session
			findUser(user.getUUsername(), session);
			return true;
		}
		// 验证失败返回错误信息
		request.setAttribute("error", "密码错误，请确认后重试！");
		return false;
	}

	// 检查账户是否被禁用
	@Override
	public boolean checkStatus(User user, HttpServletRequest request) {
		// 判断账号是否被禁用，如果禁用则返回false，并通过request对象返回错误信息，否则返回true
		if (dao.status(user) != 1) {
			request.setAttribute("error", "账户被禁用");
			return false;
		}
		return true;
	}
	
	// 判断查询的用户名是否存在
	@Override
	public boolean checkUsername(String username) {
		// 判断是否存在该用户名，如果存在则返回true，否则返回false
		if (dao.checkUsername(username) > 0) {
			return true;
		}
		return false;
	}

	// 判断用户账号类型，并设置session
	@Override
	public boolean checkType(String username, HttpSession session) {
		// 如果用户类型为0则为管理员返回true，否则返回false
		if(dao.checkType(username) == 0){
			session.setAttribute("LOGIN_USER","MANAGE");
			return true;
		}
		session.setAttribute("LOGIN_USER","GENERAL");
		return false;
	}

	// 查找用户信息，通过session传递对象
	@Override
	public void findUser(String username, HttpSession session) {
		// 找到用户信息之后通过session传递信息
		session.setAttribute("user",dao.findUser(username));
	}

	// 普通用户修改信息，通过request返回信息
	@Override
	public boolean generalUpdate(User user, HttpServletRequest request) {
		if (dao.generalUpdate(user) > 0){
			request.setAttribute("msg","修改成功！");
			return true;
		}
		request.setAttribute("msg","修改失败！");
		return false;
	}

	// 修改用户密码
	@Override
	public boolean updatePassword(String password, HttpServletRequest request, HttpSession session) {
		// 通过session获取用户信息
		user = (User) session.getAttribute("user");
		// 把新密码赋值给user对象
		user.setUPassword(password);
		if (dao.updatePassword(user) > 0){
			request.setAttribute("msg", "修改成功！");
			return true;
		}
		request.setAttribute("msg", "修改失败！");
		return false;
	}

	// 管理员方法
	// 分页显示用户个人信息的方法
	@Override
	public void showUserByPage(HttpServletRequest request, HttpSession session) {
		// 获得当前所在页数
		String pageNow = request.getParameter("pageNow");
		// 定义一个user数组
		List<User> user;
		//查询用户总数
		int totalCount = (int) dao.getUserCount();
		if (pageNow != null) { // 当前页数不为空,返回当前页数
			page = new PageUtil(totalCount, Integer.parseInt(pageNow));
			user = dao.selectByPage(page.getStartPos(), page.getPageSize());
		} else { // 当前页数为空则返回第一页
			page = new PageUtil(totalCount, 1);
			user = dao.selectByPage(page.getStartPos(), page.getPageSize());
		}
		session.setAttribute("u_page", page);
		session.setAttribute("user", user);
	}

	// 通过UId删除用户信息的方法
	@Override
	public void deleteUser(HttpServletRequest request) {
		Integer UId = Integer.parseInt(request.getParameter("UId"));
		// 先删除该用户的选课信息
		electiveDao.deleteByUId(UId);
		// 通过dao层调用删除用户的方法，用户id通过request对象获得
		// 如果数据库修改的行数大于1则删除成功
		if (dao.deleteUser(UId) > 0){
			request.setAttribute("msg","删除成功！");
		} else {
			request.setAttribute("msg","删除失败！");
		}

	}

	// 通过UId查询个人信息，并通过request传递个人信息
	@Override
	public void findByUId(HttpServletRequest request) {
		// 通过request对象获得UId，使用dao层来查询课程信息
		request.setAttribute("user", dao.findByUId(Integer.parseInt(request.getParameter("UId"))));
	}

	// 管理员修改信息，通过request返回信息
	@Override
	public boolean manageUpdate(User user, HttpServletRequest request) {
		if (dao.manageUpdate(user) > 0){
			request.setAttribute("msg","修改成功！");
			return true;
		}
		request.setAttribute("msg","修改失败！");
		return false;
	}

	// 模糊查询用户信息
	@Override
	public void findByFuzzy(HttpServletRequest request) {
		// 通过request对象获得查询参数key和value
		String key = request.getParameter("key");
		String value = request.getParameter("value");
		System.out.println(key + value);
		// 通过dao层查询数据库内容
		List<User> list = dao.findByFuzzy(key, value);
		// 判断查询的数据的条数是否大于0
		if (list.size() > 0){
			// 通过request对象返回查询的内容
			request.setAttribute("user", list);
			// 重新设置page的值
			page.setPageNow(1);
			page.setTotalCount(list.size());
			page.setTotalPageCount(1);
			request.setAttribute("u_page", page);
		} else {
			request.setAttribute("msg", "查询失败！");
		}
	}

	// 管理员添加用户的方法
	@Override
	public void addUser(User user, HttpServletRequest request) {
		if (dao.save(user) > 0){
			request.setAttribute("msg", "保存成功！");
		}else {
			request.setAttribute("msg", "保存失败！");
		}
	}

}
