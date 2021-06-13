package com.knock.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;
import com.knock.model.command.signin.loginCommand;

 
@WebServlet("/login")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Command command = null;
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		String type = req.getParameter("type");
		System.out.println("로그인타입? "+type);
		if(type.equals("login")) {
			System.out.println("로그인커맨드 가기직전");
			command = new loginCommand();
			command.exec(req, resp);
		};
		
	}
}
