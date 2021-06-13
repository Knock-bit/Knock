package com.knock.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.command.board.BoardDeleteCommand;
import com.knock.model.command.board.BoardListCommand;
import com.knock.model.command.board.BoardUpdateCommand;

@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID =1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doGet() 실행");
		doHandle(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.doPost() 실행");
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		Command command = null;
			if ("boardList".equals(type)) {
				command = new BoardListCommand();
			} else if ("boardUpdate".equals(type)) {
				command = new BoardUpdateCommand();
			}	else if ("boardDelete".equals(type)) {
				command = new BoardDeleteCommand();
		
			String path = command.exec(request, response);
			request.getRequestDispatcher(path).forward(request, response);
			}
	}
}