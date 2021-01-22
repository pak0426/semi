package dao.webtoon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.mybatis.SqlSessionManager;

public class WebtoonDAO {
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession sqlSession;
	
	/* method 	: getWebtoonList
	 * param	: MemberDTO 
	 * result	: List
	 * desc		: 웹툰 리스트 출력 
	 * */
	public List<WebtoonDTO> getWebtoonList() {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.getWebtoonList";
		
		List<WebtoonDTO> list = new ArrayList<WebtoonDTO>();
		
		try {
			list = sqlSession.selectList(target_name);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	
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
		
		//DTO
		WebtoonDTO webtoonDTO = new WebtoonDTO();
		
		//Map
		HashMap<String, String> param = new HashMap<String, String>();
		
		param.put("webtoon_idx", webtoon_idx);
		
		String target_name = "Webtoon.getWebtoon";
		
		try {
			webtoonDTO = new WebtoonDTO();
			webtoonDTO = sqlSession.selectOne(target_name, webtoon_idx);
			
			sqlSession.commit();			
		}catch(Exception e) {
			sqlSession.rollback();
			
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return webtoonDTO;
	}
	
	/* method 	: modWebtoon
	 * param	: HashMap 
	 * result	: int
	 * desc		: max idx
	 * */
	public int modWebtoon(WebtoonDTO webtoonDTO) {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.modWebtoon";
		
		HashMap<String, String> param = new HashMap<String, String>();
		
		param.put("webtoon_title", webtoonDTO.getWebtoon_title());
		param.put("webtoon_content", webtoonDTO.getWebtoon_content());
		param.put("webtoon_summary", webtoonDTO.getWebtoon_summary());
		param.put("webtoon_author", webtoonDTO.getWebtoon_author());
		param.put("thum", webtoonDTO.getThum());
		param.put("up_admin", webtoonDTO.getUp_admin());
		param.put("use_yn", webtoonDTO.getUse_yn());
		param.put("webtoon_idx", webtoonDTO.getWebtoon_idx());
		
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
	
	/* method 	: delWebtoon
	 * param	: HashMap 
	 * result	: int
	 * desc		: max idx
	 * */
	public int delWebtoon(String webtoon_idx) {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.delWebtoon";
		
		//map
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("webtoon_idx", webtoon_idx);
		
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
