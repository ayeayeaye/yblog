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
public class AdminUserController {

	@Autowired
	UserService userService;
	@Autowired
	PostService postService;
	
	/*Editor*/
	@RequestMapping(value="/view/user")
	public ModelAndView viewEditor()
	{
		ModelAndView mView = new ModelAndView("admin_view_editors");
		List<User> userList = userService.findAllUser();
		mView.addObject("userList", userList);
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
	public ModelAndView creatdeEditor(@ModelAttribute ("editorUser") User editorUser )
	{
		ModelAndView mView = new ModelAndView("admin_create_editor");
		
		if(!editorUser.getUserName().isEmpty())
		{
			editorUser.setEditor(true);
			userService.saveUser(editorUser);
		}
		else
		{
			mView.addObject("errmsg","Please fill all required field!");
		}
		
		return 	mView;
	}
	
	@RequestMapping(value="/suspend/editor/{userId}")
	public String suspendEditor(@PathVariable Integer userId, HttpSession session)
	{
		User activateUser = userService.findUserByuserid(userId);
		activateUser.setActive("NO");
		userService.saveUser(activateUser);
		return "redirect:/admin/view/user";
	}
	
	@RequestMapping(value="/activate/editor/{userId}")
	public String activateEditor(@PathVariable Integer userId, HttpSession session)
	{
		User activateUser = userService.findUserByuserid(userId);
		activateUser.setActive("YES");
		userService.saveUser(activateUser);
		return "redirect:/admin/view/user";
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
