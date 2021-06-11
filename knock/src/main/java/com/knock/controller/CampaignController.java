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
import com.knock.model.command.campaign.NomineeListCommand;
import com.knock.model.command.campaign.ProposalCommand;

@WebServlet("/campaign")
public class CampaignController extends HttpServlet{
	private static final long serialVersionUID =1L;
	private static String ARTICLE_IMAGE_REPO = "C:\\knockboard\\article_image";
	HttpSession session;
	private Command campaignListCommand = new CampaignListCommand();
	private Command campaignOneCommand = new CampaignOneCommand();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() �떎�뻾");
		String type = request.getParameter("type");
		System.out.println(type);
		doHandle(request,response);
	}
	
	protected void doPost(HttpServletRequest request,  HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doPost() �떎�뻾");
//		doGet(request, response);
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		String type = request.getParameter("type");
		System.out.println("> type: " + type);
		Command command = null;
		
		if ("ingList".equals(type)) {
			command = campaignListCommand;
		} else if ("ingOne".equals(type)) {
			command = campaignOneCommand;
		} else if ("proposal".equals(type)) {
			command = new ProposalCommand();
		} else if ("nomineeList".equals(type)) {
			command = new NomineeListCommand();
		}
		String path = command.exec(request, response);
		
		System.out.println(path);
		if(path == null||path.equals("")) {
			System.out.println("path媛� 鍮덉뭏�씠嫄곕굹 null�엫");
			return;
		} else {
			request.getRequestDispatcher(path).forward(request, response);			
		}
//		System.out.println();
		
	}
	
	
	
}
