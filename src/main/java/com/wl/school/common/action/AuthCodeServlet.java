package com.wl.school.common.action;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.wl.school.common.utils.AuthCodeUtils;

public class AuthCodeServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response){
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		
		//生成随机字串
		String authCode = AuthCodeUtils.generateAuthCode(4);
		//存入session
		request.getSession().setAttribute("authCode", authCode.toLowerCase());
		//生成图片
		int w = 68, h = 29;
		try{
			AuthCodeUtils.outputImage(w, h, response.getOutputStream(), authCode);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
