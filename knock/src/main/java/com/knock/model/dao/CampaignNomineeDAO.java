package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.NomUserVO;
import com.knock.model.vo.NomineeVO;
import com.knock.mybatis.DBService;

public class CampaignNomineeDAO {

	public static List<NomineeVO> list() {
		System.out.println("nomineeDAO - list실행!");
		SqlSession ss = DBService.getFactory().openSession();
		List<NomineeVO> nomineeList = ss.selectList("campaign.nomineeList");
		ss.close();
		for (NomineeVO nominee : nomineeList) {
			System.out.println(nominee.getTitle());
		}
		return nomineeList;
	}

	public static NomineeVO one() {
		System.out.println("nomineeDAO - one실행!");
		SqlSession ss = DBService.getFactory().openSession();
		NomineeVO nominee = ss.selectOne("campaign.nominee");
		ss.close();
		return nominee;
	}

	public static int funding(NomUserVO nomUser) {
		System.out.println("nomineeDAO - funding 실행!");
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("campaign.funding", nomUser);
		ss.commit();
		ss.close();
		
		return result;
	}

	public static int expire() {
		int result = 0;
		SqlSession ss = DBService.getFactory().openSession(true);
		result = ss.update("campaign.expireNom");
		ss.close();
		return result;
	}

}
