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
		request.setAttribute("ccvo", ccvo);
		
		return "/mypage/campaign_ing.jsp";
	}

}
