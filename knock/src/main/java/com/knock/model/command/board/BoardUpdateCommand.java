package com.knock.model.command.board;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.BoardDAO;

public class BoardUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = null;
		String pwd = request.getParameter("pwd");
		String subject = request.getParameter("subject");
		String b_content = request.getParameter("b_content");
		String b_file = request.getParameter("b_file");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("pwd", pwd);
		map.put("subject", subject);
		map.put("b_content", b_content);
		map.put("b_file", b_file);
		
		int result = BoardDAO.updateBoard(map);
		
		if (result == 1) {
			request.setAttribute("msg", "[ 게시글 수정완료 ]");
			request.setAttribute("loc", "/board/index.jsp");
			return "board/index.jsp";
		} else {
			request.setAttribute("msg", "[ 게시글 수정실패 ]");
			request.setAttribute("loc", "/board/boardUpdate.jsp");
			return "board/boardUpdate.jsp";
		}
	}
}
