package com.knock.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.knock.mybatis.DBService;
import com.knock.model.vo.MemberVO;

public class MemberDAO {
	
	public int insertJoin(MemberVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		int result;
		result = ss.insert("vo.insertjoin", vo);
		
		return result;
	}
	//아이디 중복 체크
    public static int duplicateIdCheck(String user_id) {
    	SqlSession ss = DBService.getFactory().openSession();
    	int result;
    	String id = ss.selectOne("vo.idCheck", user_id);
    	System.out.println("DAO에서 아이디 호출: " + id);
		if(id == null) {
			result = 1;//중복된 아이디 없음
			System.out.println("DAO에서 찾은 중복아이디 없음을 나타내는: "+result);
		}else {
			result = -1;//아이디 중복임
			System.out.println("DAO에서 찾은 중복아이디: "+result);

		}
		System.out.println(result);
    	System.out.println(id);
    	
    	return result;
    }
    //이메일 중복 체크
    public static int duplicateEmailCheck(String email) {
		SqlSession ss = DBService.getFactory().openSession();
		int result;
		String chkemail =ss.selectOne("vo.emailCheck", email);
    	System.out.println("DAO에서 받은 이메일: "+chkemail);
    	
    	if(chkemail == null) {
    		result = 1;//중복된 이메일이 없음
    	}else {
    		result = -1;//이미 가입된 아이디가 있음
    		
    	}
    	return result;
    	
    }
	
 
}
