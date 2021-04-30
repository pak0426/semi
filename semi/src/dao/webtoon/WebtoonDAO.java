package dao.webtoon;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.common.BaseDAO;
import dao.mybatis.SqlSessionManager;

import org.apache.log4j.Logger;


public class WebtoonDAO {
	private static final Logger logger = Logger.getLogger(WebtoonDAO.class);
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession sqlSession;
	
	private BaseDAO baseDAO = new BaseDAO();
	
	/* method 	: getWebtoonList
	 * param	: MemberDTO 
	 * result	: List
	 * desc		: 웹툰 리스트 출력 
	 * */
	public List<HashMap<String, Object>> getWebtoonList(HashMap<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();		
		
		String target_name = "Webtoon.getWebtoonList";
		
		List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		list = (List<HashMap<String, Object>>) baseDAO.selectList(target_name, param);
		
		return list;
	}
	
	/* method 	: getTotalCount
	 * param	: WebtoonDTO 
	 * result	: int
	 * desc		: get totalCount
	 * */
	public int getTotalCount(HashMap<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.getTotalCount";
		
		int result = 0;
		
		result = (int) baseDAO.selectOne(target_name, param);
		
		return result;
	}
	
	/* method 	: getNextVal
	 * param	:  
	 * result	: int
	 * desc		: getNextVal
	 * */
	public int getNextVal() {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.getNextVal";
		
		int result = 0;
		
		result = (int) baseDAO.selectOne(target_name, null);
		
		return result;
	}
	
	/* method 	: setWebtoon
	 * param	: MemberDTO 
	 * result	: int
	 * desc		: 회원 등록 
	 * */
//	public int setWebtoon(WebtoonDTO webtoonDTO) {
	public int setWebtoon(HashMap<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.setWebtoon";
		
		
		int result = 0;
		
		result = (int) baseDAO.insert(target_name, param);
		
		return result;
	}
	
	
	/* method 	: getWebtoon
	 * param	: MemberDTO 
	 * result	: WebtoonDTO
	 * desc		: 웹툰 조회
	 * */
	public HashMap<String, Object> getWebtoon(String webtoon_idx) {
		sqlSession = sqlSessionFactory.openSession();
		
		//DTO
		WebtoonDTO webtoonDTO = new WebtoonDTO();
		
		//Map
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		String target_name = "Webtoon.getWebtoon";
		
		rtnMap = (HashMap<String, Object>) baseDAO.selectOne(target_name, webtoon_idx);
		
		
		return rtnMap;
	}
	
	/* method 	: modWebtoon
	 * param	: HashMap 
	 * result	: int
	 * desc		: max idx
	 * */
	public int modWebtoon(HashMap<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "Webtoon.modWebtoon";
		
		int result = 0;
		
		result = (int) baseDAO.update(target_name, param);
		
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
		
		result = (int) baseDAO.delete(target_name, param);
		
		return result;
	}
	
	/* method 	: delThum
	 * param	:  
	 * result	: int
	 * desc		: delThum
	 * */
	public int delThum(String webtoon_idx) {
		sqlSession = sqlSessionFactory.openSession();
		
		System.out.println("webtoon_idx : " + webtoon_idx);
		
		String target_name = "Webtoon.delThum";
		
		int result = 0;
		
		result = (int) baseDAO.update(target_name, webtoon_idx);
		
		return result;
	}
}
