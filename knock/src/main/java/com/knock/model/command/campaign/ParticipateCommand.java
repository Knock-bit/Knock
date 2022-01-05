package com.knock.model.command.campaign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.IngUserDAO;
import com.knock.model.dao.NomUserDAO;
import com.knock.model.vo.IngUserVO;
import com.knock.model.vo.NomUserVO;

public class ParticipateCommand implements Command{
	
	int user_idx;
	int participate = -300;
	
	public ParticipateCommand(int user_idx) {
		this.user_idx = user_idx;
	}
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int spent_point = 0;
		int campaign_idx = Integer.parseInt(request.getParameter("idx"));
		
		// 캠페인 참여
		// -> 차감할 포인트를 정하기 위해
		// 	  후기게시판으로 이동하기 전에 사용자 식별 필요.
		IngUserVO ingUser = new IngUserVO(campaign_idx, user_idx);
		if(IngUserDAO.check(ingUser)) {
			// 식별(1) 캠페인에 참여하였는가
			// -> 포인트 차감 0
		} else {
			// 식별(2) 펀딩에 참여하였는가
			//		  -> 펀딩 참여시   0   포인트 차감 
			//		  -> 펀딩 미참여시  300 포인트 차감
			NomUserVO nomUser = new NomUserVO(campaign_idx, user_idx);
			if(!NomUserDAO.check(nomUser)) {
				// 펀딩 미참여한 경우
				spent_point = 300;
			};
					
		};
		
		request.setAttribute("point", spent_point);
		
		return "campaign/write.jsp";
	}
	
	
}
