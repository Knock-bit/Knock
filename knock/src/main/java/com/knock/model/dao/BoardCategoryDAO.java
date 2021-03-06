package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.mybatis.DBService;
import com.knock.model.vo.BoardCategoryVO;

public class BoardCategoryDAO {
	
	public static List<BoardCategoryVO> list() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardCategoryVO> boardCategoryList = ss.selectList("board.boardCategoryList");
		ss.close();
		return boardCategoryList;
	}
}