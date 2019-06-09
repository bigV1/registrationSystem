package com.note.Dao;

import java.util.List;

import com.note.Model.Doctor;

public interface DoctorDao {
	
	Doctor selectDoctorByName(String docName);
	   
    int AddDoctor(Doctor doc);
    
    List<Doctor> getAllDoctorInfo();
    
    Doctor getDoctorById(Integer id);
    
    int updateDoctor(Doctor doc);
    
    int updateDoctorStatus(Doctor doc);
    
    int updateDocWorkStatus(Doctor doc);
    
    List<Doctor> getDoctorByDeptId(Integer id);
}
