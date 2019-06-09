package com.note.interceptor;

 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录认证的拦截器
 */
public class LoginInterceptor implements HandlerInterceptor{

 
	/**
	 * Handler执行完成之后调用这个方法
	 */
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exc)
			throws Exception {
			//System.out.println("afterCompletion run!");
	}


	/**
	 * Handler执行之后，ModelAndView返回之前调用这个方法
	 */

	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
			//System.out.println("postHandle run!");
	}

 

	/**
	 * Handler执行之前调用这个方法
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		//System.out.println("preHandle run!");
		return true;
	}
}

