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
		System.out.println("EMAIL컨트롤러에 온 type(email): "+email); 

		Command command = null;
		System.out.println("받은 email: "+email);
		System.out.println("이메일 컨트롤러 실행~");

		if("emailchk".equals(type)) {
			command = new MemberEmailChkCommand();
			System.out.println("Command실행");
		}
		command.exec(req, resp);
		
	}
}
