package com.cx.pojo;

import org.springframework.stereotype.Component;

@Component
public class Course {
	private Integer CId; // 课程ID
	private String CNum; // 课程编号
	private String CName; // 课程名称
	private Integer CType; // 课程类型
	private double CScore; // 课程类型
	private String CTeacher; // 任课老师
	
	public Course() {
		super();
	}

	public Course(String cNum, String cName, Integer cType, double cScore, String cTeacher) {
		super();
		CNum = cNum;
		CName = cName;
		CType = cType;
		CScore = cScore;
		CTeacher = cTeacher;
	}

	public Integer getCId() {
		return CId;
	}

	public void setCId(Integer cId) {
		CId = cId;
	}

	public String getCNum() {
		return CNum;
	}

	public void setCNum(String cNum) {
		CNum = cNum;
	}

	public String getCName() {
		return CName;
	}

	public void setCName(String cName) {
		CName = cName;
	}

	public Integer getCType() {
		return CType;
	}

	public void setCType(Integer cType) {
		CType = cType;
	}

	public double getCScore() {
		return CScore;
	}

	public void setCScore(double cScore) {
		CScore = cScore;
	}

	public String getCTeacher() {
		return CTeacher;
	}

	public void setCTeacher(String cTeacher) {
		CTeacher = cTeacher;
	}

	@Override
	public String toString() {
		return "Course [CId=" + CId + ", CNum=" + CNum + ", CName=" + CName + ", CType=" + CType + ", CScore=" + CScore
				+ ", CTeacher=" + CTeacher + "]";
	}
	
}
