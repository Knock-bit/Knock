package com.knock.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.command.admin.AdminUserActiveUpdate;
import com.knock.model.command.admin.AdminUserListCommand;
import com.knock.model.command.campaign.CampaignListCommand;
import com.knock.model.command.campaign.CampaignOneCommand;
import com.knock.model.command.campaign.ProposalCommand;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String action = request.getPathInfo();
		System.out.println("action:" + action);

		String type = request.getParameter("type");
		System.out.println("type: " + type);

		Command command = null;
		if ("/index.jsp".equals(action)) {
		} else if ("adminUserList".equals(type)) {
			command = new AdminUserListCommand();
		} else if ("active".equals(type)) {
			command = new AdminUserActiveUpdate();
		}

		if (command == null || command.equals("")) {
			System.out.println("command가 빈칸이거나 null임");
			return;
		} else {
			String path = command.exec(request, response);
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

}
