package com.cx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.cx.pojo.User;

@Repository //配置mybatisDAO层注入
public interface UserMapper {
	public List<User> findAll(); // 查找所有用户

	public Integer login(User user); // 验证用户名和密码是否正确
	
	public Integer status(User user); // 检查账户是否被禁用
	
	public Integer save(User user); // 保存用户
	
	public Integer checkUsername(String username); // 检查用户名是否存在

	public Integer checkType(String username); // 检查用户类型

	public User findUser(String username); // 查找用户信息

	public Integer generalUpdate(User user); // 普通用户修改信息

	public List<User> selectByPage(@Param("startPos") Integer startPos, @Param("pageSize") Integer pageSize); // 通过分页方式查找用户信息

	public Integer getUserCount(); // 获取用户总数
	
	public Integer updatePassword(User user); // 更新用户密码

	public Integer deleteUser(Integer UId); // 删除用户的方法

	public User findByUId(Integer UId); // 通过UId查询用户信息的方法

	public Integer manageUpdate(User user); // 管理员修改用户信息

	public List<User> findByFuzzy(@Param("key")String key, @Param("value")String value); // 模糊查询用户信息
}
