<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>

<title>Layout</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>

</head>
<body>
 
	<div class="container-fluid">
		<div>
<c:if test="${ sessionScope.USERSESSION.getSessionId() ne null}">


			<!-- Header -->
				<div class="row">
<!-- Check condition to show the header -->
<%--  					<table class="table">
						<c:choose>
							<c:when test="${ sessionScope.USERSESSION.getUser().isAdmin() == true}">
								<tr>
									<td>Signed as: <label>${sessionScope.USERSESSION.user.userName}</label></td>
									<td><a href="${pageContext.request.contextPath}/logout" >Logout</a></td>
								</tr>
							</c:when>
							<c:when test="${ sessionScope.USERSESSION.getUser().isEditor() == true">
				
									<tr>
										<td>Signed as: <label>${sessionScope.USERSESSION.user.userName}</label></td>
										<td><a href="${pageContext.request.contextPath}/logout" >Logout</a></td>
									</tr>
					
							</c:when>
						</c:choose>				
					</table>  --%>
					<table class="table">
						<tr>
							<td>Signed as: <label>${sessionScope.USERSESSION.user.userName}</label></td>
							<td><a href="${pageContext.request.contextPath}/logout" >Logout</a></td>
							</tr>		
					</table>
				</div>

</c:if>	
			<!-- Body -->
				<div class="row">	
						<spring:message code="${bodyTitle}" /><dec:body />
				</div>
			<!-- Footer -->
			 
					
		</div>
	</div>		


</body>
</html>
