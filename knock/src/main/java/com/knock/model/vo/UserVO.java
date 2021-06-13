package com.knock.model.vo;

import java.util.Date;

public class UserVO {
	private int user_idx;
	private String user_id;
	private String name;
	private String pwd;
	private String nickname;
	private String email;
	private String phone;
	private Date birth;
	private int total_point;
	private String knock_admin;
	private String knock_active;
	private Date last_login_date;
	private String gender;
	private String address;
	private Date joindate;
	private String user_img;
	private int used_point;


	public UserVO() {

		super();


	}

	

	public UserVO(int user_idx, String user_id, String name, String pwd, String nickname, String email, String phone,

			Date birth, int total_point, String knock_admin, String knock_active, Date last_login_date, String gender,
			String address, Date joindate, String user_img, int used_point) {

		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.name = name;
		this.pwd = pwd;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.total_point = total_point;
		this.knock_admin = knock_admin;
		this.knock_active = knock_active;
		this.last_login_date = last_login_date;
		this.gender = gender;
		this.address = address;
		this.joindate = joindate;
		this.user_img = user_img;
		this.used_point = used_point;
	}



	public UserVO(int user_idx, String user_id, String name, String pwd, String nickname, String email, String phone,
			Date birth, String gender, String address, Date joindate, String user_img) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.name = name;
		this.pwd = pwd;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.birth = birth;
		this.address = address;
		this.gender = gender;
		this.joindate = joindate;
		this.user_img = user_img;
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



	public Date getBirth() {
		return birth;
	}



	public void setBirth(Date birth) {
		this.birth = birth;
	}



	public int getTotal_point() {
		return total_point;
	}



	public void setTotal_point(int total_point) {
		this.total_point = total_point;
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

	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public Date getJoindate() {
		return joindate;
	}



	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	

	public String getUser_img() {
		return user_img;
	}



	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	

	public int getUsed_point() {
		return used_point;
	}



	public void setUsed_point(int used_point) {
		this.used_point = used_point;
	}



	@Override
	public String toString() {
		return "UserVO [user_idx=" + user_idx + ", user_id=" + user_id + ", name=" + name + ", pwd=" + pwd
				+ ", nickname=" + nickname + ", email=" + email + ", phone=" + phone + ", birth=" + birth
				+ ", total_point=" + total_point + ", knock_admin=" + knock_admin + ", knock_active=" + knock_active
				+ ", last_login_date=" + last_login_date + ", joindate=" + joindate + ", address=" + address + ", gender=" + gender+", used_point=" + used_point+"]";
	}
	
	
	
	

}
