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
	String nickname;

	String keyword1;
	String keyword2;
	String keyword3;
	
	
	String c_category_name;
	
	public CampaignIngVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public CampaignIngVO(int campaign_idx, String title, String c_content, String goal, Date end_date, int base_point,
			int estimated_point, char status, String c_file, int c_category, int c_totpoint, int user_idx,
			String emblem, String nickname, String keyword1, String keyword2, String keyword3) {
		super();
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
		this.nickname = nickname;
		this.keyword1 = keyword1;
		this.keyword2 = keyword2;
		this.keyword3 = keyword3;
	}




	public CampaignIngVO(String title, String c_content, String goal, Date end_date, int base_point,
			int estimated_point, char status, String c_file, int c_category, int c_totpoint, int user_idx,
			String emblem, String c_category_name) {
		
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
		this.c_category_name = c_category_name;
	}


	public CampaignIngVO(int campaign_idx, String title, String c_content, String goal, Date end_date, int base_point,
			int estimated_point, char status, String c_file, int c_category, int c_totpoint, int user_idx,
			String emblem, String c_category_name) {
		
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
		this.c_category_name = c_category_name;

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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getKeyword1() {
		return keyword1;
	}


	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}


	public String getKeyword2() {
		return keyword2;
	}


	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}


	public String getKeyword3() {
		return keyword3;
	}


	public void setKeyword3(String keyword3) {
		this.keyword3 = keyword3;
	public String getC_category_name() {
		return c_category_name;
	}


	public void setC_category_name(String c_category_name) {
		this.c_category_name = c_category_name;

	}
	
	
	
	
}