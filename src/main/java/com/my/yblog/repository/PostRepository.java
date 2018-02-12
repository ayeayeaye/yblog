package com.my.yblog.repository;


import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.my.yblog.model.Post;



public interface PostRepository extends JpaRepository<Post, String> {

	@Query("SELECT p FROM Post p WHERE p.postBy=:id")
	List<Post> findPostsByEditor(@Param("id") int loginUserId);

	@Query("SELECT p FROM Post p WHERE p.postId=:id")
	Post findAPostByPostId(@Param("id") int postId);

	@Query("SELECT p FROM Post p WHERE p.status='Published'")
	List<Post> findPublishedPost();



}
