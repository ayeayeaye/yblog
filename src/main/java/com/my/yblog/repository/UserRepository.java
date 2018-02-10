package com.my.yblog.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.my.yblog.model.User;


public interface UserRepository extends JpaRepository<User, String> {

	@Query("SELECT u FROM User u WHERE u.userName=:un AND u.password=:pwd")
	User authenticate(@Param("un") String userName, @Param("pwd") String password);

	@Query("SELECT u FROM User u WHERE u.isEditor = '001'")
	ArrayList<User> findAllEditors();

	@Query("SELECT u FROM User u WHERE u.userId=:uid")
	User findUserByuserid(@Param("uid") Integer userId);
	

}
