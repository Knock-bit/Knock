package com.knock.model.command.mypage;

import java.io.IOException;   

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;

public class DeleteUserPageCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = "";
		
		return "/00_mypage/deleteUser.jsp";
	}

}
