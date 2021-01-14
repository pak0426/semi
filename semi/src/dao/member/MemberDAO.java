
package dao.member;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.mybatis.SqlSessionManager;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
//	private SqlSession sqlSession = sqlse;
	
	public List<MemberDTO> getMemberList(){
		List<MemberDTO> list = new ArrayList<>();
		
		return null;
	}
	
	public int setMember(MemberDTO memberDTO) {
		int result = 0;
		
		try {
			result = sqlSession.insert("Member.setMember", memberDTO);
			
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
		int result = 0;
		
		try {
			result = sqlSession.insert("Member.chkMember", memberDTO);
			
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
