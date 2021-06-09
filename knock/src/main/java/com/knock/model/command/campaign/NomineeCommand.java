package com.knock.model.command.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;
import com.knock.model.dao.CampaignNomineeDAO;
import com.knock.model.dao.NomUserDAO;
import com.knock.model.vo.NomUserVO;
import com.knock.model.vo.NomineeVO;

public class NomineeCommand implements Command {
	
	int user_idx;
	
	public NomineeCommand(int user_idx) {
		this.user_idx = user_idx;
	}
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//List<CampaignNomineeVO> nomineeList = CampaignNomineeDAO.list();
		
		// 펀딩 진행중인 캠페인을 불러옴
		NomineeVO nominee = CampaignNomineeDAO.one();
		
		// 로그인한 이용자가, 해당 캠페인에 참여했는지 확인
		// 참여한 경우 "check" 속성에 1을 부여해준다
		

        int nominee_idx = nominee.getNominee_idx();
        NomUserVO nomUser = new NomUserVO();
        nomUser.setNominee_idx(nominee_idx);
        nomUser.setUser_idx(user_idx);
        
        if(NomUserDAO.check(nomUser)) {
        	// 참여한 경우
        	request.setAttribute("check", 1);
        };
        
		// 해당 캠페인에 참여한 유저의 닉네임 명단을 불러옴
		List<String> nomUserList = NomUserDAO.list(nominee_idx);

		request.setAttribute("nomUserList", nomUserList);
		request.setAttribute("nominee", nominee);
		return "campaign/nominee.jsp";
	}

	
}
