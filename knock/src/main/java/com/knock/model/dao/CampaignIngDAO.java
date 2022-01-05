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
	public CampaignIngDAO() {
	}
	
	public static List<CampaignIngVO> list(){
		SqlSession ss = DBService.getFactory().openSession(true);
		List<CampaignIngVO> campaignIngList = ss.selectList("campaign.ingList");
		ss.close();
		for (CampaignIngVO campaignIng : campaignIngList) {
			System.out.println(campaignIng.getTitle());
		}
		
		return campaignIngList;
	}

	public static CampaignIngVO one(int campaign_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		CampaignIngVO campaignIng = ss.selectOne("campaign.ingOne", campaign_idx);
		ss.close();
		return campaignIng;
	}

	public static List<String> participant(int campaign_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<String> userList = ss.selectList("campaign.participant", campaign_idx);
		ss.close();
		return userList;
	}
	
	public static int expire() {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		result = ss.update("campaign.expireIng");
		ss.close();
		return result;
	}

	public static List<CampaignIngVO> endList() {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<CampaignIngVO> campaignedList = ss.selectList("campaign.edList");
		ss.close();
		for (CampaignIngVO campaigned : campaignedList) {
			System.out.println(campaigned.getTitle());
		}
		
		return campaignedList;
	}
	
	
	
	

}
