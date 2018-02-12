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


	<h3><b>${post.title}</b></h3>
	<br>
	<h5>Status : ${post.status}</h5>
	<h5>Date : ${fmtReqDate}</h5>	
	<br>
	<c:set value="${post.image}" var="img"></c:set>
	<img src="<%= request.getContextPath()%>/images/${img}" width="300px" height="200px">
	<br>
	${post.content}
	<br>
		
 	<c:choose>
		<c:when test="${post.status == 'Topublish'}" >
			<a href="${pageContext.request.contextPath}/editor/draft/post/${post.postId}" class="btn btn-secondary col-lg-12">Draft</a>					
		</c:when>	
		<c:when test="${post.status == 'Draft'}" >
			<a href="${pageContext.request.contextPath}/editor/publish/post/${post.postId}" class="btn btn-primary col-lg-12">Publish</a>
		</c:when>						
	</c:choose>		
    <br>
	<button type="submit" onclick="history.back()" class="btn btn-link">Back</button>


</div>
