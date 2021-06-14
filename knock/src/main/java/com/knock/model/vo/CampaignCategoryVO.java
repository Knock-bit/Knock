package com.knock.model.vo;

public class CampaignCategoryVO {
	int c_category;
	String c_category_name;
	
	public CampaignCategoryVO(int c_category, String c_category_name) {
		super();
		this.c_category = c_category;
		this.c_category_name = c_category_name;
	}
	
	public int getC_category() {
		return c_category;
	}
	public void setC_category(int c_category) {
		this.c_category = c_category;
	}
	public String getC_category_name() {
		return c_category_name;
	}
	public void setC_category_name(String c_category_name) {
		this.c_category_name = c_category_name;
	}
	@Override
	public String toString() {
		return "CampaignCategoryVO [c_category=" + c_category + ", c_category_name=" + c_category_name + "]";
	}
	
	
	
}
