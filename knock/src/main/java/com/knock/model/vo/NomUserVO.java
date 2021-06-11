package com.knock.model.vo;

public class NomUserVO {
	private int user_idx;
//	private int nominee_idx;
	private int campaign_idx;
	private int spent_point;
	
	public NomUserVO() {
	}
	
	public NomUserVO(int user_idx, int campaign_idx, int spent_point) {
		this.campaign_idx = campaign_idx;
		this.spent_point = spent_point;
	}
	
	public NomUserVO(int campaign_idx, int user_idx) {
		this.campaign_idx = campaign_idx;
		this.user_idx = user_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getCampaign_idx() {
		return campaign_idx;
	}
	public void setCampaign_idx(int campaign_idx) {
		this.campaign_idx = campaign_idx;
	}
	public int getSpent_point() {
		return spent_point;
	}
	public void setSpent_point(int spent_point) {
		this.spent_point = spent_point;
	}
	
	

}
