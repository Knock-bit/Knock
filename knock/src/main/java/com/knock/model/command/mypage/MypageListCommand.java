package com.knock.model.command.mypage;


import java.io.IOException;
import java.util.List;
import java.io.IOException;  


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;
import com.knock.model.vo.CampaignIngVO;
import com.knock.model.vo.UserVO;

public class MypageListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String user_idx = request.getParameter("user_idx");
		UserVO vo = UserDAO.myPageList(user_idx);
		
		// 현재 참여중인 캠페인 리스트
		List<CampaignIngVO> clist = UserDAO.camIngList(user_idx);
		
		if(vo!=null) {
			session.setAttribute("vo", vo);
			request.setAttribute("clist", clist);
			return "/mypage/mypage.jsp";
		}
		
		
		return "/mypage/main.jsp";
	}

}
