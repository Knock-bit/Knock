package com.knock.model.command.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.vo.CampaignIngVO;
import com.knock.model.vo.CampaignNomineeVO;
import com.knock.model.vo.ProposalVO;
import com.knock.model.command.Command;
import com.knock.model.dao.ProposalDAO;

public class ProposalCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> Proposal Command 실행");
		String title = request.getParameter("title");
		String goal = request.getParameter("goal");
		int goal_point = Integer.parseInt(request.getParameter("goal_point"));
		String p_content = request.getParameter("p_content");
		int user_idx = Integer.parseInt(request.getParameter("user_idx")); //이건 나중에 session에서 받도록.

		ProposalVO proposal = new ProposalVO();
		proposal.setGoal(goal);
		proposal.setGoal_point(goal_point);
		proposal.setP_content(p_content);
		proposal.setTitle(title);
		proposal.setUser_idx(user_idx);
		
		ProposalDAO.insert(proposal);
		
		return "index.jsp";
	}

}
