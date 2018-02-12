package com.my.yblog.javabeans;

public enum PostStatus {
	DRAFT, TOPUBLISH, REJECT, PUBLISHED, ARCHIVED;
	
	public String toString() {
		return name().charAt(0) + name().substring(1).toLowerCase();
	}
}
