package com.knock.model.command.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.AdminKeywordDAO;

public class AdminKeywordAdd implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String data = request.getParameter("data");
		System.out.println("Command data : " + data);
		String message = "";
		AdminKeywordDAO.keywordAdd(data);
		String result = "성공했는데";
		PrintWriter out = response.getWriter();
		request.setAttribute("result",result);
		return "admin/adminUserList.jsp";
	}
}
