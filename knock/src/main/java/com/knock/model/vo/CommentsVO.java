package com.knock.model.vo;

import oracle.sql.TIMESTAMP;

public class CommentsVO {
	
	private int comment_idx, board_idx, user_idx;
	private String com_content;
	private TIMESTAMP writetime;
	
	public CommentsVO() {}
	
	public CommentsVO(int comment_idx, int board_idx, int user_idx, String com_content, TIMESTAMP writetime) {
		super();
		this.comment_idx = comment_idx;
		this.board_idx = board_idx;
		this.user_idx = user_idx;
		this.com_content = com_content;
		this.writetime = writetime;
	}
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public TIMESTAMP getWritetime() {
		return writetime;
	}
	public void setWritetime(TIMESTAMP writetime) {
		this.writetime = writetime;
	}
	@Override
	public String toString() {
		return "CommentsVO [comment_idx=" + comment_idx + ", board_idx=" + board_idx + ", user_idx=" + user_idx
				+ ", com_content=" + com_content + ", writetime=" + writetime + "]";
	}
	
}
