package dao.webtoon;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.mybatis.SqlSessionManager;

public class WebtoonDAO {
	private SqlSession sqlSession;
	
	/* method 	: setWebtoon
	 * param	: MemberDTO 
	 * result	: int
	 * desc		: 회원 등록 
	 * */
	public int setWebtoon(WebtoonDTO webtoonDTO) {		
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.setWebtoon";
		
		int result = 0;
		
		try {
			result = sqlSession.insert(target_name, webtoonDTO);
			
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
