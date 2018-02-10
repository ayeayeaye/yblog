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
	</table>
</form>
<br/>

</div>

</body>
</html>