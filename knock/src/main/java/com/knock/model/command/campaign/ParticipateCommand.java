package com.knock.model.command.campaign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.NomUserDAO;
import com.knock.model.vo.NomUserVO;

public class ParticipateCommand implements Command {
	
	int user_idx;
	
	public ParticipateCommand(int user_idx) {
		this.user_idx = user_idx;
	}
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int spent_point = Integer.parseInt(request.getParameter("spent_point"));
		int nominee_idx= Integer.parseInt(request.getParameter("nominee_idx"));
		
		NomUserVO nomUser = new NomUserVO();
		nomUser.setNominee_idx(nominee_idx);
		nomUser.setSpent_point(spent_point);
		nomUser.setUser_idx(user_idx);
		
		
		// Campaign_nom_user에 insert 
		NomUserDAO.insert(nomUser);
		// User table에 used_point = used_point + spent_point
		// UserDAO==> UPDATE USER SET USED_POINT = USED_POINT + #{SPENT_POINT}
		
		return "campaign?type=nominee";
	}

}
