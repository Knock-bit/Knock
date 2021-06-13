package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.CKeywordVO;
import com.knock.mybatis.DBService;

public class CKeywordDAO {

	public static CKeywordVO keywords(int campaign_idx) {
		SqlSession ss = DBService.getFactory().openSession();
//		Object keywordList = ss.selectOne("campaign.cKeywordList", campaign_idx);
		CKeywordVO keywords = ss.selectOne("campaign.cKeyword", campaign_idx);
		System.out.println(keywords.getKeyword1());
/*				select("campaign.cKeywordList", campaign_idx);*/
		System.out.println(">>>>>>>>>CDAO" + keywords);
		ss.close();
		return keywords;
	}
}
