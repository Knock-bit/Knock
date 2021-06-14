package com.knock.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.CampaignCategoryVO;
import com.knock.model.vo.KeywordVO;
import com.knock.mybatis.DBService;

public class AdminCampaignDAO {
	public static List<CampaignCategoryVO> list() {
		SqlSession ss = DBService.getFactory().openSession();
		List<CampaignCategoryVO> list = ss.selectList("ADMIN.campaignCategory");
		ss.close();
		return list;
	}

	public static int setCampaign(Map<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("ADMIN.campaignAdd", map);
		ss.close();
		return result;
	}
}
