package com.knock.model.vo;

public class SearchVO {
	private String part, searchData;
	
	public SearchVO() {}

	public SearchVO(String part, String searchData) {
		super();
		this.part = part;
		this.searchData = searchData;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getSearchData() {
		return searchData;
	}

	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}

}
