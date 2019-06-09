package com.note.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.note.Dao.DepartmentDao;
import com.note.Model.Department;
import com.note.Service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	private DepartmentDao deptDao;  
	
	 public Department selectDeptByName(String deptName){
	      return deptDao.selectDeptByName(deptName);
	 }
	 
	 public int AddDepartment(Department dept){  
	      return deptDao.AddDepartment(dept);
	 }
	 
	 public int updateDeptByDept(Department dept) {
		 return deptDao.updateDeptByName(dept);
	 }
	 
	 public List<Department> getAllDeptInfo() {
		 return deptDao.getAllDeptInfo();
	 }
	 
	 public Department getDeptById(Integer id) {
		 return deptDao.getDeptById(id);
	 }
	 
	 public int updateDept(Department dept) {
		 return deptDao.updateDept(dept);
	 }
	 
	 public int updateDeptStatus(Department dept) {
		 return deptDao.updateDeptStatus(dept);
	 }
}
