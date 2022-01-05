package com.knock.model.command.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.BoardDAO;
import com.knock.model.vo.BoardVO;

public class BoardWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user_idx = 3;
		String subject = request.getParameter("subject");
		String b_content = request.getParameter("b_content");
		String b_file = request.getParameter("b_file");
		
		System.out.println(subject);
	    System.out.println(b_content);
		System.out.println(b_file);
		      
		BoardVO board = new BoardVO();
		board.setUser_idx(user_idx);
		board.setSubject(subject);
		board.setB_content(b_content);
		board.setB_file(b_file);
		      
		BoardDAO.insertBoard(board);
		      
		return "board/boardWrite.jsp";
	}
}