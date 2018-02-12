package com.my.yblog.init;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.my.yblog.javabeans.PostStatus;
import com.my.yblog.model.Post;
import com.my.yblog.service.PostService;

@Component
public class StartupWork implements ApplicationListener<ContextRefreshedEvent> {
	@Autowired
	PostService postService;
	
  @Override
  public void onApplicationEvent(final ContextRefreshedEvent event) {
    System.out.println("***Start***");
    try {
		makePostToArchive( );
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }

	public void makePostToArchive() throws ParseException {	
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		String todayDateS =  dateFormat.format(date);
		Date todayDateD = dateFormat.parse(todayDateS);
				
		List<Post> publishedPosts = postService.findPublishedPost();	
		for (Post post : publishedPosts) {
	        if (post.getPostDate().compareTo(todayDateD) <= 0) {
	        	post.setStatus(PostStatus.ARCHIVED.toString());
	            postService.savePost(post);
	        } 		
		}

		
		
	}
}