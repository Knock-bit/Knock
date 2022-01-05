package com.knock.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.command.signin.MemberIdChkCommand;
import com.knock.model.command.signin.UserJoinCommand;
import com.knock.model.vo.MemberVO;

@WebServlet("/signin")
public class UserJoinController extends HttpServlet{
   private static final long serialVersionUID = 1L;

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("utf-8");
      System.out.println("==========");
      Command command = null;
      
      resp.setContentType("text/html; charset=utf-8");
      
      MemberVO vo = new MemberVO();
      String type = req.getParameter("type");
      if(type.equals("join")) {

      command = new UserJoinCommand();
      System.out.println("command로 보내기 전의 VO:");
      System.out.println(vo);
      }
      String path = command.exec(req, resp);
      
      System.out.println("path>> " + path);
      PrintWriter out = resp.getWriter();
      
		if(path == null||path.equals("")) {
			System.out.println("실행했던 command의 리턴값이 빈칸이거나 null임");
			return;
		} else {
			
			out.println("<script>");
			out.println("location.href='" +req.getContextPath()  +"/main.jsp';");		
			out.println("</script>");
			System.out.println("getRequestDispatcher 실행");
			req.getRequestDispatcher(path).forward(req, resp);			
		}
   }   
}