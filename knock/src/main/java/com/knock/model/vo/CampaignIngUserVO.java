package com.knock.model.vo;

public class CampaignIngUserVO {
	private int campaign_idx;
	private int user_idx;
	private char emblem_condition;
	
	
	public CampaignIngUserVO(int campaign_idx, int user_idx, char emblem_condition) {
		this.campaign_idx = campaign_idx;
		this.user_idx = user_idx;
		this.emblem_condition = emblem_condition;
	}
	
	
	public int getCampaign_idx() {
		return campaign_idx;
	}
	public void setCampaign_idx(int campaign_idx) {
		this.campaign_idx = campaign_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public char getEmblem_condition() {
		return emblem_condition;
	}
	public void setEmblem_condition(char emblem_condition) {
		this.emblem_condition = emblem_condition;
	}
	
	
}
