package com.knock.model.command.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.BoardDAO;
import com.knock.model.vo.BoardVO;

public class BoardListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<BoardVO> boardList = BoardDAO.list();
		request.setAttribute("boardList", boardList);
		return "board.boardList.jsp";
	}

}
