package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.KeywordVO;
import com.knock.mybatis.DBService;

public class KeywordDAO {

	public static List<KeywordVO> list() {
		SqlSession ss = DBService.getFactory().openSession();
		List<KeywordVO> keywordList = ss.selectList("campaign.keywordList");
		ss.close();
		return keywordList;
	}

}
