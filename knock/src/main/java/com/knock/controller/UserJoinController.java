package com.knock.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.vo.MemberVO;

@WebServlet("/signin/join")
public class UserJoinController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getParameter("utf-8");
		
		String id = req.getParameter("user_id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String nickname = req.getParameter("nickname");
		String phone = req.getParameter("phone");
		String birth = req.getParameter("birth");
		int gender = Integer.parseInt(req.getParameter("gender"));
		String address = req.getParameter("address");
		
		MemberVO vo = new MemberVO();
		vo.setUser_id(id);
		vo.setPwd(pwd);
		vo.setName(nickname);
		vo.setEmail(email);
		vo.setNickname(nickname);
		vo.setPhone(phone);
		vo.setBirth(birth);
		vo.setGender(gender);
		vo.setAddress(address);	
	}	
}
