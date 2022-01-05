package com.knock.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.IngUserVO;
import com.knock.mybatis.DBService;

public class IngUserDAO {
	
	// 캠페인 참여한 적 있으면 true
	// 참여한 적 없으면 false 
	public static boolean check(IngUserVO ingUser) {
		boolean result = false;
		SqlSession ss = DBService.getFactory().openSession();
		Integer selected_idx = ss.selectOne("campaign.ingUserCheck", ingUser);
		ss.close();
		if( selected_idx!=null ) {
			result = true;
		}
		return result;
	}
	}
