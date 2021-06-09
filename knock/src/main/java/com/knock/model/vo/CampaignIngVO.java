package com.knock.model.vo;

import java.sql.Date;

public class CampaignIngVO {
	
	int campaign_idx;
	String title;
	String c_content; 
	String goal;
	Date end_date;
	int base_point;
	int estimated_point;
	char status;
	String c_file;
	int c_category;
	int c_totpoint;
	int user_idx;
	String emblem;
	
	public CampaignIngVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public CampaignIngVO(String title, String c_content, String goal, Date end_date, int base_point,
			int estimated_point, char status, String c_file, int c_category, int c_totpoint, int user_idx,
			String emblem) {
		
		this.title = title;
		this.c_content = c_content;
		this.goal = goal;
		this.end_date = end_date;
		this.base_point = base_point;
		this.estimated_point = estimated_point;
		this.status = status;
		this.c_file = c_file;
		this.c_category = c_category;
		this.c_totpoint = c_totpoint;
		this.user_idx = user_idx;
		this.emblem = emblem;
	}




	public CampaignIngVO(int campaign_idx, String title, String c_content, String goal, Date end_date, int base_point,
			int estimated_point, char status, String c_file, int c_category, int c_totpoint, int user_idx,
			String emblem) {
		
		this.campaign_idx = campaign_idx;
		this.title = title;
		this.c_content = c_content;
		this.goal = goal;
		this.end_date = end_date;
		this.base_point = base_point;
		this.estimated_point = estimated_point;
		this.status = status;
		this.c_file = c_file;
		this.c_category = c_category;
		this.c_totpoint = c_totpoint;
		this.user_idx = user_idx;
		this.emblem = emblem;
	}
	public int getCampaign_idx() {
		return campaign_idx;
	}
	public void setCampaign_idx(int campaign_idx) {
		this.campaign_idx = campaign_idx;
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
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getBase_point() {
		return base_point;
	}
	public void setBase_point(int base_point) {
		this.base_point = base_point;
	}
	public int getEstimated_point() {
		return estimated_point;
	}
	public void setEstimated_point(int estimated_point) {
		this.estimated_point = estimated_point;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public String getC_file() {
		return c_file;
	}
	public void setC_file(String c_file) {
		this.c_file = c_file;
	}
	public int getC_category() {
		return c_category;
	}
	public void setC_category(int c_category) {
		this.c_category = c_category;
	}
	public int getC_totpoint() {
		return c_totpoint;
	}
	public void setC_totpoint(int c_totpoint) {
		this.c_totpoint = c_totpoint;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getEmblem() {
		return emblem;
	}
	public void setEmblem(String emblem) {
		this.emblem = emblem;
	}
	
	
	
	
}