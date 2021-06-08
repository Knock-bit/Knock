package com.knock.model.command.campaign;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.knock.model.command.Command;
import com.knock.model.dao.CampaignNomineeDAO;
import com.knock.model.vo.CampaignNomineeVO;

public class NomineeListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CampaignNomineeVO> nomineeList = CampaignNomineeDAO.list();
		return null;
	}

}
