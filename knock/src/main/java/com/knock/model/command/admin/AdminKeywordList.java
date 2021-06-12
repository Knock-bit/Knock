package com.knock.model.command.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.AdminKeywordDAO;
import com.knock.model.vo.KeywordVO;

public class AdminKeywordList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<KeywordVO> keyList = AdminKeywordDAO.keywordList();
		request.setAttribute("keyList", keyList);
		return "admin/adminKeyword.jsp";
	}

}
