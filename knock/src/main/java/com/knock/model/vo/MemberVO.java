package com.knock.model.vo;

import java.sql.Date;

public class MemberVO {
	private int user_idx;
	private String user_id;
	private String name;
	private String pwd;
	private String nickname;
	private String email;
	private Date birth;
	private String knock_admin;
	private String knock_active;
	private Date last_login_date;

	public MemberVO() {
		super();
	}

	public MemberVO(int user_idx, String user_id, String name, String pwd, String nickname, String email, Date birth) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.name = name;
		this.pwd = pwd;
		this.nickname = nickname;
		this.email = email;
		this.birth = birth;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getKnock_admin() {
		return knock_admin;
	}

	public void setKnock_admin(String knock_admin) {
		this.knock_admin = knock_admin;
	}

	public String getKnock_active() {
		return knock_active;
	}

	public void setKnock_active(String knock_active) {
		this.knock_active = knock_active;
	}

	public Date getLast_login_date() {
		return last_login_date;
	}

	public void setLast_login_date(Date last_login_date) {
		this.last_login_date = last_login_date;
	}

	@Override
	public String toString() {
		return "MemberVO [user_idx=" + user_idx + ", user_id=" + user_id + ", name=" + name + ", pwd=" + pwd
				+ ", nickname=" + nickname + ", email=" + email + ", birth=" + birth + "]";
	}

}
