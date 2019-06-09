package com.note.Service;

import java.util.List;

import com.note.Model.Department;

public interface DepartmentService {
	//新增科室
	int AddDepartment(Department dept);
	//检索科室
	Department selectDeptByName(String deptName);
	//更新科室设置
	int updateDeptByDept(Department dept);
	//获取所有科室
	List getAllDeptInfo();
	//获取单个科室
	Department getDeptById(Integer id);
	//更新科室信息
	int updateDept(Department dept);
	//
	int updateDeptStatus(Department dept);
}
