package com.note.Model;

public class Department {
	
	private String departmentName;//科室名字
	private String departmentDes;//科室描述
	private Integer departmentId;//科室id
	private String departmentArea;//科室位置
	
	public String getDepartmentArea() {
		return departmentArea;
	}
	public void setDepartmentArea(String departmentArea) {
		this.departmentArea = departmentArea;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getDepartmentDes() {
		return departmentDes;
	}
	public void setDepartmentDes(String departmentDes) {
		this.departmentDes = departmentDes;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	
}
