package com.wl.school.common.utils;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

public class SessionUtils {
	public final static String CURRENT_USER = "currentUser";
	/**
	 * 获取当前受shiro控制的Session
	 * @return
	 */
	public static Session getCurrentSession(){
		Subject subject = SecurityUtils.getSubject();
		return subject.getSession();
	}
	
	/**
	 * 从受shiro控制的session中获取对象
	 * @param key
	 * @return
	 */
	public static Object getObjectFromSession(String key){
		Session session = getCurrentSession();
		return session.getAttribute(key);
	}
	
	/**
	 *  往session中存入对象
	 * @param key 键
	 * @param value 值
	 */
	public static void addObjectToSession(Object key,Object value){
		Session session = getCurrentSession();
		session.setAttribute(key, value);
	}
	
	/**
	 * 清除session中的值
	 */
	public static void clearSession(){
		Session session = getCurrentSession();
		session.removeAttribute(SessionUtils.CURRENT_USER);
	}
}
