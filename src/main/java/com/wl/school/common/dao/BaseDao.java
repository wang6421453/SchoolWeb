package com.wl.school.common.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;

/**
 * 基础dao
 * @author wl
 *
 * @param <T>
 */
@SuppressWarnings("restriction")
public class BaseDao<T> {

	@Resource
    private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}


	/**
	 * 根据id获取记录
	 * @param statement
	 * @param id
	 * @return
	 */
	public T selectById(String statement, String id){
		return sqlSession.selectOne(statement, id);
	}
	
	/**
	 * 获取一条记录
	 * @param statement
	 * @param id
	 * @return
	 */
	public T selectOne(String statement){
		return sqlSession.selectOne(statement);
	}
	
	/**
	 * 获取数量
	 * @param statement
	 * @param t
	 * @return
	 */
	public int selectCount(String statement, T t){
		return sqlSession.selectOne(statement, t);
	}
	
	/**
	 * 获取列表
	 * @param statement
	 * @param t
	 * @return
	 */
	public List<T> selectList(String statement, T t){
		return sqlSession.selectList(statement, t);
	}
	
	/**
	 * 插入
	 * @param statement
	 * @param t
	 * @return
	 */
	public Integer insert(String statement, T t){
		return sqlSession.insert(statement, t);
	}
	
	/**
	 * 删除
	 * @param statement
	 * @param ids
	 * @return
	 */
	public Integer delete(String statement, List<String> ids){
		return sqlSession.delete(statement, ids);
	}
	
	/**
	 * 更新
	 * @param statement
	 * @param t
	 * @return
	 */
	public Integer update(String statement, T t){
		return sqlSession.update(statement, t);
	}
	
	/**
	 * 发布项目
	 * @param statement
	 * @param ids
	 * @return
	 */
	public Integer commitProject(String statement, List<String> ids){
		return sqlSession.update(statement, ids);
	}
	
	/**
	 * 增加点击率
	 * @param statement
	 * @param id
	 * @return
	 */
	public Integer addClickRate(String statement, String id){
		return sqlSession.update(statement, id);
	}
}
