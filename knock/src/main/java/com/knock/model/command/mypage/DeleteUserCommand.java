package com.knock.model.command.mypage;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;

public class DeleteUserCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user_id = request.getParameter("user_id");
		System.out.println("user_id:" + user_id);
		int result = UserDAO.deleteUser(user_id);
		
		if(result==1) {
			
			request.setAttribute("msg", "회원탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			request.setAttribute("loc", "/00_main/main.jsp");
			session.invalidate();
			return "/common/view.jsp";
		} else {
			request.setAttribute("msg", "에러가 발생했습니다. 다시 진행해주세요.");
			request.setAttribute("loc", "/00_mypage/deleteUser.jsp");
			return "/common/view.jsp";
		}
		
		
		
		
		
	}

}
