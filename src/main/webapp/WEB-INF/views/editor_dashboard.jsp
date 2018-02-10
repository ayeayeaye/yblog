<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>

<c:if test="${not empty sessionScope.USERSESSION.getSessionId()}">

<h3>Editor dashboard</h3>
<br>
<ul>
	<li><a href="${pageContext.request.contextPath}/editor/create/post">Create Blog</a></li>
	<li><a href="${pageContext.request.contextPath}/editor/preview/post">View All Blog By <b>${sessionScope.USERSESSION.user.userName}</b> (Draft,Publish)</a></li>
</ul>

</c:if>

<c:if test="${empty sessionScope.USERSESSION.getSessionId()}">
	
	<spring:url value="/login" var="url" htmlEscape="true"/>
 	<label>For accessing the blog, please .</label><a href="${url}"> Login!</a>
 	
</c:if>


</body>
</html>