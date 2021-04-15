
package dao.reply;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.apache.log4j.chainsaw.Main;

import dao.mybatis.SqlSessionManager;

public class ReplyDAO {
	private static final Logger logger = Logger.getLogger(ReplyDAO.class);
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession sqlSession;
	
	
	/* method 	: replyNextVal
	 * param	:  
	 * result	: int
	 * desc		: nextVal 구하기 
	 * */
	public int replyNextVal() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String target_name = "Reply.replyNextVal";
		
		int result = 0;
		
		try {
			result = sqlSession.selectOne(target_name);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	/* method 	: setReply
	 * param	:  
	 * result	: int
	 * desc		: insert reply
	 * */
	public int setReply(HashMap<String, Object> param) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String target_name = "Reply.setReply";
		
		int result = 0;
		
		try {
			result = sqlSession.insert(target_name, param);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	/* method 	: getReplyList
	 * param	:  
	 * result	: List<HashMap<String, Object>>
	 * desc		: get replyList
	 * */
	public List<HashMap<String, Object>> getReplyList(HashMap<String, Object> param){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String target_name = "Reply.getReplyList";
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		
		try {
			list = sqlSession.selectList(target_name, param);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	
	/* method 	: modReply
	 * param	:  
	 * result	: int
	 * desc		: modReply
	 * */
	public int modReply(HashMap<String, Object> param) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String target_name = "Reply.modReply";
		
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
	
	/* method 	: delReply
	 * param	:  
	 * result	: int
	 * desc		: delReply
	 * */
	public int delReply(HashMap<String, Object> param) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String target_name = "Reply.delReply";
		
		int result = 0;
		
		System.out.println("=========DAO : " +param);
		
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
	
	/* method 	: agreeNextVal
	 * param	:  
	 * result	: int
	 * desc		: nextVal 구하기 
	 * */
	public int agreeNextVal() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String target_name = "Reply.agreeNextVal";
		
		int result = 0;
		
		try {
			result = sqlSession.selectOne(target_name);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	/* method 	: setAgree
	 * param	:  
	 * result	: int
	 * desc		: insert reply
	 * */
	public int setAgree(HashMap<String, Object> param) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		String target_name = "Reply.setAgree";
		
		int result = 0;
		
		try {
			result = sqlSession.insert(target_name, param);
			
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
