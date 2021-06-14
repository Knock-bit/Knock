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
	
	int user_idx;
	
	public MypageListCommand(int user_idx) {
		
		this.user_idx = user_idx;
	}

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String user_idx2 = String.valueOf(session.getAttribute("user_idx"));
		int user_idx = Integer.parseInt(user_idx2);
		
		//int user_idx = Integer.parseInt(request.getParameter("user_idx"));
		UserVO user = UserDAO.myPageList(user_idx);
		
		// 현재 참여중인 캠페인 리스트(정보)
		List<CampaignIngVO> clist = UserDAO.camIngList(user_idx);
		
		// 앰블럼 갯수
		int emblemCount = UserDAO.emblemCount(user_idx);

		System.out.println("MyPageListCommand >> user_idx " + user_idx);
//		String user_idx = request.getParameter("user_idx");
//		UserVO user = UserDAO.myPageList(user_idx);
//		int user_idx = (UserVO)session.getAttribute("user");
		
		// 현재 참여중인 캠페인 리스트
//		List<CampaignIngVO> clist = UserDAO. camIngList(user_idx);
//		request.setAttribute("clist", clist);
//		request.setAttribute("user", user);
		
//		if(user_idx!=null) {
////			session.setAttribute("user", user);
//			return "/mypage/mypage.jsp";
//		}

		
		// 랭킹(누적포인트)
		int rank = UserDAO.userRank(user_idx);
		

		
		session.setAttribute("user", user);
		session.setAttribute("emblemCount", emblemCount);
		session.setAttribute("rank", rank);
		session.setAttribute("clist", clist);

		return "/mypage/mypage2.jsp";
	}
}
