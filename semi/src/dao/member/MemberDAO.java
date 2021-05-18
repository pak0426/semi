
package dao.member;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import dao.common.BaseDAO;
import dao.mybatis.SqlSessionManager;

public class MemberDAO {
	private static final Logger logger = Logger.getLogger(MemberDAO.class);
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession sqlSession;
	
	private BaseDAO baseDAO = new BaseDAO();
	
	/* method 	: setMember
	 * param	: MemberDTO 
	 * result	: int
	 * desc		: 회원 등록 
	 * */
	public int setMember(HashMap<String, Object> param) {		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Member.setMember";
		
		logger.debug("■ Target NameSpace : " + target_name);
		
		int result = 0;
		
		result = (int) baseDAO.insert(target_name, param);
		
		return result;
	}
	
	/* method 	: chkMember
	 * param	: MemberDTO 
	 * result	: int
	 * desc		: DB에 아이디가 존재하는지 확인
	 * */
	public int chkMember(HashMap<String, Object> param) {
		String target_name = "Member.chkMember";
		
		logger.debug("■ Target NameSpace : " + target_name);
		
		int result = 0;
		
		result = (int) baseDAO.selectOne(target_name, param);
		
		return result;
	}
	
	/* method 	: chkPW
	 * param	: MemberDTO 
	 * result	: int
	 * desc		: PW 중복 체크
	 * */
	public int chkPW(HashMap<String, Object> param) {
		
		String target_name = "Member.chkPW";
		
		logger.debug("■ Target NameSpace : " + target_name);
		
		int result = 0;
		
		result = (int) baseDAO.selectOne(target_name, param);
		
		return result;
	}
	
	/* method 	: getMemberType
	 * param	: member_id
	 * result	: int
	 * desc		: PW 중복 체크
	 * */
	
	public String getMemberType(String member_id) {
		
		String target_name = "Member.getMemberType";
		
		logger.debug("■ Target NameSpace : " + target_name);
		
		String type = "";
		
		type = (String) baseDAO.selectOne(target_name, member_id);
		
		return type;
			
	}
}
