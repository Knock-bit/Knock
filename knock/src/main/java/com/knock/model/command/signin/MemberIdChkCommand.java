package com.knock.model.command.signin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.MemberDAO;

public class MemberIdChkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		int result;
		System.out.println("command로 넘어온 user_id: " + user_id);
		if (user_id == null||user_id.equals("")) {
			result = 0;

			System.out.println("받은 아이디가 없는 result값: " + result);
			String str = String.valueOf(result);
			System.out.println("형변환 후 result(str로변수) >> " + str);
			// -----------여기까지는 실행이 됨
			request.setAttribute("result", str);
		} else {
			MemberDAO dao = new MemberDAO();
			result = dao.duplicateIdCheck(user_id);
			System.out.println("command에서result>> " + result);
			String str = String.valueOf(result);
			System.out.println("형변환 후 result >> " + str.getClass().getName());
			// -----------여기까지는 실행이 됨
			request.setAttribute("result", str);
		}

		String path = "idCheckForm.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);

		return path;

	}

	 

}
