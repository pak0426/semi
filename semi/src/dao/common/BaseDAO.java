package dao.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.mybatis.SqlSessionManager;

public class BaseDAO {
	private final Logger logger = LoggerFactory.getLogger(BaseDAO.class);
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession sqlSession;
	
	/* method 	: selectList
	 * param	: String, HashMap 
	 * result	: List
	 * desc		:  
	 * */
	public Object selectList(String target_name, HashMap<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();		
		
		logger.debug("Target NameSpace - " + target_name);
		
		Object obj = null;
		
		try {
			obj = sqlSession.selectList(target_name, param);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return obj;
	}
	
	/* method 	: selectOne
	 * param	: String, HashMap 
	 * result	: HashMap
	 * desc		: get totalCount
	 * */
	public Object selectOne(String target_name, Object param) {
		sqlSession = sqlSessionFactory.openSession();
		
		logger.debug("Target NameSpace - " + target_name);
		
		Object obj = null;
		
		try {
			obj = sqlSession.selectOne(target_name, param);
			  
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return obj;
	}
	
	/* method 	: insert
	 * param	: String, HashMap
	 * result	: int
	 * desc		: 파일 업로드 DB 적재 
	 * */
	public Object insert(String target_name, HashMap<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();
		
		Object obj = null;
		
		logger.debug("Target NameSpace - " + target_name);
		
		try {
			obj = sqlSession.insert(target_name, param);
			
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();			
		}finally {
			sqlSession.close();
		}
		
		return obj;
	}
	
	/* method 	: update
	 * param	: HashMap 
	 * result	: int
	 * desc		: max idx
	 * */
	public Object update(String target_name, Object param_obj) {
		sqlSession = sqlSessionFactory.openSession();
		
		Object obj = null;
		
		try {
			obj = sqlSession.update(target_name, param_obj);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return obj;
	}
	
	/* method 	: delete
	 * param	: HashMap 
	 * result	: int
	 * desc		: 
	 * */
	public Object delete(String target_name, Object param_obj) {
		sqlSession = sqlSessionFactory.openSession();
		
		logger.debug("Target NameSpace - " + target_name);
		
		//map
		Object obj = null;
		
		try {
			obj = sqlSession.delete(target_name, param_obj);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return obj;
	}
}
