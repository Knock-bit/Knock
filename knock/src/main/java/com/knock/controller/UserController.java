package com.knock.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.command.mypage.CampaignIngCommand;
import com.knock.model.command.mypage.DeleteUserCommand;
import com.knock.model.command.mypage.DeleteUserPageCommand;
import com.knock.model.command.mypage.DetailCampaignCommand;
import com.knock.model.command.mypage.EndCamListCommand;
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
		
		} else if(type.equals("deleteUserBtn.do")) {
			// 회원 탈퇴 페이지 이동
			command = new DeleteUserPageCommand();
			
		} else if(type.equals("deleteUser.do")) {
			// 회원 탈퇴
			command = new DeleteUserCommand();
		
		} else if(type.equals("campaigning.do")) {
			// 현재 참여하는 캠페인 이동 버튼
			String result = new CampaignIngCommand().exec(request, response);
			PrintWriter out = response.getWriter();
			out.print(result);
			return;
		} else if(type.equals("cdetail.do")) {
			// 현재 진행중인 캠페인 상세보기
			String result = new DetailCampaignCommand().exec(request, response);
			PrintWriter out = response.getWriter();
			out.print(result);
			return;
			
		} else if(type.equals("endCam.do")) {
			command = new EndCamListCommand();
		
		}
			
		
		
		
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
