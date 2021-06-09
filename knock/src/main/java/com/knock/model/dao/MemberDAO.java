package com.knock.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.knock.mybatis.DBService;
import com.knock.model.vo.MemberVO;

public class MemberDAO {
	
	SqlSession ss = DBService.getFactory().openSession();

	public int insertJoin(MemberVO vo) {
		int result;
		result = ss.insert("vo.insertjoin", vo);
		
		return result;
	}


}
