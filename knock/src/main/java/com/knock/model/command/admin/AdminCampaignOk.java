package com.knock.model.command.admin;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.command.Command;
import com.knock.model.dao.AdminCampaignDAO;
import com.knock.model.vo.CampaignIngVO;
import com.knock.mybatis.DBService;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

public class AdminCampaignOk implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/Users/hanjeongseol/git/Knock/knock/src/main/webapp/resources/assets/img";
		int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
		String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
		String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름

		// 실제로 파일 업로드하는 과정
		try {
			MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

			Enumeration files = multi.getFileNames();
			String str = (String) files.nextElement(); // 파일 이름을 받아와 string으로 저장

			file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
			originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴
			String oriPath = path + "/" + originalFile;

			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String goal = multi.getParameter("goal");
			// insert시 to_date사용
			String date = multi.getParameter("trip-start");
			String category = multi.getParameter("category");
			
			date = date.replace("-", "");
//			System.out.println("title : " + title);
//			System.out.println("content : " + content);
//			System.out.println("goal : " + goal);
//			System.out.println("date : " + date);
//			System.out.println("category : " + category);
//			System.out.println("oriPath: " + oriPath);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("title", title);
			map.put("content", content);
			map.put("goal", goal);
			map.put("date", date);
			map.put("category", category);
			map.put("path", oriPath);
			int result = AdminCampaignDAO.setCampaign(map);

		} catch (Exception e) {
			e.printStackTrace();
		}
//		페이지 다시 리로드 -> 리스트다시불러오기
		return "main.jsp";
	}

}
