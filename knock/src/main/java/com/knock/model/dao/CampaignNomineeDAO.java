package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.CampaignNomineeVO;
import com.knock.mybatis.DBService;

public class CampaignNomineeDAO {

	public static List<CampaignNomineeVO> list() {
		
		SqlSession ss = DBService.getFactory().openSession();
		List<CampaignNomineeVO> nomineeList = ss.selectList("campaign.nomineeList");
		ss.close();
		for (CampaignNomineeVO nominee : nomineeList) {
			System.out.println(nominee.getTitle());
		}
		
		return nomineeList;
	}

}
