<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../css/styles.css">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<div>
	<!-- 2 -->
	<div>
		<br>
				
		<ul class="list-group">
		 <li class="list-group-item list-group-item-success">Your <b> Draft </b>Post</li>		
		  <c:forEach items="${posts}" var="post" varStatus="counter">
		  	<c:if test="${post.status == 'Draft'}">
		  		<a href="${pageContext.request.contextPath}/editor/detail/post/${post.postId}" > >> ${post.title}</a>
		  	</c:if>
		  </c:forEach>  	 	
		 <br>
		 		 
		 <li class="list-group-item list-group-item-warning">Your <b> Topublish </b>Post</li>
		  <c:forEach items="${posts}" var="post" varStatus="counter">
		  	<c:if test="${post.status == 'Topublish'}">
		  		<a href="${pageContext.request.contextPath}/editor/detail/post/${post.postId}" > >> ${post.title}</a>
		  	</c:if>
		  </c:forEach>  			 
		 <br>
		 
		 <li class="list-group-item list-group-item-primary">Your <b> Published </b>Post</li>
		  <c:forEach items="${posts}" var="post" varStatus="counter">
		  	<c:if test="${post.status == 'Published'}">
		  		<a href="${pageContext.request.contextPath}/editor/detail/post/${post.postId}" > >> ${post.title}</a>
		  	</c:if>
		  </c:forEach>  			 
		 <br>
		 
		 <li class="list-group-item list-group-item-success">Your <b></b> Archived </li>
		  <c:forEach items="${posts}" var="post" varStatus="counter">
		  	<c:if test="${post.status == 'Archived'}">
		  		<a href="${pageContext.request.contextPath}/editor/detail/post/${post.postId}" > >> ${post.title}</a>
		  	</c:if>
		  </c:forEach>  			 
		 <br>
		 
		 <li class="list-group-item list-group-item-danger">Your <b></b> Reject </li>
		  <c:forEach items="${posts}" var="post" varStatus="counter">
		  	<c:if test="${post.status == 'Reject'}">
		  		<a href="${pageContext.request.contextPath}/editor/detail/post/${post.postId}" > >> ${post.title}</a>
		  	</c:if>
		  </c:forEach>  			 
		 <br>
		
		</ul>	
	</div>
	
</div>	



