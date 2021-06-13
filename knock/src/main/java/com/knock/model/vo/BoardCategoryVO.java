package com.knock.model.vo;

public class BoardCategoryVO {
	private int b_category;
	private String b_category_name;
	
	public BoardCategoryVO() {}

	public BoardCategoryVO(int b_category, String b_category_name) {
		super();
		this.b_category = b_category;
		this.b_category_name = b_category_name;
	}

	public int getB_category() {
		return b_category;
	}

	public void setB_category(int b_category) {
		this.b_category = b_category;
	}

	public String getB_category_name() {
		return b_category_name;
	}

	public void setB_category_name(String b_category_name) {
		this.b_category_name = b_category_name;
	}

	@Override
	public String toString() {
		return "BoardCategoryVO [b_category=" + b_category + ", b_category_name=" + b_category_name + "]";
	}
}