package com.note.Service;

import com.note.Model.User;

public interface UserService {
	
	User selectUserByUsername(String username);
	
	int AddUser(User user);
	
	int updateUserByUsername(User user);
}
