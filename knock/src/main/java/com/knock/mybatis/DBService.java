package com.knock.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//MyBatis사용해서 작업할 SqlSession을 만들어줄 SqlSessionFactory객체 생성을 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;

	// static초기화문
	static {
		try {
			String config = "com/bc/mybatis/config.xml"; 
			Reader reader = Resources.getResourceAsReader(config);
			
			SqlSessionFactoryBuilder factoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory sqlSessionFactory = factoryBuilder.build(reader);
			factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("com/connect/mybatis/config.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
