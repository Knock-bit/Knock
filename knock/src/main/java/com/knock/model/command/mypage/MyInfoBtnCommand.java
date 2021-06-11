package com.knock.model.command.mypage;


import java.io.IOException;   

import java.io.IOException;  


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;
import com.knock.model.vo.UserVO;

public class MyInfoBtnCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		UserVO vo = UserDAO.myPageList(id);
		request.setAttribute("vo", vo);
		
		return "00_mypage/updateMypage.jsp";
	}
	
}
