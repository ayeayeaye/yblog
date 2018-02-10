package com.my.yblog.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="post")
public class Post {

	@Id
	@Column(name="post_id")
	private int postId;
	@Column(name="title")
	private String title;
	@Column(name="image")
	private String image;
	@Column(name="content")
	private String content;
	@Column(name="status")
	private String status;
	@Column(name="postby")
	private int postBy;
	@Column(name="post_date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date postDate;
	
	@ManyToOne
	@JoinColumn(name="postby", insertable=false, updatable=false)
	private User userModel;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int postId, String title, String image, String content, String status, int postBy, Date postDate,
			User userModel) {
		super();
		this.postId = postId;
		this.title = title;
		this.image = image;
		this.content = content;
		this.status = status;
		this.postBy = postBy;
		this.postDate = postDate;
		this.userModel = userModel;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

	public int getPostBy() {
		return postBy;
	}


	public void setPostBy(int postBy) {
		this.postBy = postBy;
	}
	

	public User getUserModel() {
		return userModel;
	}


	public void setUserModel(User userModel) {
		this.userModel = userModel;
	}
	
	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	@Override
	public String toString() {
		return "Post [postId=" + postId + ", title=" + title + ", image=" + image + ", content=" + content + ", status="
				+ status + ", postBy=" + postBy + ", postDate=" + postDate + ", userModel=" + userModel + "]";
	}
	
}
