package com.knock.model.command.mypage;


import java.io.IOException;   

import java.io.IOException;  


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;
import com.knock.model.vo.UserVO;

public class MypageListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String user_id = request.getParameter("user_id");
		UserVO vo = UserDAO.myPageList(user_id);
		
		if(vo!=null) {
			session.setAttribute("vo", vo);
			return "/mypage/mypage.jsp";
		}
		
		
		return "/mypage/main.jsp";
	}

}
