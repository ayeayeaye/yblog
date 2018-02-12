package com.my.yblog.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.yblog.javabeans.PostStatus;
import com.my.yblog.model.Post;
import com.my.yblog.model.User;
import com.my.yblog.service.PostService;
import com.my.yblog.service.UserService;


@Controller
@RequestMapping(value="/admin")
public class AdminPostController {

	@Autowired
	UserService userService;
	@Autowired
	PostService postService;
	
	@RequestMapping(value="/dashboard")
	public ModelAndView editorDashboard()
	{
		ModelAndView moView = new ModelAndView("admin_dashboard");
		List<Post> postList = postService.findAllPosts();
		/*1*/
		int d=0; int tp=0; int p=0; int r=0; int ar=0; 
		for (Post post : postList) {
			if(post.getStatus().equals(PostStatus.DRAFT.toString())){
				d++;
			}else if(post.getStatus().equals(PostStatus.TOPUBLISH.toString())){
				tp++;
			}else if(post.getStatus().equals(PostStatus.PUBLISHED.toString())){
				p++;
			}else if(post.getStatus().equals(PostStatus.REJECT.toString())){
				r++;
			}else if(post.getStatus().equals(PostStatus.ARCHIVED.toString())){
				ar++;
			}			
		}
		moView.addObject("d", d);
		moView.addObject("tp", tp);
		moView.addObject("p", p);
		moView.addObject("r", r);
		moView.addObject("ar", ar);
		/*2*/
		List<Post> reversePostList  = new ArrayList<Post>();
		for (int i = postList.size()-1; i >=0 ; i--) {
			reversePostList.add(postList.get(i));			
		}
		moView.addObject("reversePostList", reversePostList);
		return moView;		
	}
	
	/*POST*/
	@RequestMapping(value="/view/post")
	public ModelAndView viewPost()
	{
		ModelAndView mView = new ModelAndView("admin_view_posts");
		List<Post> postList = postService.findAllPosts();
		mView.addObject("postList", postList);
		return mView;
	}
	
	
	@RequestMapping(value="/detail/post/{postId}")
	public ModelAndView detailPost(@PathVariable Integer postId,  HttpSession session)
	{
		ModelAndView mView = new ModelAndView("admin_detail_post");
		Post post = postService.findAPostByPostId(postId);
		mView.addObject("post", post);
		return mView;
	}
	
	@RequestMapping(value="/draft/post/{postId}")
	public String draftPost(@PathVariable Integer postId,  HttpSession session)
	{
		Post post = postService.findAPostByPostId(postId);
		post.setStatus(PostStatus.DRAFT.toString());
		post.setPostDate(getitngTodayDate());
		postService.savePost(post);
		return "redirect:/admin/view/post";
	}	
	@RequestMapping(value="/approve/post/{postId}")
	public String approvePost(@PathVariable Integer postId,  HttpSession session)
	{
		Post post = postService.findAPostByPostId(postId);
		post.setStatus(PostStatus.PUBLISHED.toString());
		post.setPostDate(getitngTodayDate());
		postService.savePost(post);
		return "redirect:/admin/view/post";
	}
	
	@RequestMapping(value="/reject/post/{postId}")
	public String rejectPost(@PathVariable Integer postId,  HttpSession session)
	{
		Post post = postService.findAPostByPostId(postId);
		post.setStatus(PostStatus.REJECT.toString());
		postService.savePost(post);
		return "redirect:/admin/view/post";
	}
	@RequestMapping(value="/archive/post/{postId}")
	public String archivePost(@PathVariable Integer postId,  HttpSession session)
	{
		Post post = postService.findAPostByPostId(postId);
		post.setStatus(PostStatus.ARCHIVED.toString());
		postService.savePost(post);
		return "redirect:/admin/view/post";
	}

	@InitBinder
	public void intDate(WebDataBinder dataBinder){
	    dataBinder.addCustomFormatter(new DateFormatter("yyyy-MM-dd"));
	}
	
	@RequestMapping(value="/set/archive/date/post/{postId}")
	public String setPublishDatePostP(@PathVariable Integer postId, HttpSession session,HttpServletRequest request,
			@RequestParam("arcDate") Date arcDate) throws ParseException
	{
/*		String stDate = request.getQueryString();
		String[] splitSt = stDate.split("=");
		Date topublishDate = convertStringToDate(splitSt[1]);*/
		/*Save Post*/
		Post post = postService.findAPostByPostId(postId);
		post.setPostDate(arcDate);
		postService.savePost(post);		
		return "redirect:/admin/view/post";
	}
	
	/*METHOD*/
	public Date convertStringToDate(String stDate) throws ParseException
	{  
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatter.parse(stDate);
	    System.out.println("yin"+date);
		return date;
	}
	public Date getitngTodayDate()
	{
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date date = new Date();
		String todayDateS =  dateFormat.format(date);
		Date todayDateD = null;
		try {
			todayDateD = dateFormat.parse(todayDateS);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return todayDateD;
	}
}
