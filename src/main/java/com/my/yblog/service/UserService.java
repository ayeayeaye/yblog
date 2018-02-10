package com.my.yblog.service;

import java.util.ArrayList;
import java.util.List;
import com.my.yblog.model.User;


public interface UserService {

	List<User> findAllUser();

	User authenticate(String userName, String password);

	List<User> findAllEditors();

	void saveUser(User editorUser);

	User findUserByuserid(Integer userId);

}
