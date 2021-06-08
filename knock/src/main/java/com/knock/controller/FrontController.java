package com.knock.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;

@WebServlet
public class FrontController extends HttpServlet {
	//어떤 명령이 들어오는건지 나눠줄 front controller
	//그리고 명령에 따른 command 만들어주기
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("command");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String cmd = request.getParameter("command");
		String nextPage = "";
		
		if(cmd==null) {
			Command command = null;
		}else if(cmd.equals("REG")) {
			nextPage = "/regForm.jsp";
		}else if(cmd.equals("CONFIRM")) {
            nextPage = "/confirm.jsp";
		}else if(cmd.equals("SAVE")){          
            nextPage = "/register.jsp";        
        }else{
            nextPage="/error.jsp";
        }
		RequestDispatcher view = request.getRequestDispatcher(nextPage);
		view.forward(request, response);
		
		
	}
	
}
