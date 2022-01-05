package com.knock.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.command.signin.MemberIdChkCommand;


@WebServlet("/signin/checkcheck")
public class MemberIdChkController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		String user_id = req.getParameter("user_id");		
		if (user_id == null || user_id.equals("")) {
			Command command = null;
			command = new MemberIdChkCommand();
			command.exec(req, resp);
		} else {
			Command command = null;
			if ("dupchk".equals(type)) {
				command = new MemberIdChkCommand();
			}
			command.exec(req, resp);
		}
	}
}
