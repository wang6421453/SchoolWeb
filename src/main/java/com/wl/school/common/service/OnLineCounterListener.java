package com.wl.school.common.service;


import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.apache.log4j.Logger;



public class OnLineCounterListener implements HttpSessionListener, ServletRequestListener{

	private static Logger logger = Logger.getLogger(OnLineCounterListener.class);
	//为了获取用户ip增加ServletRequestListener接口
	private HttpServletRequest request;
	
	public void sessionCreated(HttpSessionEvent sessionEvent) {
		logger.info("IP为：" + request.getRemoteAddr() +"的用户连接");
		OnLineCounter.addOnLineNum();
		OnLineCounter.addToSessionLst(sessionEvent.getSession().getId(), request.getRemoteAddr());
		TotalVisterCounter.addTotalVisterNum();
	}

	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
		String sessionId = sessionEvent.getSession().getId();
		logger.info("IP为：" + OnLineCounter.getIpBySessionId(sessionId) +"的用户离开");
		OnLineCounter.reduce();
		OnLineCounter.reducefromSessionLst(sessionId);
	}

	public void requestInitialized(ServletRequestEvent sre) {
		request = (HttpServletRequest) sre.getServletRequest();
	}
	
	public void requestDestroyed(ServletRequestEvent arg0) {
	}

}
