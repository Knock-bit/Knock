package com.knock.model.command.mypage;

import java.io.IOException;  
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;

public class MyInfoUpdateCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String user_img = request.getParameter("imageFileName");
		
		System.out.println("id : " + user_id + ", email : " + email + ", user_img : " + user_img + ", pwd : " + pwd );
		
		HashMap<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("pwd", pwd);
		map.put("email", email);
		map.put("user_img", user_img);
		
		int result = UserDAO.updateMypage(map);
		
		if(result==1) {
			request.setAttribute("msg", "[ 회원정보가 수정되었습니다 ]");
			request.setAttribute("loc", "/mypage.jsp");
			return "/common/view.jsp";
		} else {
			request.setAttribute("msg", "[ 정보 수정이 실패했습니다. ]");
			request.setAttribute("loc", "/mypage/updateMypage.jsp");
			return "/common/view.jsp";
			
		}
		
		
		
		
	}

}
