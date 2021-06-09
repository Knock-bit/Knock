package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.CampaignIngVO;
import com.knock.model.vo.NomUserVO;
import com.knock.mybatis.DBService;

public class NomUserDAO {

	public static List<String> list(int nominee_idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<String> nomUserList = ss.selectList("campaign.nomUserList", nominee_idx);
		ss.close();
		for (String vo : nomUserList) {
			System.out.println(vo);
		}
		
		return nomUserList;
	}
//	
//	public static  NomUserVO list() {
//		SqlSession ss = DBService.getFactory().openSession(true);
//		List<NomUserVO> nomUserList = ss.selectList("campaign.nomUserList");
//		ss.close();
//		for (CampaignIngVO vo : nomUserList) {
//			System.out.println(vo.);
//		}
//		
//		return campaignIngList;
//	}

	public static int insert(NomUserVO nomUser) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("campaign.nomUserInsert", nomUser);
		ss.close();
		return result;
	}


	
	public static boolean check(NomUserVO nomUser) {
		SqlSession ss = DBService.getFactory().openSession(true);
		boolean result = false;
		Integer user_idx = ss.selectOne("campaign.nomUserCheck", nomUser);
		if(user_idx != null) {
			result = true;
		}
		ss.close();

		// 아이디 없으면 false 반환
		// 아이디 있으면 true  반환 
		return result;
	}

}
