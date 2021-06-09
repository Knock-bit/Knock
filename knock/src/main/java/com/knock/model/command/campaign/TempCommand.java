package com.knock.model.command.campaign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;

public class TempCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		
		HttpSession session;
        session = request.getSession();
        session.setAttribute("user_idx", user_idx);
		return "campaign/index.jsp";
	}

}
