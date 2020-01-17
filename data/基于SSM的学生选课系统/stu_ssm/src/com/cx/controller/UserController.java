package com.cx.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cx.pojo.User;
import com.cx.service.UserService;

/*
 * @Controller 适用于Controller和Action
 * @ResponseBody  可以设置数据处理完并可以设置返回值的类型
 * @RestController  //数据处理以json格式处理
*/
@Controller
public class UserController {

	@Autowired // 声明一个用户的service并自动注入
	private UserService userService;
	
	@Autowired //定义User实体类并自动注入
	private User user;
	
	@RequestMapping("/findAllUser")
	public String findAllUser(HttpSession session) {
		userService.findAllUsers(session);
		return "showUser";
	}

	// 验证用户登录的方法
	@RequestMapping("/login.action")
	public String login(String username, String password, HttpServletRequest request, HttpSession session) {
		// 用户第一次进入，username和password为空则直接进入登录页面
		if(username == null && password == null){
			return "login";
		}
		// 把接收到的用户名和密码复制到user对象中
		user.setUUsername(username);
		user.setUPassword(password);
		// 通过传递user对象判断用户名和密码是否正确，以及账户是否被禁用
		if(userService.login(user, request, session) && userService.checkStatus(user, request)) {
			// 如果该用户为管理员用户则跳转到manageHome，否则跳转到home
			if(userService.checkType(username, session)){
				return "manage/home";
			}
			return "general/home";
		}
		return "login";
	}

	// 用户注册的方法
	@RequestMapping("/reg.action")
	public String saveUserByRegister(String username, String password, String name, Integer sex,
			String classes, String email, int type, String phone, HttpServletRequest request) {
		// 通过注册页面获取到的值赋值给user对象，设置账户状态默认为1启用状态
		User user = new User(username, password, name, sex, classes, email, type, phone, 1);
		if(userService.saveUser(user, request)) {
			return "login";
		}
		return "reg";
	}
	
	// 检查用户名是否存在重复的方法
	@RequestMapping("/checkUsername")
	@ResponseBody
	public boolean checkUsername(String username) {
		return userService.checkUsername(username);
	}

	// 管理员添加用户界面,检查用户名是否存在重复的方法
	@RequestMapping("manage/checkUsername")
	@ResponseBody
	public boolean manageCheckUsername(String username) {
		return userService.checkUsername(username);
	}

	// 普通用户修改个人信息的方法
	@RequestMapping("/general/updatePerson.action")
	public String updatePerson(String name, Integer sex, String classes, String email,
							   String phone, HttpSession session,HttpServletRequest request) {
		// 通过session拿到已有用户信息
		user = (User) session.getAttribute("user");
		// 把用户提交的数据赋值给user对象
		user.setUName(name);
		user.setUSex(sex);
		user.setUClass(classes);
		user.setUEmail(email);
		user.setUPhone(phone);
		userService.generalUpdate(user,request);
		return "general/person";
	}

	// 跳转到个人信息页面
	@RequestMapping("/general/person")
	public String person(HttpSession session){
		userService.findUser((String) session.getAttribute("username"),session);
		return "general/person";
	}

	// 跳转到更新个人信息页面
	@RequestMapping("/general/updatePerson")
	public String updatePerson(HttpSession session){
		userService.findUser((String) session.getAttribute("username"),session);
		return "general/updatePerson";
	}

	// 普通用户修改密码
	@RequestMapping("/general/updatePassword.action")
	public String updatePassword(String password, HttpServletRequest request, HttpSession session){
		userService.updatePassword(password, request, session);
		return "general/updatePassword";
	}
	// 管理员修改密码
	@RequestMapping("/manage/updatePassword.action")
	public String updateManagePassword(String password, HttpServletRequest request, HttpSession session){
		userService.updatePassword(password, request, session);
		return "manage/updatePassword";
	}

	// 退出登录,销毁session
	@RequestMapping("/logout.action")
	public String logout(HttpSession session){
		// 销毁session
		session.invalidate();
		return "login";
	}

	/**管理用户方法**/

	// 分页显示用户信息
	@RequestMapping("/manage/person")
	public String showUserByPage(HttpServletRequest request, HttpSession session){
		userService.showUserByPage(request, session);
		return "manage/person";
	}

	// 删除用户的方法
	@RequestMapping("/manage/deleteUser")
	public String deleteUser(HttpServletRequest request){
		userService.deleteUser(request);
		return "manage/person";
	}

	// 跳转到修改用户信息
	@RequestMapping("/manage/updatePerson")
	public String updatePersonPage(HttpServletRequest request){
		userService.findByUId(request);
		return "manage/updatePerson";
	}

	// 管理员修改个人信息的方法
	@RequestMapping("/manage/updatePerson.action")
	public String manageUpdatePerson(Integer UId, String password, String name, Integer sex, String classes,
									 String email, Integer type, String phone, Integer status,
									 HttpServletRequest request) {
		// 把用户提交的数据赋值给user对象
		user.setUId(UId);
		user.setUPassword(password);
		user.setUName(name);
		user.setUSex(sex);
		user.setUClass(classes);
		user.setUEmail(email);
		user.setUType(type);
		user.setUPhone(phone);
		user.setUStatus(status);
		// 通过业务层进行数据处理
		userService.manageUpdate(user, request);
		return "manage/person";
	}

	// 模糊查询用户信息
	@RequestMapping("/manage/person.search")
	public String findByFuzzy(HttpServletRequest request){
		userService.findByFuzzy(request);
		return "manage/person";
	}

	// 管理员添加用户的方法
	@RequestMapping("/manage/addPerson.action")
	public String addPerson(String username, String password, String name, Integer sex,
							String classes, String email, Integer type, String phone,
							Integer status, HttpServletRequest request){
		// 获得提交的数据赋值给user
		user.setUUsername(username);
		user.setUPassword(password);
		user.setUName(name);
		user.setUSex(sex);
		user.setUClass(classes);
		user.setUEmail(email);
		user.setUType(type);
		user.setUPhone(phone);
		user.setUStatus(status);
		// 通过业务层完成信息的添加
		userService.addUser(user, request);
		return "manage/person";
	}
}
