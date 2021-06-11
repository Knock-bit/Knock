package com.knock.model.command.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;
import com.knock.model.vo.CampaignIngVO;
import com.knock.model.vo.MyCampaignPagingVO;

public class EndCamListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_idx = request.getParameter("user_idx");
		List<CampaignIngVO> clist = UserDAO.endList(user_idx);
		
		MyCampaignPagingVO p = new MyCampaignPagingVO();
		
		// 전체 게시물 수 구하기
		p.setTotalRecord(UserDAO.getTotalCount(user_idx)); // 전체 게시글 수
		p.setTotalPage();// 전체 페이지 수
		
		// 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage !=null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		// 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumberPage());
		p.setBegin(p.getEnd()-p.getNumberPage()+1);
		
		// end 페이지 정확히 구하기
		if(p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		//-------- 블록 계산
		// 4. 블록으ㅣ 시작페이지, 끝페이지 구하기
		// 시작페이지 번호 구하기
		int nowPage = p.getNowPage();
		int beginPage = (nowPage-1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage+p.getPagePerBlock() -1);
		
		if(p.getEndPage()>p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		// 현재 페이지 기준으로 db 데이터 가져오기
		List<CampaignIngVO> cclist = UserDAO.getEndList(p.getBegin(), p.getEnd(), user_idx);
		System.out.println("cclist: " + cclist);
		
		
		
		request.setAttribute("pvo", p);
		request.setAttribute("cclist", cclist);
		return "/mypage/end_campaign.jsp";
	}

}
