package com.knock.model.command.signin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;
import com.knock.model.dao.MemberDAO;
import com.knock.model.vo.MemberVO;

public class loginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("로그인커맨드");
		String user_id = request.getParameter("user_id");
		System.out.println(user_id);
		String pwd = request.getParameter("pwd");
		System.out.println(pwd);
		MemberDAO dao = new MemberDAO();
		int num =  dao.loginIdCheck(user_id);
		MemberVO vo = dao.getIdPwdName(user_id);
		String path = "";
		
		System.out.println("num "+num);
		System.out.println(vo);
		PrintWriter out = response.getWriter();

		if(num==1) {
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			return "signin/login.jsp"; 

			//아이디가 없음
		}else if(num==-1){
			//아이디는 있을때 -> 비밀번호 체크
			if(vo.getPwd().equals(pwd)) {
				System.out.println("로그인성공"); 
				//비밀번호 일치->로그인
				System.out.println("knockadmin:" + vo.getKnock_admin());
				session.setAttribute("user_idx", vo.getUser_idx());
				session.setAttribute("knock_admin", vo.getKnock_admin());
				session.setAttribute("nickname", vo.getName());
				session.setAttribute("totalpoint", vo.getTotal_point());
				session.setAttribute("used_point", vo.getUsed_point());
				
				out.println("<script>");
				out.println("alert('오늘도 노크해주셔서 감사합니다 :-)');");
				out.println("location.href='main.jsp';");

				out.println("location.href='" + request.getContextPath() +"/main.jsp';");
				out.println("</script>");
				
				return "location.href='/main.jsp';"; 
			}else {
				//로그인안된거니까--> 메인페이지로..?
	 			System.out.println("비밀번호오류");
	 			out.println("<script>");
				out.println("alert('비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}
		}else {
			//아이디가 아예없으니까 로그인실패.
			out.println("<script>");
			out.println("alert('아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return "main.jsp";	
				
		}
	}

}
