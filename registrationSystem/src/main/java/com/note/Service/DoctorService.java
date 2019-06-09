package com.note.Service;

import java.util.List;

import com.note.Model.Doctor;

public interface DoctorService {
	
	int AddDoctor(Doctor doc);
	
	Doctor selectDoctorByName(String docName);

	List<Doctor> getAllDoctorInfo();
	
	Doctor getDoctorById(Integer id);
	
	int updateDoctor(Doctor doc);
	
	int updateDoctorStatus(Doctor doc);
	
	int updateDocWorkStatus(Doctor doc);
	
	List<Doctor> getDoctorByDeptId(Integer id);
}
