package com.knock.model.command.mypage;

import java.io.IOException; 
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;
import com.knock.model.vo.CampaignIngVO;


public class CampaignIngCommand implements Command{  
	
// 페이징 처리 구현
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 캠페인테이블과 연결된 user_idx 및 캠페인 완료날짜 가져오기
		String user_idx = request.getParameter("user_idx");
		List<CampaignIngVO> clist = UserDAO.camIngList(user_idx); 

		// json데이터 만들기
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		for(CampaignIngVO vo : clist){
			sb.append("{");
			sb.append("\"campaign_idx\":" + vo.getCampaign_idx() + ",");
			sb.append("\"title\": \"" + vo.getTitle() + "\",");
			sb.append("\"c_content\": \"" + vo.getC_content() + "\",");
			sb.append("\"goal\": \"" + vo.getGoal() + "\",");
			sb.append("\"end_date\": \""  + vo.getEnd_date() + "\",");
			sb.append("\"base_point\": \"" + vo.getBase_point() + "\",");
			sb.append("\"estimated_point\": \"" + vo.getEstimated_point() + "\",");
			sb.append("\"status\": \"" + vo.getStatus() + "\",");
			sb.append("\"c_file\": \"" + vo.getC_file() + "\",");
			sb.append("\"emblem\": \"" + vo.getEmblem() + "\",");
			sb.append("\"user_idx\": \"" + vo.getUser_idx() + "\",");
			sb.append("\"c_category\": \"" + vo.getC_category() + "\",");
			sb.append("\"c_totpoint\":" + vo.getC_totpoint());
			sb.append("},");

		}
		sb.deleteCharAt(sb.length()-1);
		sb.append("]");
		System.out.println(sb.toString());
		return sb.toString();

	}

}
