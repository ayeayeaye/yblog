package com.my.yblog.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {

	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public ModelAndView uploada()
	{	
		return new ModelAndView("fileupload");
	}

	@RequestMapping(value="/file/upload", method=RequestMethod.POST)
	public ModelAndView upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws IOException
	{	
		ModelAndView mView =  new ModelAndView( );	
		int maxSize = 5000000;
		
/*		String uploadPath = request.getServletContext().getRealPath("/images");
		System.out.println(request.getServletContext());
		System.out.println("File save "+uploadPath);*/
		
/*		System.out.println(request.getContextPath());
		System.out.println(request.getServletPath());
		System.out.println(request.getPathInfo());
		System.out.println(request.getRealPath(""));*/
		
		if(file.getSize() <= 0)
		{
			mView.setViewName("fileupload");
		}
		else if(file.getSize() > maxSize)			
		{
			mView.setViewName("fileupload");
		}
		else
		{	
			
			//String uploadPath = request.getServletContext().getRealPath("images");
			String uploadPath = request.getContextPath() + "/src/main/webapp/images/";
			Files.copy(file.getInputStream(), Paths.get(uploadPath, file.getOriginalFilename()));	
			mView.setViewName("success");
			
			mView.addObject("fileName", file.getOriginalFilename());
			mView.addObject("uploadPath", uploadPath);
		}

		return mView;
	}
}
