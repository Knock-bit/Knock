package com.knock.model.command.signin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.MemberDAO;

public class MemberIdChkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		int result;
		
		MemberDAO dao = new MemberDAO();
		result = dao.duplicateIdCheck(user_id);
		String str = String.valueOf(result);
		request.setAttribute("result", str);	

		String path = "idCheckForm.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);

		return path;
	}

	 

}
