package dao.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> selectList(String target_name, Map<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();		
		
		logger.debug("Target NameSpace - " + target_name);
		
		List<Map<String, Object>> rtnList = null;
		
		try {
			rtnList = sqlSession.selectList(target_name, param);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return rtnList;
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
	public Object insert(String target_name, Map<String, Object> param) {
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
	public int update(String target_name, Object param) {
		sqlSession = sqlSessionFactory.openSession();
		
		int result = 0;
		
		try {
			result = sqlSession.update(target_name, param);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	/* method 	: delete
	 * param	: HashMap 
	 * result	: int
	 * desc		: 
	 * */
	public int delete(String target_name, Object param) {
		sqlSession = sqlSessionFactory.openSession();
		
		logger.debug("Target NameSpace - " + target_name);
		
		int result = 0;
		
		try {
			result = sqlSession.delete(target_name, param);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
}
