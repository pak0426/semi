
package dao.member;

import java.util.*;

import org.apache.ibatis.session.SqlSession;

public class MemberDAO {
	private SqlSession sqlSession;
	
	private MemberDTO MemberDTO;
	
	public List<MemberDTO> getMemberList(){
		List<MemberDTO> list = new ArrayList<>();
		
		return null;
	}
	
//	public int setMember(MemberDTO){
//		int result = 0;
//		return result;
//	}
	
	public int setMember(MemberDTO memberDTO) {
		int result = 0;
		
		sqlSession.insert("Member.setMember");
		
		return result;
	}
}
