package dao.mybatis;


import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	
	public static SqlSessionFactory sqlSessionFactory;
	
	public static SqlSessionFactory getInstance() {
		
		try {
			String resource = "/dao/mybatis/mybatisConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
			System.out.println("SqlSession Connect Success");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("SqlSession Connect Fail");
		}
		
		
		return sqlSessionFactory;
	}
	
	
}
