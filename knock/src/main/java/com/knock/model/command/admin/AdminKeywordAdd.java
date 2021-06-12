package com.knock.model.command.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.AdminKeywordDAO;

public class AdminKeywordAdd implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyContent = request.getParameter("keyContent");
		System.out.println("keyContent");
		String message = "";
		if(keyContent.equals("")) {
			message ="키워드 입력 실패";
		} else {
			int result = AdminKeywordDAO.keywordAdd(keyContent);
			if(result ==1) {
				message ="키워드 입력 성공";
			} else {
				message ="키워드 입력 실패";
			}
		}
		request.setAttribute("message", message);
		return "admin/adminKeyword.jsp";
	}
}
