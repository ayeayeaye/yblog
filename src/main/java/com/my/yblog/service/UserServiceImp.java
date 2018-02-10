package com.my.yblog.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.my.yblog.model.User;
import com.my.yblog.repository.UserRepository;


@Service
public class UserServiceImp implements UserService {


	@Resource
	private UserRepository userRepository;


	@Override
	public User authenticate(String userName, String password) {
		// TODO Auto-generated method stub
		User u = userRepository.authenticate(userName, password);
		return u;
	}
	
	@Override
	public List<User> findAllUser() {
		return userRepository.findAll();
	}

	@Override
	public List<User> findAllEditors() {
		List<User> editorsUserList = userRepository.findAllEditors();
		return editorsUserList;
	}

	@Override
	public void saveUser(User editorUser) {
		// TODO Auto-generated method stub
		userRepository.saveAndFlush(editorUser);
	}

	@Override
	public User findUserByuserid(Integer userId) {
		User user = userRepository.findUserByuserid(userId);
		return user;
	}




}
