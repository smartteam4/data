package com.cx.pojo;

import org.springframework.stereotype.Component;

@Component
public class User {
	private Integer UId; // 用户ID
	private String UUsername; // 用户名
	private String UPassword; // 密码
	private String UName; // 用户姓名
	private Integer USex; // 用户性别
	private String UClass; // 用户班级
	private String UEmail; // 用户邮箱
	private Integer UType; // 用户类型
	private String UPhone; // 手机号
	private Integer UStatus; // 用户状态
	
	public User() {
		super();
	}

	public User(String UUsername, String UPassword, String UName, Integer USex, String UClass, String UEmail, Integer UType, String UPhone, Integer UStatus) {
		this.UUsername = UUsername;
		this.UPassword = UPassword;
		this.UName = UName;
		this.USex = USex;
		this.UClass = UClass;
		this.UEmail = UEmail;
		this.UType = UType;
		this.UPhone = UPhone;
		this.UStatus = UStatus;
	}

	public Integer getUId() {
		return UId;
	}

	public void setUId(Integer UId) {
		this.UId = UId;
	}

	public String getUUsername() {
		return UUsername;
	}

	public void setUUsername(String UUsername) {
		this.UUsername = UUsername;
	}

	public String getUPassword() {
		return UPassword;
	}

	public void setUPassword(String UPassword) {
		this.UPassword = UPassword;
	}

	public String getUName() {
		return UName;
	}

	public void setUName(String UName) {
		this.UName = UName;
	}

	public Integer getUSex() {
		return USex;
	}

	public void setUSex(Integer USex) {
		this.USex = USex;
	}

	public String getUClass() {
		return UClass;
	}

	public void setUClass(String UClass) {
		this.UClass = UClass;
	}

	public String getUEmail() {
		return UEmail;
	}

	public void setUEmail(String UEmail) {
		this.UEmail = UEmail;
	}

	public Integer getUType() {
		return UType;
	}

	public void setUType(Integer UType) {
		this.UType = UType;
	}

	public String getUPhone() {
		return UPhone;
	}

	public void setUPhone(String UPhone) {
		this.UPhone = UPhone;
	}

	public Integer getUStatus() {
		return UStatus;
	}

	public void setUStatus(Integer UStatus) {
		this.UStatus = UStatus;
	}

	@Override
	public String toString() {
		return "User{" +
				"UId=" + UId +
				", UUsername='" + UUsername + '\'' +
				", UPassword='" + UPassword + '\'' +
				", UName='" + UName + '\'' +
				", USex=" + USex +
				", UClass='" + UClass + '\'' +
				", UEmail='" + UEmail + '\'' +
				", UType=" + UType +
				", UPhone='" + UPhone + '\'' +
				", UStatus=" + UStatus +
				'}';
	}
}
