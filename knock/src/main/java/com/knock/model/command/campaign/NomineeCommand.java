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
		
		// 펀딩일이 종료되었는지 아닌지 확인
		CampaignNomineeDAO.expire();
		// 펀딩 진행중인 캠페인을 불러옴
		NomineeVO nominee = CampaignNomineeDAO.one();
		
		// nominee가 null이라면 주소 반환하고 command 종료 
		if(nominee == null) {
			return "campaign/nominee.jsp";
		}
		
		// 로그인한 이용자가, 해당 캠페인에 참여했는지 확인
        int campaign_idx = nominee.getCampaign_idx();
        NomUserVO nomUser = new NomUserVO();
        nomUser.setCampaign_idx(campaign_idx);
        nomUser.setUser_idx(user_idx);
        
        int check=-1;
        // 참여한 경우 "check" 속성에 1을 부여해준다
        if(NomUserDAO.check(nomUser)) {
        	request.setAttribute("check", 1);
        	check = 1;
        }
        System.out.println(check);
        
		// 해당 캠페인에 참여한 유저의 닉네임 명단을 불러옴
		List<String> nomUserList = NomUserDAO.list(campaign_idx);

		request.setAttribute("nomUserList", nomUserList);
		request.setAttribute("nominee", nominee);
		return "campaign/nominee.jsp";
	}

	
}
