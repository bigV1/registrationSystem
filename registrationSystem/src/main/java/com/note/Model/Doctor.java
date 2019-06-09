package com.note.Model;

public class Doctor {
	
	private Integer doctorId;//医生id
	private Integer deptId;//科室id
	private String deptName;
	private String doctorName;//医生名字
	private String doctorDes;//医生介绍
	private Integer workStatus;//上班状态
	private String workTime;//上班时间
	
	public Integer getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getDoctorDes() {
		return doctorDes;
	}
	public void setDoctorDes(String doctorDes) {
		this.doctorDes = doctorDes;
	}
	public Integer getWorkStatus() {
		return workStatus;
	}
	public void setWorkStatus(Integer workStatus) {
		this.workStatus = workStatus;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	
}
