package com.knock.model.vo;

import java.sql.Date;

public class ProposalVO {
	
	private int proposal_idx;
	private String p_title;
	private String p_content; 
	private String goal; 
	private int goal_point; 
	private Date writedate; 
	private String p_file; 
	private int user_idx;
	private String p_keyword1;
	private String p_keyword2;
	private String p_keyword3;
	
	public ProposalVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public ProposalVO(String p_title, String p_content, String goal, int goal_point, String p_file, int user_idx,
			String p_keyword1, String p_keyword2, String p_keyword3) {
		super();
		this.p_title = p_title;
		this.p_content = p_content;
		this.goal = goal;
		this.goal_point = goal_point;
		this.p_file = p_file;
		this.user_idx = user_idx;
		this.p_keyword1 = p_keyword1;
		this.p_keyword2 = p_keyword2;
		this.p_keyword3 = p_keyword3;
	}




	public ProposalVO(int proposal_idx, String p_title, String p_content, String goal, int goal_point, Date writedate,
			String p_file, int user_idx, String p_keyword1, String p_keyword2, String p_keyword3) {
		super();
		this.proposal_idx = proposal_idx;
		this.p_title = p_title;
		this.p_content = p_content;
		this.goal = goal;
		this.goal_point = goal_point;
		this.writedate = writedate;
		this.p_file = p_file;
		this.user_idx = user_idx;
		this.p_keyword1 = p_keyword1;
		this.p_keyword2 = p_keyword2;
		this.p_keyword3 = p_keyword3;
	}
	public int getProposal_idx() {
		return proposal_idx;
	}
	public void setProposal_idx(int proposal_idx) {
		this.proposal_idx = proposal_idx;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
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
	public String getP_file() {
		return p_file;
	}
	public void setP_file(String p_file) {
		this.p_file = p_file;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getP_keyword1() {
		return p_keyword1;
	}
	public void setP_keyword1(String p_keyword1) {
		this.p_keyword1 = p_keyword1;
	}
	public String getP_keyword2() {
		return p_keyword2;
	}
	public void setP_keyword2(String p_keyword2) {
		this.p_keyword2 = p_keyword2;
	}
	public String getP_keyword3() {
		return p_keyword3;
	}
	public void setP_keyword3(String p_keyword3) {
		this.p_keyword3 = p_keyword3;
	}
	
	
	
	
	
	
}
