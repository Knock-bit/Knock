package com.knock.model.dao;

import java.util.HashMap;   

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.UserVO;
import com.knock.mybatis.DBService;


public class UserDAO {

	// 마이페이지 내 정보
	public static UserVO myPageList(String user_id) {
		SqlSession ss = DBService.getFactory().openSession();
		UserVO vo = ss.selectOne("USER.myPageList", user_id);
		ss.close();
		return vo;
	}
	
	// 마이페이지 내 정보 수정
	public static int updateMypage(HashMap<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("USER.updateMypage", map);
		System.out.println("map : " + map);
		System.out.println("result : " + result);
		ss.close();
		return result;	
		
	}

	// 탈퇴하기
	public static int deleteUser(String user_id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("USER.deleteUser", user_id);
		ss.close();
		return result;
		
	}


}
