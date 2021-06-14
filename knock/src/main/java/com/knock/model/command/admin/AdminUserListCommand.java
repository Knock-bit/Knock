package com.knock.model.command.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.AdminUserActiveDAO;
import com.knock.model.vo.UserVO;

public class AdminUserListCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserVO> list = AdminUserActiveDAO.getList();
		request.setAttribute("userList", list);
		return "admin/adminUserList.jsp";
	}
}
