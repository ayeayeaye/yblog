package com.my.yblog.controller;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.my.yblog.model.User;
import com.my.yblog.service.UserService;



@Controller
public class LoginController {

	@Autowired
	UserService uService;
	
	@RequestMapping(value = {"/","/login"}, method = RequestMethod.GET)
	public ModelAndView home( )
	{		
		return new ModelAndView("login", "user", new User());
		
	}

	@RequestMapping(value = "/invalidlogin", method = RequestMethod.GET)
	public String invalideLogin(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("invalidLoginMsg","Your username/password are empty or wrong.");
		return "login_invalid";
	}
	
	@RequestMapping(value = "/accessDenyLogin", method = RequestMethod.GET)
	public String accessDeniedLogin(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("invalidLoginMsg","Currently, your account cannot access the blog, Please contact to Admin!.");
		return "login_invalid";
	}
	
	@RequestMapping(value = "/authentiate", method = RequestMethod.POST)
	public ModelAndView authenticate(@ModelAttribute User user, HttpSession session, BindingResult result) 
	{
		String msg ="";
		
		if (result.hasErrors())
			return new ModelAndView("redirect:/invalidlogin");
		
		UserSession us = new UserSession();
		
		if (user.getUserName() != null && user.getPassword() != null) {
			
			try {
				
				User u = uService.authenticate(user.getUserName(), user.getPassword());
				us.setUser(u);
				// FOR SETTING SESSION ID
				us.setSessionId(session.getId());
				
				if(us.getUser().isAdmin()==true)
				{
					msg="redirect:/admin/dashboard";
				}
				else if(us.getUser().isEditor()==true )
				{
					if( us.getUser().getActive().equals("YES"))
					{
						msg = "redirect:/editor/preview/post";
					}
					else
					{
						msg="redirect:/accessDenyLogin";
					}
					
				}
	
			} catch (NullPointerException e) {
				
				return new ModelAndView("redirect:/invalidlogin");
			}
				
		} else {
			return new ModelAndView("redirect:/invalidlogin");
		}
		
		session.setAttribute("USERSESSION", us);
		
		return new ModelAndView(msg);
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/login";
		
	}
}
