package com.knock.model.command.signin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.MemberDAO;
import com.knock.model.vo.MemberVO;

public class UserJoinCommand implements Command{

   @Override
   public String exec(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
      List<MemberVO> list;
      System.out.println("userJoin의 Command입니다.");
      req.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      
      String id = req.getParameter("user_id");
      String pwd = req.getParameter("pwd");
      String name = req.getParameter("name");
      String email = req.getParameter("email");
      String nickname = req.getParameter("nickname");
      String phone = req.getParameter("phone");
      String birth = req.getParameter("birth");
      int gender = Integer.parseInt(req.getParameter("gender"));
      String address = req.getParameter("address");
      
      MemberVO vo = new MemberVO();
      vo.setUser_id(id);
      vo.setPwd(pwd);
      vo.setName(nickname);
      vo.setEmail(email);
      vo.setNickname(nickname);
      vo.setPhone(phone);
      vo.setBirth(birth);
      vo.setGender(gender);
      vo.setAddress(address);
      System.out.println("command에서 받은 vo: "+vo.toString());
      int result = MemberDAO.joinknock(vo);
      return "../main.jsp";
   }
   

}