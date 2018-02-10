<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div>


<c:set var="fmtReqDate">	
	<fmt:formatDate value="${post.postDate}" pattern="dd-MM-yyyy" />
</c:set>
<form action="${pageContext.request.contextPath}/admin/publish/date/post/${post.postId}">
	<table>		
		<tr >
			<td rowspan="5">
				<c:set value="${post.image}" var="img"></c:set>
				<img src="<%= request.getContextPath()%>/images/${img}" width="300px" height="200px">
			</td>
			<td><h2><b>${post.title}</b></h2></td>
		</tr>
		<tr>
			<td><h5>Editor: <b>${post.userModel.userName}</b></h5></td>
		</tr>
		<tr>		
			<td>
			<h5>Status: <b>${post.status}</b></h5>
			</td>
		</tr>
		<tr>
			<td><h5>Date: <b>${fmtReqDate}</b></h5></td>
		</tr>
		<tr>
			<td>${post.content}</td>
		</tr>
		<tr>		
			<td colspan="2">
				<c:choose>
					<c:when test="${post.status == 'Topublish' or post.status == 'Archive'}" >
						<br>
						<a href="${pageContext.request.contextPath}/admin/approve/post/${post.postId}" class="btn btn-primary">Approve Now(Published)</a>
						<a href="${pageContext.request.contextPath}/admin/reject/post/${post.postId}" class="btn btn-danger">Reject</a>	
						<%-- <a href="${pageContext.request.contextPath}/admin/publish/date/post/${post.postId}" class="btn btn-warning">Set Publish Date</a> --%>	
						<br/><br/>
						<input type="date" name="topublishDate">
						<button type="submit" class="btn btn-warning">Set Publish Date</button>						
					</c:when>	
				</c:choose>				

			</td>
		</tr>
	</table>
</form>
<br/>

</div>

</body>
</html>