package com.cx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cx.pojo.User;

/**
 * 用户业务接口
 * @author 崔信
 *用来定义业务接口
 */
public interface UserService {

	// 查找所有用户数据
	public List<User> findAllUsers(HttpSession session);

	// 登录验证用户名和密码是否正确
	public boolean login(User user, HttpServletRequest request, HttpSession session);

	// 检查账户是否被禁用，如果被禁用则使用request设置提示语句
	public boolean checkStatus(User user, HttpServletRequest request);

	// 保存用户信息，通过request返回信息
	public boolean saveUser(User user, HttpServletRequest request);

	// 检查用户名是否存在
	public boolean checkUsername(String username);

	// 判断用户账号类型，并设置session
	public boolean checkType(String username, HttpSession session);

	// 查找用户信息，通过session传递对象
	public void findUser(String username, HttpSession session);

	// 普通用户修改信息，通过request返回信息
	public boolean generalUpdate(User user, HttpServletRequest request);

	// 更新用户密码
	public boolean updatePassword(String password, HttpServletRequest request, HttpSession session);

	// 分页查询用户信息
	public void showUserByPage(HttpServletRequest request, HttpSession session);

	// 删除用户的方法
	public void deleteUser(HttpServletRequest request);

	// 通过UId查询用户信息的方法
	public void findByUId(HttpServletRequest request);

	// 管理员修改信息，通过request返回信息
	public boolean manageUpdate(User user, HttpServletRequest request);

	// 模糊查询用户信息
	public void findByFuzzy(HttpServletRequest request);

	// 管理员保存用户信息，通过request返回信息
	public void addUser(User user, HttpServletRequest request);
}
