<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../css/styles.css">


<c:if test="${empty sessionScope.USERSESSION.getSessionId()}">	
<%@ include file="login_redirect.jsp"%>
</c:if>

<div>

<c:set var="fmtReqDate">	
	<fmt:formatDate value="${post.postDate}" pattern="dd-MM-yyyy" />
</c:set>
<form action="${pageContext.request.contextPath}/admin/set/archive/date/post/${post.postId}">

	<h3><b>${post.title}</b></h3>
	<br>
	<h5>Status : ${post.status}</h5>
	<h5>Created By : ${post.userModel.userName}</h5>
	<h5>Date : ${fmtReqDate}</h5>	
	<br>
	<c:set value="${post.image}" var="img"></c:set>
	<img src="<%= request.getContextPath()%>/images/${img}" width="300px" height="200px">
	<br>
	${post.content}
	<br>
				<c:choose>
					<c:when test="${post.status == 'Topublish'}" >
						<a href="${pageContext.request.contextPath}/admin/draft/post/${post.postId}" class="btn btn-secondary">Draft</a>
						<a href="${pageContext.request.contextPath}/admin/approve/post/${post.postId}" class="btn btn-primary">Publish</a>
						<a href="${pageContext.request.contextPath}/admin/reject/post/${post.postId}" class="btn btn-danger">Reject</a>						
					</c:when>	
					<c:when test="${post.status == 'Published'}" >
						<a href="${pageContext.request.contextPath}/admin/archive/post/${post.postId}" class="btn btn-success">Archive</a>
						<div class="pull-right"> 
						<button type="submit" class="btn btn-success" >Set Archive Date</button>
						<input type="date" name="arcDate">
						</div>
					</c:when>						
				</c:choose>		
</form>

<a href="${pageContext.request.contextPath}/admin/view/post" >Back to post list</a>

</div>
