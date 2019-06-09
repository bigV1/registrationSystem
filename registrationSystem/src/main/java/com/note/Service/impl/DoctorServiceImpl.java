package com.note.Service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.note.Dao.DoctorDao;
import com.note.Model.Doctor;
import com.note.Service.DoctorService;

@Service
public class DoctorServiceImpl implements DoctorService{
	
	@Autowired
	private DoctorDao docDao;  
	
	 public Doctor selectDoctorByName(String docName){
	      return docDao.selectDoctorByName(docName);
	 }
	 
	 public int AddDoctor(Doctor doc){  
	      return docDao.AddDoctor(doc);
	 }	 
	 
	 public List<Doctor> getAllDoctorInfo() {
		 return docDao.getAllDoctorInfo();
	 }
	 
	 public Doctor getDoctorById(Integer id) {
		 return docDao.getDoctorById(id);
	 }
	 
	 public int updateDoctor(Doctor doc) {
		 return docDao.updateDoctor(doc);
	 }
	 
	 public int updateDoctorStatus(Doctor doc) {
		 return docDao.updateDoctorStatus(doc);
	 }
	 
	 public int updateDocWorkStatus(Doctor doc) {
		 return docDao.updateDocWorkStatus(doc);
	 }
	 
	 public List<Doctor> getDoctorByDeptId(Integer id){
		 return docDao.getDoctorByDeptId(id);
	 }
}
