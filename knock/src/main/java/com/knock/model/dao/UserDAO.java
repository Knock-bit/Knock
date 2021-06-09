package com.knock.model.dao;

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
	


}
