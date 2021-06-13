package com.knock.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.knock.mybatis.DBService;
import com.knock.model.vo.CommentsVO;

public class CommentsDAO {
	
	//게시판 댓글 목록
	public static List<CommentsVO> CommentsList(int comment_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CommentsVO> commentsList = ss.selectList("board.commentsList", comment_idx);
		ss.commit();
		return commentsList;
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
