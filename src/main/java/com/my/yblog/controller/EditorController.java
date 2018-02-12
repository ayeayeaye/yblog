package com.my.yblog.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Paths;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
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



@Controller
@RequestMapping(value="/editor")
public class EditorController {

	@Autowired
	PostService postService;
	
	@RequestMapping(value="/dashboard")
	public ModelAndView editorDashboard()
	{
		ModelAndView moView = new ModelAndView("editor_dashboard");
		return moView;		
	}
	
	
	@RequestMapping(value="/create/post")
	public ModelAndView createBlog()
	{
		ModelAndView moView = new ModelAndView("editor_create_blog", "newPost", new Post());
		return moView;		
	}
	
	@RequestMapping(value="/create/post",method=RequestMethod.POST)
	public ModelAndView createdBlog(@ModelAttribute("newPost") Post post, @RequestParam("file") MultipartFile file, 
			BindingResult result, HttpServletRequest request, HttpSession session) throws IOException
	{
		ModelAndView mView = new ModelAndView( );
				
		/*Limit Image Size*/
		int maxSize = 5000000;		
		if(file.getSize() <= 0)
		{
			mView.setViewName("editor_create_blog");
			mView.addObject("sizeErrorMsg","Please choose the file!");
		}
		else if(file.getSize() >= maxSize)			
		{
			mView.setViewName("editor_create_blog");
			mView.addObject("sizeErrorMsg","Maximum upload size is 5MB!");
		}
		else if (file.getSize() > 0 && file.getSize() < maxSize)
		{		
			/*Limit File Type*/
			String type = file.getContentType();
			String fileType="."+type.substring(type.lastIndexOf("/")+1);
			System.out.println("fileType"+fileType);
				if(fileType.equals(".jpg") ||fileType.equals(".jpeg") || fileType.equals(".png") || fileType.equals(".gif"))
				{
					try
					{
					doUpload(file, request);
					mView.setViewName("success");
					/*Save Post*/
					post.setImage(file.getOriginalFilename());
					post.setStatus(PostStatus.DRAFT.toString());	
					UserSession us = (UserSession) session.getAttribute("USERSESSION");
					post.setPostBy(us.getUser().getUserId());
					postService.savePost(post);
					}catch (NoSuchFileException e) {
						mView.setViewName("editor_create_blog");
						mView.addObject("typeErrorMsg","Please place the project under C: folder !");
					}catch (FileAlreadyExistsException e) {
						mView.setViewName("editor_create_blog");
						mView.addObject("typeErrorMsg","This file name is already existed !");
					}
				}
				else
				{
					mView.setViewName("editor_create_blog");
					mView.addObject("typeErrorMsg"," Only jpg, png, gif, file type allow!");
				}
				
			}

		return mView;		
	}
	
	@RequestMapping(value="/preview/post")
	public ModelAndView previewPost(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("editor_preview_post");
		
		UserSession us = (UserSession) session.getAttribute("USERSESSION");
		int loginUserId =us.getUser().getUserId();
		
		List<Post> posts =postService.findPostsByEditor(loginUserId);
		moView.addObject("posts", posts);
		
		return moView;		
	}	
	
	@RequestMapping(value="/detail/post/{postId}")
	public ModelAndView detailPost(@PathVariable Integer postId,  HttpSession session)
	{
		ModelAndView mView = new ModelAndView("editor_detail_post");
		Post post = postService.findAPostByPostId(postId);
		mView.addObject("post", post);
		return mView;
	}	
	
	@RequestMapping(value="/publish/post/{postId}")
	public String publishPost(@PathVariable Integer postId, HttpSession session)
	{		
		Post post = postService.findAPostByPostId(postId);
		post.setStatus(PostStatus.TOPUBLISH.toString());
		postService.savePost(post);	
		return "redirect:/editor/preview/post";		
	}
	@RequestMapping(value="/draft/post/{postId}")
	public String draftPost(@PathVariable Integer postId, HttpSession session)
	{		
		Post post = postService.findAPostByPostId(postId);
		post.setStatus(PostStatus.DRAFT.toString());
		postService.savePost(post);	
		return "redirect:/editor/preview/post";		
	}
	
	@RequestMapping(value="/edit/post/{postId}")
	public ModelAndView editPost(@PathVariable Integer postId, HttpSession session)
	{
		ModelAndView moView = new ModelAndView("editor_edit_post");		
		Post post =postService.findAPostByPostId(postId);
		moView.addObject("post", post);
		return moView;		
	}
	
	@RequestMapping(value="/edit/post/{postId}" , method=RequestMethod.POST)
	public String editedPost(@PathVariable Integer postId, HttpSession session, HttpServletRequest request,
			 @RequestParam("EditedFile") MultipartFile newfile) throws IOException
	{	
		Post newEditedPost =  postService.findAPostByPostId(postId);
		String oldFileName = newEditedPost.getImage();
		newEditedPost.setTitle(request.getParameter("EditedTitle"));
		newEditedPost.setContent(request.getParameter("EditedContent"));
		/*User replace image => New*/
		if(!newfile.getName().isEmpty())
		{
			doUpload(newfile, request);
			newEditedPost.setImage(newfile.getName());
		}
		else
		{
			newEditedPost.setImage(oldFileName);
		}
		postService.savePost(newEditedPost);
		
		return "redirect:/editor/preview/post";		
	}
	
	@RequestMapping(value="/status/post")
	public ModelAndView statusPost(HttpSession session)
	{
		ModelAndView moView = new ModelAndView("editor_status_post");
		try{
			UserSession us = (UserSession) session.getAttribute("USERSESSION");
			int loginUserId =us.getUser().getUserId();
			
			List<Post> posts =postService.findPostsByEditor(loginUserId);
			moView.addObject("posts", posts);		
		}catch (Exception e) {
			 
		}
				
		return moView;		
	}
	/*METHOD*/
	public String doUpload(MultipartFile file, HttpServletRequest request) throws IOException
	{
		
		String uploadPath = request.getContextPath() + "/src/main/webapp/images/";
/*		String servletuploadPath = request.getServletContext().getRealPath("");
		System.out.println("1"+servletuploadPath);
		System.out.println("2"+uploadPath);		
		String workingDir = System.getProperty("user.dir");
		System.out.println("user.dir: " + workingDir);
		String rootDir = request.getSession().getServletContext().getRealPath("/");
		System.out.println("3"+rootDir);*/
		Files.copy(file.getInputStream(), Paths.get(uploadPath, file.getOriginalFilename()));

		return uploadPath;		
	}
}
