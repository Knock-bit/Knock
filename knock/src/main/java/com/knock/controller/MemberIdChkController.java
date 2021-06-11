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
		
		System.out.println("컨트롤러에 온 type: "+type); 
		if(user_id==null || user_id.equals("")) {
			System.out.println("받은거 없어서 멈출거야");
			Command command = null;
			System.out.println("컨트롤러 실행");
			command = new MemberIdChkCommand();				
			System.out.println("받은게 없는데 우선 command로 간다");
			command.exec(req, resp);

			
		}else {
			System.out.println("받은 user_id: "+ user_id);
			Command command = null;
			if("dupchk".equals(type)) {
				command = new MemberIdChkCommand();
				
			}
			command.exec(req, resp);
		}
		
	}
	
}
