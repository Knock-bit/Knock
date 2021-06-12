package com.knock.model.command.admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.knock.model.command.Command;
import com.knock.model.dao.AdminKeywordDAO;
import com.knock.model.vo.KeywordVO;

public class AdminKeywordDel implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String json = request.getParameter("jsonData");
		String message = "";
		KeywordVO kvo =null;
		if (json != null) {
			try {
				System.out.println("json : " + json);
				// JSON OBJECT
				JSONObject jsonObject = new JSONObject();
				// JSON PARSER
				JSONParser jsonParser = new JSONParser();
				// ARRAY 형식 JSON PARSER
				JSONArray dataArray = (JSONArray) jsonParser.parse(json);
				// 파싱된 데이터 JSONOBJECT 타입 저장
				jsonObject = (JSONObject) dataArray.get(0);
				// get(key)값으로 탐색
				for (int i = 0; i < dataArray.size(); i++) {
					// JSON으로 받은 k_content 데이터 가져온 후 String으로 형변환
					jsonObject = (JSONObject) dataArray.get(i);
					String k_content = (String) jsonObject.get("data");
					kvo = AdminKeywordDAO.getKeywordOne(k_content);
					int result = AdminKeywordDAO.keywordDel(kvo);
					System.out.println("삭제결과 : " + result);
					if (result == 0) {
						message = "삭제실패";
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("message", message);
		return "admin/index.jsp";
	}
}
