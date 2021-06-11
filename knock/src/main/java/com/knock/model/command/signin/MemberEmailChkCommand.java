package com.knock.model.command.signin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.MemberDAO;

 
public class MemberEmailChkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		int result = dao.duplicateEmailCheck(email);
		String str=String.valueOf(result);
		
		request.setAttribute("result", str);
		String path = "emailCheckForm.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		return path;
	}

}
