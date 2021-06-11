package com.knock.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.NomUserVO;
import com.knock.model.vo.CampaignIngVO;
import com.knock.model.vo.UserVO;
import com.knock.mybatis.DBService;


public class UserDAO {

	// 마이페이지 내 정보
	public static UserVO myPageList(String user_id) {
		SqlSession ss = DBService.getFactory().openSession();
		UserVO vo = ss.selectOne("USER.myPageList", user_id);
		ss.close();
		return vo;
	}
	
	// 마이페이지 내 정보 수정
	public static int updateMypage(HashMap<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("USER.updateMypage", map);
		System.out.println("map : " + map);
		System.out.println("result : " + result);
		ss.close();
		return result;	
		
	}

	// 탈퇴하기
	public static int deleteUser(String user_id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("USER.deleteUser", user_id);
		ss.close();
		return result;
		
	}
	
	// 펀딩 시 spent_point에 250 더해주기
	// usersmapper에 쿼리문 작성되면 활성화
//	public static int funding(NomUserVO nomUser) {
//		SqlSession ss = DBService.getFactory().openSession(true);
//		int result = ss.delete("USER.funding", nomUser);
//		ss.close();
//		return result;
//	}

	// 현재 활동중인 캠페인 목록 가져오기
	public static List<CampaignIngVO> camIngList(String user_idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<CampaignIngVO> clist = ss.selectList("USER.camIngLists", user_idx);
		
		ss.close();
		return clist;

	}

	//캠페인 카테고리 번호 넘기고 목록
	public static CampaignIngVO cingList(String campaign_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		CampaignIngVO vo = ss.selectOne("USER.ccvo", campaign_idx);

		System.out.println("dao c_category: " + campaign_idx);
		System.out.println("vo : " + vo);
		ss.close();
		return vo;

		
	}
	
	// 종료된 캠페인 리스트
	public static List<CampaignIngVO> endList(String user_idx){
		SqlSession ss = DBService.getFactory().openSession();
		List<CampaignIngVO> clist = ss.selectList("USER.endlist",user_idx);
		ss.close();
		return clist;
		
	}
	
	
	
	 //내 캠페인ing 전체 게시물 수량
	public static int getTotalCount(String user_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("USER.totalCount", user_idx);
		System.out.println("totalCount : " + totalCount);
		ss.close();
		return totalCount;
		
	}
	
	// 페이지에 해당하는 글목록(게시글)가져오기
	public static List<CampaignIngVO> getEndList(int begin, int end, String user_idx){
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("user_idx", user_idx);
		List<CampaignIngVO> list = ss.selectList("USER.pageEndList",map);
		System.out.println(">>list : " + list);
		ss.close();
		return list;
		
	}

}
