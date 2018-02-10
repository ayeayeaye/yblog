<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>

<c:if test="${not empty sessionScope.USERSESSION.getSessionId()}">

<h3>Admin dashboard</h3>
<br>
<ul>
	<li><a href="${pageContext.request.contextPath}/admin/view/editor">View Editor(Suspend, Active)</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/create/editor">Create Editor</a></li>
	<li><a href="${pageContext.request.contextPath}/admin/view/post">View Posts(Approve/Published, Reject, Archive)</a></li>
</ul>

</c:if>

<c:if test="${empty sessionScope.USERSESSION.getSessionId()}">
	
	<spring:url value="/login" var="url" htmlEscape="true"/>
 	<label>For accessing the blog, please .</label><a href="${url}"> Login!</a>
 	
</c:if>

</body>
</html>

