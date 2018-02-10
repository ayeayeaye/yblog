<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Editors List</title>
</head>
<body>

<div class="card-block">							
			<table class="table table-hover">
				<thead>
					<tr>
						<th>No</th>
						<th>Editor Id</th>
						<th>Name</th>
						<th>Active</th>
						<th>Activation</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${!empty editorsUseList}">	
					<c:forEach var="editorsUser" items="${editorsUseList}" varStatus="counter">
						<tr>
							<td>${counter.count}</td>
							<td>E${editorsUser.userId}</td>
							<td>${editorsUser.userName}</td>
							<td>${editorsUser.active}</td>
							<td>
							
								<c:choose>								
									<c:when test="${editorsUser.active == 'YES'}">
										<a href="${pageContext.request.contextPath}/admin/suspend/editor/${editorsUser.userId}" class="btn btn-danger">Suspend</a>
									</c:when>
									<c:when test="${editorsUser.active == 'NO'}">
										<a href="${pageContext.request.contextPath}/admin/activate/editor/${editorsUser.userId}" class="btn btn-primary">Activate</a>
									</c:when>
								</c:choose>						
								
							</td>
						</tr>
					</c:forEach>
				</c:if>						
				</tbody>
			</table>
				
			<c:if test="${empty editorsUseList}">
				There are no editors.
			</c:if>	
</div>


</body>
</html>