package com.my.yblog.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.my.yblog.model.Post;
import com.my.yblog.model.User;
import com.my.yblog.repository.PostRepository;
import com.my.yblog.repository.UserRepository;


@Service
public class PostServiceImp implements PostService {

	@Resource
	private PostRepository postRepository;

	@Override
	public void savePost(Post post) {
		postRepository.saveAndFlush(post);
	}

	@Override
	public List<Post> findPostsByEditor(int loginUserId) {
		List<Post> posts = postRepository.findPostsByEditor(loginUserId);
		return posts;
	}

	@Override
	public Post findAPostByPostId(Integer postId) {
		Post post = postRepository.findAPostByPostId(postId);
		return post;
	}

	@Override
	public List<Post> findAllPosts() {		
		List<Post> postList = postRepository.findAll();
		return postList;
	}

	@Override
	public List<Post> findPublishedPost() {
		List<Post> postList = postRepository.findPublishedPost();
				return postList;
	}



}
