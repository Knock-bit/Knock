package com.knock.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.BoardVO;
import com.knock.model.vo.SearchVO;
import com.knock.mybatis.DBService;

public class BoardDAO {

	//목록 검색
	public static List<BoardVO> list() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("board.list");
		ss.close();
		return list;
	}	
		
	//게시글 총갯수
	public static int getTotalCount(String board_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("board.totalCount",board_idx);
		ss.close();
		return totalCount;
	}
	
	//게시판 글 등록
	public static int insertBoard(BoardVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		int success = 0;
		success = ss.insert("board.insertBoard", vo);
		ss.commit();
		ss.close();
		return success;
	}
	
	//게시글 페이징처리
	public static List<BoardVO> getList(int begin, int end, String board_idx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("board_idx", board_idx);
		List<BoardVO> list = ss.selectList("board.list", map);
		ss.close();
		return list;
	}
	
	//게시글 상세보기
	public static BoardVO selectOne(String board_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		BoardVO vo = ss.selectOne("board.one", board_idx);
		ss.close();
		return vo;
	}
	
	//조회수 증가
	public void updateHit(String board_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		ss.update("updateHit", board_idx);
		ss.commit();
		ss.close();
	}
	
	//게시글 수정하기
	public static int updateBoard(HashMap<String, String> map) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.update("board.updateBoard", map);
		ss.commit();
		ss.close();
		return result;
	}
	
	//게시글 삭제하기
	public void deleteBoard(String board_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		ss.delete("board.deleteBoard", board_idx);
		ss.commit();
		ss.close();

	}
	
	//글 제목으로 글 검색
		public static BoardVO SearchBoardSubject(String subject) {
			SqlSession ss = DBService.getFactory().openSession();
			BoardVO vo = ss.selectOne("SearchBoardSubject", subject);
			ss.close();
			return vo;
		}
	
	//조건 검색
	public static List<BoardVO> searchBoard(SearchVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("searchBoard", vo);
		ss.close();
		return list;
	}
}