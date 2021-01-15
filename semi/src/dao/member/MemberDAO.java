
package dao.member;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.apache.log4j.chainsaw.Main;

import dao.mybatis.SqlSessionManager;

public class MemberDAO {
//	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
//	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	private static final Logger logger = Logger.getLogger(MemberDAO.class);
	
	public List<MemberDTO> getMemberList(){
		List<MemberDTO> list = new ArrayList<>();
		
		return null;
	}
	
	public int setMember(MemberDTO memberDTO) {		
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Member.setMember";
		
		logger.debug("■ Target NameSpace : " + target_name);
		
		int result = 0;
		
		try {
			result = sqlSession.insert(target_name, memberDTO);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	public int chkMember(MemberDTO memberDTO) {
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Member.chkMember";
		
		logger.debug("■ Target NameSpace : " + target_name);
		
		int result = 0;
		
		try {
			result = sqlSession.selectOne(target_name, memberDTO);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		System.out.println("chkMember : " + result);
		System.out.println(memberDTO);
		
		return result;
	}
}
