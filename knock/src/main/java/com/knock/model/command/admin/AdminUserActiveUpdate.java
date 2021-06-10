package com.knock.model.command.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.AdminDAO;
import com.knock.model.vo.UserVO;

public class AdminUserActiveUpdate implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		UserVO user = AdminDAO.selectUserOne(idx);
		System.out.println("selectUserOne : " + user);
		System.out.println(user.getKnock_active());
		if(user.getKnock_active().equals("1")) {
			System.out.println("true");
			AdminDAO.updateActiveFalse(user);
		} else {
			System.out.println("flase");
			AdminDAO.updateActiveTrue(user);
		}

		List<UserVO> list = AdminDAO.getList();
		request.setAttribute("userList", list);
		return "admin/index.jsp";
	}

}
