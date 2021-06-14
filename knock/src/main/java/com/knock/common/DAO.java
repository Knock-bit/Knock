package com.knock.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.KeywordVO;
import com.knock.mybatis.DBService;

public class DAO {
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("ADMIN.keywordTotalCount");
		ss.close();
		return totalCount;
	}

	public static List<KeywordVO> getList(int begin, int end) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		
		map.put("end", end);
		System.out.println("DAO : " + map);
		System.out.println(map.getClass());
		List<KeywordVO> list = ss.selectList("ADMIN.keywordPageList", map);
		ss.close();
		return list;
	}
}
