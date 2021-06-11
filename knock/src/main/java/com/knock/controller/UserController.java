package com.knock.controller;

import java.io.IOException; 

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.command.mypage.MyInfoBtnCommand;
import com.knock.model.command.mypage.MyInfoUpdateCommand;
import com.knock.model.command.mypage.MypageListCommand;


@WebServlet("/userctr")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String type = request.getParameter("type");
		Command command = null;
		
		if(type.equals("moveMypage.do")) {
			// 마이페이지로 이동 & 내 정보 출력
			command = new MypageListCommand();
			
		} else if(type.equals("updateMyInfoBtn.do")) {
			// 내정보 수정페이지로 이동
			command = new MyInfoBtnCommand();
			
		} else if(type.equals("updateMyInfo.do")) {
			// 마이페이지 정보 수정 완료
			command = new MyInfoUpdateCommand();
		}
		
		
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
