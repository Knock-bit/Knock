package com.knock.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.knock.model.vo.BoardVO;
import com.knock.model.vo.CommentsVO;
import com.knock.model.vo.SearchVO;
import com.knock.model.vo.SubtitleVO;
import com.knock.mybatis.DBService;

public class BoardDAO {

	public static List<SubtitleVO> boardList2(){
		SqlSession ss = DBService.getFactory().openSession();
		List<SubtitleVO> list = ss.selectList("board.boardList2");
		ss.close();
		return list;
	}
	
	public static List<SubtitleVO> boardList1(){
		SqlSession ss = DBService.getFactory().openSession();
		List<SubtitleVO> list = ss.selectList("board.boardList1");
		ss.close();
		return list;
	}
	
	//자유게시판목록 가져오기
	public static List<SubtitleVO> getList2(int begin, int end) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		System.out.println("map: " + map);
		List<SubtitleVO> list = ss.selectList("board.list2", map);
		ss.close();
		return list;
	}
	
	//인증게시판목록 가져오기
	public static List<SubtitleVO> getList1(int begin, int end) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		List<SubtitleVO> list = ss.selectList("board.list1", map);
		ss.close();
		System.out.println("map : " + map);
		return list;
	}	
		
	//자유게시판 총갯수
	public static int getTotalCount2() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("board.totalCount2");
		ss.close();
		return totalCount;
	}
	
	//인증게시판 총갯수
	public static int getTotalCount1() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("board.totalCount1");
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
	
	//게시글 상세보기
	public static BoardVO selectOne(String board_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		BoardVO vo = ss.selectOne("board.one", board_idx);
		ss.close();
		return vo;
	}
	
	//조회수 증가
	public void updateHit(String b_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		ss.update("board.updateHit", b_idx);
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
	
	//게시판 댓글 목록
	public static List<CommentsVO> getCommentsList(String b_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CommentsVO> list = ss.selectList("board.commentsList", b_idx);
		ss.commit();
		return list;
	}
			
	//게시판 댓글 등록
	public static int insertComments(CommentsVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		int success = 0;
		success = ss.insert("board.insertComments", vo);
		ss.commit();
		return success;
	}		

}