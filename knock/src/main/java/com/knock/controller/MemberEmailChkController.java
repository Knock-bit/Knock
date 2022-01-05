package com.knock.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.signin.MemberEmailChkCommand;
import com.knock.model.command.Command;
 
@WebServlet("/signin/checkemail")
public class MemberEmailChkController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		String email = req.getParameter("email");
		Command command = null;
		if ("emailchk".equals(type)) {
			command = new MemberEmailChkCommand();
		}
		command.exec(req, resp);
	}
}
