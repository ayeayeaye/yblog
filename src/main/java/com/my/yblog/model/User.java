package com.my.yblog.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="user")
public class User {

	@Id
	@Column(name="user_id")
	private int userId;
	@Column(name="user_name")
	private String userName;
	@Column(name="password")
	private String password;;
	@Column(name="active")
	private String active;
	@Column(name = "is_admin")
	private boolean isAdmin;
	@Column(name = "is_editor")
	private boolean isEditor;

	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User(int userId, String userName, String password, String active, boolean isAdmin, boolean isEditor) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.active = active;
		this.isAdmin = isAdmin;
		this.isEditor = isEditor;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getActive() {
		return active;
	}


	public void setActive(String active) {
		this.active = active;
	}


	public boolean isAdmin() {
		return isAdmin;
	}


	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}


	public boolean isEditor() {
		return isEditor;
	}


	public void setEditor(boolean isEditor) {
		this.isEditor = isEditor;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", active=" + active
				+ ", isAdmin=" + isAdmin + ", isEditor=" + isEditor + "]";
	}

	

	
}
