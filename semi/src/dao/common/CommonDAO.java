package dao.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.mybatis.SqlSessionManager;
import dao.webtoon.WebtoonDTO;

public class CommonDAO {
	private final Logger logger = LoggerFactory.getLogger(CommonDAO.class);
	
	private SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	private SqlSession sqlSession;
	
	private BaseDAO baseDAO = new BaseDAO();
	
	/* method 	: encryptSHA256
	 * param	: String 
	 * result	: String
	 * desc		: sha256 암호화 
	 * */
	public String encryptSHA256(String member_pw) {
		String sha = "";
		
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(member_pw.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for(int i=0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			sha = sb.toString();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
			System.out.println("Encrypt Error - NoSuchAlgorithmException");
			sha = null;
		}
		
		return sha;
	}
	
	/* method 	: file_upload
	 * param	: WebtoonDTO 
	 * result	: int
	 * desc		: 파일 업로드 DB 적재 
	 * */
	public int file_upload(HashMap<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();
		
		int result = 0;
		String target_name = "File.setFile";
		
		result = (int) baseDAO.insert(target_name, param);
		
		return result;
	}
	
	/* method 	: delFile
	 * param	:  
	 * result	: int
	 * desc		: delFile
	 * */
	public int delFile(HashMap<String, Object> param) {
		sqlSession = sqlSessionFactory.openSession();
		
		String target_name = "File.delFile";
		
		int result = 0;
		
		result = (int) baseDAO.delete(target_name, param);
		
		return result;
	}
}


