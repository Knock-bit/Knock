package com.knock.model.vo;

public class NomUserVO {
	private int user_idx;
	private int nominee_idx;
	private int spent_point;
	
	public NomUserVO() {
	}
	
	public NomUserVO(int user_idx, int nominee_idx, int spent_point) {
		this.user_idx = user_idx;
		this.nominee_idx = nominee_idx;
		this.spent_point = spent_point;
	}
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getNominee_idx() {
		return nominee_idx;
	}
	public void setNominee_idx(int nominee_idx) {
		this.nominee_idx = nominee_idx;
	}
	public int getSpent_point() {
		return spent_point;
	}
	public void setSpent_point(int spent_point) {
		this.spent_point = spent_point;
	}
	
	

}
