package com.knock.model.command.campaign;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.vo.CampaignIngVO;
import com.knock.model.vo.NomineeVO;
import com.knock.model.vo.ProposalVO;
import com.knock.model.command.Command;
import com.knock.model.dao.ProposalDAO;

public class ProposalCommand implements Command {
	
	int user_idx;
	
	public ProposalCommand(int user_idx) {
		
		this.user_idx = user_idx;
	}


	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> Proposal Command 실행");
		String p_title = request.getParameter("p_title");
		String goal = request.getParameter("goal");
		int goal_point = Integer.parseInt(request.getParameter("goal_point"));
		String p_content = request.getParameter("p_content");
//		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		String[] p_keyword = request.getParameterValues("p_keyword");
		
		ProposalVO proposal = new ProposalVO();
		proposal.setGoal(goal);
		proposal.setGoal_point(goal_point);
		proposal.setP_content(p_content);
		proposal.setP_title(p_title);
		proposal.setUser_idx(user_idx);
	
		System.out.println(p_keyword[0]);
		System.out.println(p_keyword.length);
		PrintWriter out = response.getWriter();
		
		switch(p_keyword.length) {
		case 3 :
			proposal.setP_keyword3(p_keyword[2]);
		case 2 :
			proposal.setP_keyword2(p_keyword[1]);
		case 1 :
			proposal.setP_keyword1(p_keyword[0]);
			System.out.println(">>swithc문 안 :" + p_keyword[0]);
			System.out.println(proposal.getP_keyword1());			
			break;
		default :
			break;
		}	
		
		System.out.println(proposal.getP_keyword1());
		int result = ProposalDAO.insert(proposal);
		System.out.println(result);
		
			out.println("<script>");
			out.println("alert('성공적으로 제안하였습니다');");
			out.println("location.href='campaign/TBC_CSSforProposal.jsp';");

			out.println("</script>");
		
		return "main.jsp";
	}

}
