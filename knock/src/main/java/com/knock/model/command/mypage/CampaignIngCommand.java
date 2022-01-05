package com.knock.model.command.mypage;

import java.io.IOException; 
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.knock.model.command.Command;
import com.knock.model.dao.UserDAO;
import com.knock.model.vo.CampaignIngVO;


public class CampaignIngCommand implements Command{  
   int user_idx;
   HttpSession session;
// 페이징 처리 구현
   @Override
   public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 캠페인테이블과 연결된 user_idx 및 캠페인 완료날짜 가져오기
      session =request.getSession();  
      //Integer user_idx = (Integer)session.getAttribute("user_idx");
      
      int user_idx = Integer.parseInt(request.getParameter("user_idx"));
      System.out.println("캠페인커맨드 useridx;:" + user_idx);
      List<CampaignIngVO> clist = UserDAO.camIngList(user_idx); 
      
      // json데이터 만들기
      StringBuilder sb = new StringBuilder();
      sb.append("[");
      for(CampaignIngVO cvo : clist){
         sb.append("{");
         sb.append("\"campaign_idx\":" + cvo.getCampaign_idx() + ",");
         sb.append("\"title\": \"" + cvo.getTitle() + "\",");
         sb.append("\"c_content\": \"" + cvo.getC_content() + "\",");
         sb.append("\"goal\": \"" + cvo.getGoal() + "\",");
         sb.append("\"end_date\": \""  + cvo.getEnd_date() + "\",");
         sb.append("\"base_point\": \"" + cvo.getBase_point() + "\",");
         sb.append("\"estimated_point\": \"" + cvo.getEstimated_point() + "\",");
         sb.append("\"status\": \"" + cvo.getStatus() + "\",");
         sb.append("\"c_file\": \"" + cvo.getC_file() + "\",");
         sb.append("\"emblem\": \"" + cvo.getEmblem() + "\",");  
         sb.append("\"user_idx\": \"" + cvo.getUser_idx() + "\",");
         sb.append("\"c_category\": \"" + cvo.getC_category() + "\",");
         sb.append("\"c_category_name\": \"" + cvo.getC_category_name() + "\",");
         sb.append("\"keyword1\": \"" + cvo.getKeyword1() + "\",");
         sb.append("\"keyword2\": \"" + cvo.getKeyword2() + "\",");
         sb.append("\"keyword3\": \"" + cvo.getKeyword3()+ "\",");
         sb.append("\"c_totpoint\":" + cvo.getC_totpoint());   
         sb.append("},");

      }
      sb.deleteCharAt(sb.length()-1);
      sb.append("]");
      System.out.println(sb.toString());
      return sb.toString();

   }

}