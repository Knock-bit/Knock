package com.knock.model.vo;

public class KeywordVO {
	private int keyword_idx;
	private String k_content;
	private int count;
	
	public KeywordVO(int keyword_idx, String k_content, int count) {
		super();
		this.keyword_idx = keyword_idx;
		this.k_content = k_content;
		this.count = count;
	}
	
	public int getKeyword_idx() {
		return keyword_idx;
	}
	public void setKeyword_idx(int keyword_idx) {
		this.keyword_idx = keyword_idx;
	}
	public String getK_content() {
		return k_content;
	}
	public void setK_content(String k_content) {
		this.k_content = k_content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "KeywordVO [keyword_idx=" + keyword_idx + ", k_content=" + k_content + ", count=" + count + "]";
	}
	
	
}
