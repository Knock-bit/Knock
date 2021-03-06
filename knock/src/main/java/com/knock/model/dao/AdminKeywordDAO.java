package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.KeywordVO;
import com.knock.model.vo.UserVO;
import com.knock.mybatis.DBService;

public class AdminKeywordDAO {
	public static List<KeywordVO> keywordList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<KeywordVO> list = ss.selectList("ADMIN.keywordList"); 
		System.out.println("dao : " + list);
		ss.close();
		return list;
	}
	
	
	public static int keywordAdd(String keyword) {
		SqlSession ss = DBService.getFactory().openSession(true);	
		int result = ss.insert("ADMIN.keywordAdd",keyword);
		ss.close();
		return result;
	}
	
	public static KeywordVO getKeywordOne(String k_content) {
		SqlSession ss = DBService.getFactory().openSession();
		KeywordVO keywordVO = ss.selectOne("ADMIN.keywordOne",k_content);
		ss.close();
		return keywordVO;
	}
	
	public static void keywordDel(KeywordVO kvo) {
		String k_content = kvo.getK_content();
		System.out.println("del : " + k_content);
		SqlSession ss = DBService.getFactory().openSession();
		ss.delete("ADMIN.keywordDel",kvo);
		System.out.println("잉");
		ss.commit();
		ss.close();
	}
	
	public static int keywordDelFull(String k_content) {
		SqlSession ss = DBService.getFactory().openSession();
		KeywordVO keywordVO = ss.selectOne("ADMIN.keywordOne", k_content);
		System.out.println("keywordVO.getK_content : " + keywordVO.getK_content());
		System.out.println("del_full" + k_content);
		int result = ss.delete("ADMIN.keywordDel", k_content);
		System.out.println("dao result  : " + result);
		return result;
	}
}
