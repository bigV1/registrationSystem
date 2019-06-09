package com.note.Controller;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.note.Model.User;
import com.note.Service.UserService;


@Controller
public class UserController {
	
	@Resource  
	private UserService userService; 
	
	/**
	 * 登陆 
	 * @param session
	 * @param user
	 * @return
	 */
	@RequestMapping("login.do")
	@ResponseBody
	public String login(HttpSession session,User user){
			 
		String username = user.getUsername();
		String password = user.getPassword();
	
		System.out.println("从前端获取的信息：" + username +"__"+ password);
		
		
		String result = "";
		try{
			System.out.println("开始启动select");
			User db_user = userService.selectUserByUsername(username);
			String db_password = db_user.getPassword();
			System.out.println("从数据库获取的password是："+db_password);
			if(password.equals(db_password)==false) {
				result = "error";
			}else if(password.equals(db_password)==true) {
				session.setAttribute("username",username);
				if(db_user.getLevel() == 1) {
					result = db_user.getLevel().toString();
				}else {
					result = db_user.getUsername();
				}
				
			}
		}catch(Exception e) {
			result = "error";
		}
		
		
		System.out.println(result);
		
	    //返回一个map	
	    return result;
	}
	
	/**
	 * 退出登陆
	 * @param session
	 * @return
	 */
	@RequestMapping("loginout.do")
	public String loginout(HttpSession session){
		//清楚session
		session.invalidate();
		
		return "redirect:index.do";
	}
	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@RequestMapping("register.do")
	@ResponseBody
	public String add(User user) {
		String result = "";
		
		String username = user.getUsername();
		String password = user.getPassword();
		String name = user.getName();
		System.out.println("从前端获取的信息：" + username +"__"+ password +"__"+name);
		
		try{
			System.out.println("开始启动insert");
			User db_user = userService.selectUserByUsername(username);
			Integer id = db_user.getUser_id();
			//查询到数据 返回前台账号已存在
			if(id != null) {
				result = "exists";
			}
		}catch(Exception e) {
			//查询不到数据时 插入数据
			System.out.println("开始insert进数据库");
			userService.AddUser(user);
			int pid = user.getUser_id();
			System.out.println(pid);
			result = "success";
		}
			
		System.out.println(result);
		return result; 
	}
	
	@RequestMapping("getUserData.do")
	@ResponseBody
	public User getUserData(User user) {
		User userData = null;
		String username = user.getUsername();
		
		try{
			User db_user = userService.selectUserByUsername(username);
			Integer id = db_user.getUser_id();
			//查询到数据 返回前台账号已存在
			if(id != null) {
				userData = db_user;
			}
		}catch(Exception e) {
			
		}
			
		return userData; 
	}
	
	@RequestMapping("index.do")
	public String index() {
		return "note"; 
	}
	
	/**
	 * 更新密码
	 * @param user
	 * @return
	 */
	@RequestMapping("/changePassword.do")
	@ResponseBody
	public String changePassword(User user) {
		String result = "";
		
		String username = user.getUsername();
		String password = user.getPassword();
		String name = user.getName();
		
		System.out.println("从前端获取的信息：" + username +"__"+ password +"__"+name);
		
		try {
			System.out.println("开始启动update");
			int id = userService.updateUserByUsername(user);
			System.out.println(id);
			result = "success";
		}catch(Exception e) {
			//查询不到数据时 插入数据
			result = "error";
			
		}
		return result;
	}
}

