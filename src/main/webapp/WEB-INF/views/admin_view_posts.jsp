<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<table class="table table-hover">
		<thead>
			<tr class="bg-secondary">
				<th>NO</th>
				<th>EDITOR</th>
				<th>TITLE</th>
				<th>STATUS</th>
				<th>DETAILS</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${postList}" var="post" varStatus="counter">
			<tr>
				<td>${counter.count}</td>
				<td>${post.userModel.userName}</td>
				<td>${post.title}</td>
				<td>${post.status}</td>
				<td><a href="${pageContext.request.contextPath}/admin/detail/post/${post.postId}" class="btn btn-secondary" >Detail</a></td>				
			</tr>			
			</c:forEach>			
		</tbody>
	</table>


</body>
</html>