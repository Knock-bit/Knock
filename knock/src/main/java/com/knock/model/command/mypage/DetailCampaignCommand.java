package com.knock.model.command.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;
import com.knock.model.vo.CampaignIngVO;

public class DetailCampaignCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String campaign_idx = request.getParameter("campaign_idx");
		CampaignIngVO ccvo = UserDAO.cingList(campaign_idx);
		System.out.println("pop창 idx: " + campaign_idx);
		
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		sb.append("\"campaign_idx\":" + ccvo.getCampaign_idx() + ",");
		sb.append("\"title\": \"" + ccvo.getTitle() + "\",");
		sb.append("\"c_content\": \"" + ccvo.getC_content() + "\",");
		sb.append("\"goal\": \"" + ccvo.getGoal() + "\",");
		sb.append("\"c_totpoint\":" + ccvo.getC_totpoint());
		sb.append("},");

		
		sb.deleteCharAt(sb.length()-1);
		sb.append("]");
		System.out.println(sb.toString());
		return sb.toString();

	}

}
