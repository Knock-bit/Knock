package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.UserVO;
import com.knock.mybatis.DBService;

public class AdminUserActiveDAO {
	public static List<UserVO> getList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<UserVO> list = ss.selectList("ADMIN.list");
		ss.close();
		return list;
	}
	
	public static void updateActiveFalse(UserVO user) {
		SqlSession ss = DBService.getFactory().openSession();
		System.out.println("updateActiveFalse : " + user);
		ss.update("ADMIN.userUnActiveFalse",user);
		ss.commit();	// 오토커밋 필수
		ss.close();
	}
	
	public static void updateActiveTrue(UserVO user) {
		SqlSession ss = DBService.getFactory().openSession();
		System.out.println("updateActiveTrue : " + user);
		ss.update("ADMIN.userActiveTrue",user);
		ss.commit();	// 오토커밋 필수
		ss.close();
	}
	
	public static UserVO selectUserOne(String idx) {
		SqlSession ss= DBService.getFactory().openSession();
		UserVO user = ss.selectOne("ADMIN.userOne",idx);
		ss.close();
		return user;
		
	}
}
