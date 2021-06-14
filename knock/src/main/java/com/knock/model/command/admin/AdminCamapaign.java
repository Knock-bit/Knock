package com.knock.model.command.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.AdminCampaignDAO;
import com.knock.model.vo.CampaignCategoryVO;

public class AdminCamapaign implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CampaignCategoryVO> list = AdminCampaignDAO.list();
		request.setAttribute("list", list);
		System.out.println(list);
		return "admin/adminCampaign.jsp";
	}

}
