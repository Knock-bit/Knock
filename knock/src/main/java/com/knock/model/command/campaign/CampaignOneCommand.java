package com.knock.model.command.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.CKeywordDAO;
import com.knock.model.dao.CampaignIngDAO;
import com.knock.model.vo.CKeywordVO;
import com.knock.model.vo.CampaignIngVO;

public class CampaignOneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> CampaignOne!! Command 실행");
		int campaign_idx = Integer.parseInt(request.getParameter("idx"));
		CampaignIngVO campaignIng = CampaignIngDAO.one(campaign_idx);
		List<String> ing_userList = CampaignIngDAO.participant(campaign_idx);
		CKeywordVO keywordList = CKeywordDAO.keywords(campaign_idx);
		request.setAttribute("keywordList", keywordList);
		request.setAttribute("campaignIng", campaignIng);
		request.setAttribute("ing_userList", ing_userList);
		return "campaign/campaignView.jsp";
	}

}
