package com.my.yblog.service;

import java.util.ArrayList;
import java.util.List;

import com.my.yblog.model.Post;
import com.my.yblog.model.User;


public interface PostService {

	void savePost(Post post);

	List<Post> findPostsByEditor(int loginUserId);

	Post findAPostByPostId(Integer postId);

	List<Post> findAllPosts();



}
