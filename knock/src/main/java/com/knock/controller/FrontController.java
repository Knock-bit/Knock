package com.knock.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;
import com.knock.model.command.campaign.CampaignListCommand;
import com.knock.model.command.campaign.CampaignOneCommand;
import com.knock.model.command.campaign.CampaignProposalCommand;


@WebServlet("/controller")
public class FrontController extends HttpServlet{
	private static final long serialVersionUID =1L;
	HttpSession session;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행");
		doHandle(request,response);
	}
	
	protected void doPost(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doPost() ?실행");
//		doGet(request, response);
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		String type = request.getParameter("type");
		System.out.println("> type: " + type);
		Command command = null;
		
			   if ("cList".equals(type)) {
			command = new CampaignListCommand();
		} else if ("cOne".equals(type)) {
			command = new CampaignOneCommand();
		} else if ("cProposal".equals(type)) {
			command = new CampaignProposalCommand();
		}
		String path = command.exec(request, response);
		
		System.out.println(path);
		if(path.equals("")) {
			return;
		} else {
			request.getRequestDispatcher(path).forward(request, response);			
		}
//		System.out.println();
		
	}
	
	
	
}
