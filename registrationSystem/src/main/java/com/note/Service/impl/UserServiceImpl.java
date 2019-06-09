package com.note.Service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.note.Dao.UserDao;
import com.note.Model.User;
import com.note.Service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired  
	private UserDao userDao;  
	
	 public User selectUserByUsername(String username){  
	      return userDao.selectUserByUsername(username);  
	 }
	 
	 public int AddUser(User user){  
	      return userDao.AddUser(user);
	 }
	 
	 public int updateUserByUsername(User user) {
		 return userDao.updateUserByUsername(user);
	 }
}
