package com.knock.model.vo;

import java.sql.Date;

public class MemberVO {
	private int user_idx;
	private String user_id;
	private String name;
	private String pwd;
	private String nickname;
	private String email;
	private String phone;
	private String total_point;
	private String used_point;
	private String birth;
	private int gender;
	private String address;
	private char knock_admin;
	private char knock_active;
	private Date last_login_date;
	private String user_img;

	public MemberVO() {
		super();
	}
	//로그인
	public MemberVO(String user_id, String pwd) {
		super();
		this.user_id = user_id;
		this.pwd = pwd;
	}
	//회원가입
	public MemberVO(int user_idx, String user_id, String name, String pwd, String nickname, String email, String phone,
			String birth, int gender, String address) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.name = name;
		this.pwd = pwd;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public char getKnock_admin() {
		return knock_admin;
	}

	public void setKnock_admin(char knock_admin) {
		this.knock_admin = knock_admin;
	}

	public char getKnock_active() {
		return knock_active;
	}

	public void setKnock_active(char knock_active) {
		this.knock_active = knock_active;
	}

	public Date getLast_login_date() {
		return last_login_date;
	}

	public void setLast_login_date(Date last_login_date) {
		this.last_login_date = last_login_date;
	}

	
	
	
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getTotal_point() {
		return total_point;
	}
	public void setTotal_point(String total_point) {
		this.total_point = total_point;
	}
	public String getUsed_point() {
		return used_point;
	}
	public void setUsed_point(String used_point) {
		this.used_point = used_point;
	}
	@Override
	public String toString() {
		return "MemberVO [user_idx=" + user_idx + ", user_id=" + user_id + ", name=" + name + ", pwd=" + pwd
				+ ", nickname=" + nickname + ", email=" + email + ", phone=" + phone + ", birth=" + birth + ", gender="
				+ gender + ", address=" + address + "]";
	}
	
	
}
