package com.wl.school.common.utils;

/**
 * Mybatis工具类(被spring整合了，不需要手动编写加载了)
 * @author wl
 * @date:2017.1.1
 */
public class MybatisUtil {
	
	/*private static SqlSessionFactory sessionFactory = null;
	
	static{
		//获取mybatis配置路径
		String mybatisConfPath = ProjectPath.getMybatisConfPath();
		//使用类加载器加载mybatis的配置文件（它也加载关联的映射文件）
		InputStream is = MybatisUtil.class.getClassLoader().getResourceAsStream(mybatisConfPath);
		//构建sqlSession的工厂
		sessionFactory = new SqlSessionFactoryBuilder().build(is);
	}

	public static SqlSessionFactory getSessionFactory() {
		return sessionFactory;
	}*/
	
}
