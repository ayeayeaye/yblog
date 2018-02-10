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
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
public class AdminController {

	@Autowired
	UserService userService;
	@Autowired
	PostService postService;
	
	@RequestMapping(value="/dashboard")
	public ModelAndView editorDashboard()
	{
		ModelAndView moView = new ModelAndView("admin_dashboard");
		return moView;		
	}
	
	/*Editor*/
	@RequestMapping(value="/view/editor")
	public ModelAndView viewEditor()
	{
		ModelAndView mView = new ModelAndView("admin_view_editors");
		List<User> editorsUseList = userService.findAllEditors();
		mView.addObject("editorsUseList", editorsUseList);
		return mView;
	}

	@RequestMapping(value="/create/editor")
	public ModelAndView createEditor()
	{
		ModelAndView mView = new ModelAndView("admin_create_editor");
		mView.addObject("editorUser", new User());
		return mView;
	}
	
	@RequestMapping(value="/create/editor", method=RequestMethod.POST)
	public String creatdeEditor(@ModelAttribute ("editorUser") User editorUser )
	{
		editorUser.setEditor(true);
		userService.saveUser(editorUser);
		return "redirect:/admin/view/editor";		
	}
	
	@RequestMapping(value="/suspend/editor/{userId}")
	public String suspendEditor(@PathVariable Integer userId, HttpSession session)
	{
		User activateUser = userService.findUserByuserid(userId);
		activateUser.setActive("NO");
		userService.saveUser(activateUser);
		return "redirect:/admin/view/editor";
	}
	
	@RequestMapping(value="/activate/editor/{userId}")
	public String activateEditor(@PathVariable Integer userId, HttpSession session)
	{
		User activateUser = userService.findUserByuserid(userId);
		activateUser.setActive("YES");
		userService.saveUser(activateUser);
		return "redirect:/admin/view/editor";
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

	@RequestMapping(value="/publish/date/post/{postId}")
	public String setPublishDatePostP(@PathVariable Integer postId, HttpSession session,HttpServletRequest request) throws ParseException
	{
		ModelAndView mView = new ModelAndView("test");
		
		String stDate = request.getQueryString();
		String[] splitSt = stDate.split("=");
		Date topublishDate = convertStringToDate(splitSt[1]);
		/*Save Post*/
		Post post = postService.findAPostByPostId(postId);
		post.setStatus(PostStatus.ARCHIVE.toString());
		post.setPostDate(topublishDate);
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
