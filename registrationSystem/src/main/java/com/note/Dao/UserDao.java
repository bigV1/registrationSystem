package com.note.Dao;

import java.util.List;

import com.note.Model.User;

/**
 * 描述:用户mapper接口
 * 
 */
public interface UserDao {
	
	/**
     * @param username
     * @return User
     */
	User selectUserByUsername(String username);
    /**
     * @param username
     * @param password
     * @return id
     */
    int AddUser(User user);
    /**
     * 
     * @param user
     * @return
     */
    int updateUserByUsername(User user);
    /**
     * 
     * @param startRow
     * @param pageSize
     * @return
     */
    List getAllUserInfo(String startRow,String pageSize);
}
