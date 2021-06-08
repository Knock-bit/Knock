package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.ProposalVO;
import com.knock.mybatis.DBService;

public class ProposalDAO {

	public static int insert(ProposalVO proposal) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = 0;
		result = ss.insert("campaign.insert", proposal);
		ss.close();
		return result;
	}

}
