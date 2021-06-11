package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.mybatis.DBService;
import com.knock.model.vo.MemberVO;

public class MemberDAO {
	
	public int insertJoin(MemberVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		int result;
		result = ss.insert("vo.insertjoin", vo);
    	ss.close();

		return result;
	}
	//아이디 중복 체크
    public static int duplicateIdCheck(String user_id) {
    	SqlSession ss = DBService.getFactory().openSession();
    	int result;
    	String id = ss.selectOne("vo.idCheck", user_id);
		if(id == null) {
			result = 1;//중복된 아이디 없음
		}else {
			result = -1;//아이디 중복임			
		}
		ss.close();
    	return result;
    }
    //이메일 중복 체크
    public static int duplicateEmailCheck(String email) {
		SqlSession ss = DBService.getFactory().openSession();
		int result;
		String chkemail =ss.selectOne("vo.emailCheck", email);
    	
    	if(chkemail == null) {
    		result = 1;//중복된 이메일이 없음
    	}else {
    		result = -1;//이미 가입된 아이디가 있음
    	}
    	ss.close();
    	return result;
    }
    
    //회원가입하기
    public static int joinknock(MemberVO vo) {
    	SqlSession ss = DBService.getFactory().openSession(true);
		int result = 0;
    	result = ss.insert("vo.joinMember", vo);
    	ss.close();
    	return result;    	
    }
	
 
}
