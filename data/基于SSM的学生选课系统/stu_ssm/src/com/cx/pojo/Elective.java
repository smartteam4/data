package com.cx.pojo;

import org.springframework.stereotype.Component;

@Component
public class Elective {
	private Integer EId;
	private Integer UId;
	private Integer CId;
	private User user;
	private Course course;

	@Override
	public String toString() {
		return "Elective{" +
				"EId=" + EId +
				", UId=" + UId +
				", CId=" + CId +
				", user=" + user +
				", course=" + course +
				'}';
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Elective() {
		super();
	}

	public Elective(Integer uId, Integer cId) {
		super();
		UId = uId;
		CId = cId;
	}

	public Integer getEId() {
		return EId;
	}

	public void setEId(Integer eId) {
		EId = eId;
	}

	public Integer getUId() {
		return UId;
	}

	public void setUId(Integer uId) {
		UId = uId;
	}

	public Integer getCId() {
		return CId;
	}

	public void setCId(Integer cId) {
		CId = cId;
	}

}
