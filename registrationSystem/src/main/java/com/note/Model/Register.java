package com.note.Model;

public class Register {
	
	private int registerId;
	private String hzUsername;
	private String hzName;
	private int hzId;
	private String address;
	private String tel;
	private String doctorName;
	private int doctorId;
	private String deptName;
	private int deptId;
	private int ghStatus;
	private String registerTime;
	
	public String getHzUsername() {
		return hzUsername;
	}
	public void setHzUsername(String hzUsername) {
		this.hzUsername = hzUsername;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getRegisterId() {
		return registerId;
	}
	public void setRegisterId(int registerId) {
		this.registerId = registerId;
	}
	public String getHzName() {
		return hzName;
	}
	public void setHzName(String hzName) {
		this.hzName = hzName;
	}
	public int getHzId() {
		return hzId;
	}
	public void setHzId(int hzId) {
		this.hzId = hzId;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public int getGhStatus() {
		return ghStatus;
	}
	public void setGhStatus(int ghStatus) {
		this.ghStatus = ghStatus;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	private String createTime;
	
}
