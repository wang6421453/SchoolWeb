package com.wl.school.admin.login.action;

import java.io.IOException;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wl.school.admin.login.model.AdminUserVo;
import com.wl.school.admin.login.service.IAdminLoginService;
import com.wl.school.common.service.ProjectPath;
import com.wl.school.common.utils.SessionUtils;

/*
 * author 王磊
 * 管理员后台登陆Action
 * date 2016-12-30
 */

@SuppressWarnings("restriction")
@Controller
@RequestMapping("/wl/school/admin/login")
public class AdminLoginAction {

	private static Logger logger = Logger.getLogger(AdminLoginAction.class);
	
	@Resource
	private IAdminLoginService adminLoginService;
	/**
	 * 登陆
	 * @param adminUserVo
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/login.ac")
	public void login(AdminUserVo adminUserVo, String authCode, HttpServletRequest request, HttpServletResponse response){
		
		String userName = adminUserVo.getUserName();
		String password = adminUserVo.getPassword();
		String ip = request.getRemoteAddr();
		adminUserVo.setIp(ip);
		String webRoot = ProjectPath.getWebRoot();
		logger.info("用户：" + userName + "(" + ip +")正在登陆...");
		String error = null; 
		//先校验验证码
		String sessionAuthCode = (String) request.getSession().getAttribute("authCode");
		if(sessionAuthCode == null || !sessionAuthCode.equalsIgnoreCase(authCode)){
			error = "验证码错误";
		}else{
			UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
			token.setRememberMe(false);
			Subject subject = SecurityUtils.getSubject();
			try{
				subject.login(token);
				logger.info("用户：" + userName + "(" + ip +")登陆成功。");
			}catch(UnknownAccountException e) {  
	            error = "用户名/密码错误";  
	        } catch (IncorrectCredentialsException e) {  
	            error = "用户名/密码错误";  
	        } catch (AuthenticationException e) {  
	            //其他错误，比如锁定，如果想单独处理请单独catch处理  
	            error = "其他错误：" + e.getMessage();  
	        }  
		}
		if(error != null) {//出错了，返回登录页面  
			try{
				error = URLEncoder.encode(error, "UTF-8");
				response.sendRedirect(webRoot + "/admin/login.jsp?error=" + error);
			} catch (IOException e) {
				e.printStackTrace();
			} 
        }else{//登录成功  
        	logger.info("用户：" + userName + "(" + ip +")登陆成功。");
        	AdminUserVo currentUser = adminLoginService.getAdminUserByUserName(userName);
        	SessionUtils.addObjectToSession(SessionUtils.CURRENT_USER, currentUser);
        	try {
				response.sendRedirect(webRoot + "/admin/index.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
		
	}
	
	/**
	 * 退出登陆
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/logout.ac")
	@ResponseBody
	public void logout(HttpServletResponse response) {
		String webRoot = ProjectPath.getWebRoot();
		Subject subject = SecurityUtils.getSubject();
		logger.info("用户：" + subject.getPrincipal() +"主动退出系统...");
		subject.logout();
		SessionUtils.clearSession();
		try{
			response.sendRedirect(webRoot + "/admin/login.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
