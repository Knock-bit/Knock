package com.knock.model.command.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.CampaignIngDAO;
import com.knock.model.vo.CampaignIngVO;

public class CampaignListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("expire 결과:" + CampaignIngDAO.expire());
		List<CampaignIngVO> campaignIngList = CampaignIngDAO.list();
		List<CampaignIngVO> campaignedList = CampaignIngDAO.endList();
		
		request.setAttribute("campaignIngList", campaignIngList);
		request.setAttribute("campaignedList", campaignedList);
		/*
		 * List<KeywordVO> keywordList = KeywordDAO.list();
		 * request.setAttribute("keywordList", keywordList);
		 */
		return "campaign/campaignIng.jsp";
	}

}