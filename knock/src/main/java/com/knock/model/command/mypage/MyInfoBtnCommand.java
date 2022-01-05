package com.knock.model.command.mypage;

import java.io.IOException;  

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;
import com.knock.model.vo.UserVO;

public class MyInfoBtnCommand implements Command{
	
	int user_idx;
	
	public MyInfoBtnCommand(int user_idx) {
		this.user_idx = user_idx;
	}
	

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		UserVO user = UserDAO.myPageList(user_idx);
		request.setAttribute("user", user);
		
		return "/mypage/updateMypage.jsp";
	}
	
}