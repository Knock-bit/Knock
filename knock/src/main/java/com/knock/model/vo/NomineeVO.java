package com.knock.model.vo;

import java.sql.Date;

public class NomineeVO {
	private int nominee_idx;
	private String goal;
	private String title;
	private String c_content;
	private int campaign_idx;
	private Date end_time;
	private Date start_time;
	private int collected_point; 
	private String status; 
	private String c_file;
	private String c_category;
	private int goal_point;
	private int proposal_idx;
	private int user_idx;
	
	public NomineeVO() {
		
	}
	
	public NomineeVO(String goal, String title, String c_content, int campaign_idx, Date end_time,
			Date start_time, int collected_point, String status, String c_file, String c_category, int goal_point,
			int proposal_idx, int user_idx) {
		
		this.goal = goal;
		this.title = title;
		this.c_content = c_content;
		this.campaign_idx = campaign_idx;
		this.end_time = end_time;
		this.start_time = start_time;
		this.collected_point = collected_point;
		this.status = status;
		this.c_file = c_file;
		this.c_category = c_category;
		this.goal_point = goal_point;
		this.proposal_idx = proposal_idx;
		this.user_idx = user_idx;
	}

	public NomineeVO(int nominee_idx, String goal, String title, String c_content, int campaign_idx,
			Date end_time, Date start_time, int collected_point, String status, String c_file, String c_category,
			int goal_point, int proposal_idx, int user_idx) {
		
		this.nominee_idx = nominee_idx;
		this.goal = goal;
		this.title = title;
		this.c_content = c_content;
		this.campaign_idx = campaign_idx;
		this.end_time = end_time;
		this.start_time = start_time;
		this.collected_point = collected_point;
		this.status = status;
		this.c_file = c_file;
		this.c_category = c_category;
		this.goal_point = goal_point;
		this.proposal_idx = proposal_idx;
		this.user_idx = user_idx;
	}
	public int getNominee_idx() {
		return nominee_idx;
	}
	public void setNominee_idx(int nominee_idx) {
		this.nominee_idx = nominee_idx;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getCampaign_idx() {
		return campaign_idx;
	}
	public void setCampaign_idx(int campaign_idx) {
		this.campaign_idx = campaign_idx;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public int getCollected_point() {
		return collected_point;
	}
	public void setCollected_point(int collected_point) {
		this.collected_point = collected_point;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getC_file() {
		return c_file;
	}
	public void setC_file(String c_file) {
		this.c_file = c_file;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public int getGoal_point() {
		return goal_point;
	}
	public void setGoal_point(int goal_point) {
		this.goal_point = goal_point;
	}
	public int getProposal_idx() {
		return proposal_idx;
	}
	public void setProposal_idx(int proposal_idx) {
		this.proposal_idx = proposal_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	
	
	
}