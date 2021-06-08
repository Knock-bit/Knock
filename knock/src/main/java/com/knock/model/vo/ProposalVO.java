package com.knock.model.vo;

import java.sql.Date;

public class ProposalVO {
	private int proposal_idx;
	private String title;
	private String p_content; 
	private String goal; 
	private int goal_point; 
	private Date writedate; 
	private String c_file; 
	private int user_idx;
	
	public ProposalVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ProposalVO(String title, String p_content, String goal, int goal_point, String c_file, int user_idx) {
		this.title = title;
		this.p_content = p_content;
		this.goal = goal;
		this.goal_point = goal_point;
		this.c_file = c_file;
		this.user_idx = user_idx;
	}
	
	public int getProposal_idx() {
		return proposal_idx;
	}
	public void setProposal_idx(int proposal_idx) {
		this.proposal_idx = proposal_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public int getGoal_point() {
		return goal_point;
	}
	public void setGoal_point(int goal_point) {
		this.goal_point = goal_point;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getC_file() {
		return c_file;
	}
	public void setC_file(String c_file) {
		this.c_file = c_file;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	
	
	
	
	
}
