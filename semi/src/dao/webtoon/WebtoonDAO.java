package dao.webtoon;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.mybatis.SqlSessionManager;

public class WebtoonDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession sqlSession;
	
	/* method 	: setWebtoon
	 * param	: MemberDTO 
	 * result	: int
	 * desc		: 회원 등록 
	 * */
	public int setWebtoon(WebtoonDTO webtoonDTO) {		
		sqlSession = sqlSessionFactory.openSession();
		
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
	
	/* method 	: getMaxIdx
	 * param	: MemberDTO 
	 * result	: int
	 * desc		: max idx
	 * */
	public int getMaxIdx() {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.getMaxIdx";
		
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
	
	/* method 	: getWebtoon
	 * param	: MemberDTO 
	 * result	: WebtoonDTO
	 * desc		: 웹툰 조회
	 * */
	public WebtoonDTO getWebtoon(String webtoon_idx) {
		sqlSession = sqlSessionFactory.openSession();
		
		//Map
		HashMap param = new HashMap();
		
		param.put("webtoon_idx", webtoon_idx);
		
		
		
		System.out.println("param webtoon_idx : " + param.get("webtoon_idx"));
		
		//DTO
		WebtoonDTO webtoonDTO = new WebtoonDTO();
		
		String target_name = "Webtoon.getWebtoon";
		
		try {
			webtoonDTO = new WebtoonDTO();
			webtoonDTO = sqlSession.selectOne(target_name, param);
			
			System.out.println("webtoonDTO : " + webtoonDTO);
			System.out.println("webtoon_title : " + webtoonDTO.getWebtoon_title());
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return webtoonDTO;
	}
}
