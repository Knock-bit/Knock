package com.knock.model.vo;

import java.util.Date;

public class BoardVO {
	private int board_idx, user_idx, hit, views, b_category,
				campaign_idx, subtitle_idx;
	private String subject, b_content,b_file;
	private Date writedate;
	
	public BoardVO() {}

	public BoardVO(int board_idx, int user_idx, int hit, int views, int b_category, int campaign_idx, int subtitle_idx,
			String subject, String b_content, String b_file, Date writedate) {
		super();
		this.board_idx = board_idx;
		this.user_idx = user_idx;
		this.hit = hit;
		this.views = views;
		this.b_category = b_category;
		this.campaign_idx = campaign_idx;
		this.subtitle_idx = subtitle_idx;
		this.subject = subject;
		this.b_content = b_content;
		this.b_file = b_file;
		this.writedate = writedate;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public int getB_category() {
		return b_category;
	}

	public void setB_category(int b_category) {
		this.b_category = b_category;
	}

	public int getCampaign_idx() {
		return campaign_idx;
	}

	public void setCampaign_idx(int campaign_idx) {
		this.campaign_idx = campaign_idx;
	}

	public int getSubtitle_idx() {
		return subtitle_idx;
	}

	public void setSubtitle_idx(int subtitle_idx) {
		this.subtitle_idx = subtitle_idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_file() {
		return b_file;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	@Override
	public String toString() {
		return "BoardVO [board_idx=" + board_idx + ", user_idx=" + user_idx + ", hit=" + hit + ", views=" + views
				+ ", b_category=" + b_category + ", campaign_idx=" + campaign_idx + ", subtitle_idx=" + subtitle_idx
				+ ", subject=" + subject + ", b_content=" + b_content + ", b_file=" + b_file + ", writedate="
				+ writedate + "]";
	}
	
}
