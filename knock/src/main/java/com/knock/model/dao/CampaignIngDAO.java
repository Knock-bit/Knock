package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.CampaignIngVO;
import com.knock.mybatis.DBService;

public class CampaignIngDAO {

	
//	public static int totalCount() {
//		SqlSession ss = DBService.getFactory().openSession();
//		int totalCount = ss.selectOne("KP.totalCount");
//		ss.close();
//		
//		return totalCount;
//	}
	
	
	public static List<CampaignIngVO> list(){
		SqlSession ss = DBService.getFactory().openSession();
		List<CampaignIngVO> campaignIngList = ss.selectList("campaignIng.list");
		ss.close();
		for (CampaignIngVO campaignIng : campaignIngList) {
			System.out.println(campaignIng.getTitle());
		}
		
		return campaignIngList;
	}

	public static CampaignIngVO one(int campaign_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		CampaignIngVO campaignIng = ss.selectOne("campaignIng.one", campaign_idx);
		ss.close();
		return campaignIng;
	}

	public static List<String> participant(int campaign_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<String> userList = ss.selectList("campaignIng.participant", campaign_idx);
		ss.close();
		return userList;
	}
	
	
	
	

}
