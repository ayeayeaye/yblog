<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../css/styles.css">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<c:if test="${empty sessionScope.USERSESSION.getSessionId()}">	
<%@ include file="login_redirect.jsp"%>
</c:if>

<div>

<div class="row">
	<!-- 1 -->
	<div class="col-lg-9 col-ms-9">
		<c:forEach items="${posts}" var="post" varStatus="counter">
			<h3><b>${post.title}</b></h3>
			<br>
			<h5>Status : ${post.status}</h5>
			<h5>
			<c:set var="fmtReqDate">	
			<fmt:formatDate value="${post.postDate}" pattern="dd-MM-yyyy" />
			</c:set>
			Date : ${fmtReqDate}</h5>	
			<br>
			<c:set value="${post.image}" var="img"></c:set>
			<img src="<%= request.getContextPath()%>/images/${img}" width="300px" height="200px">
			<br>
			<!-- Continue Reading link -->
			<c:set value="${post.content}" var="postContent"></c:set>
			<c:set value="500" var="limitWord"></c:set>
			<c:choose>
				<c:when test="${fn:length(postContent) <= limitWord }">${postContent}</c:when>
				<c:otherwise>
					<c:set var = "shortContent" value = "${fn:substring(postContent, 0, limitWord)}" />${shortContent}
					<a href="${pageContext.request.contextPath}/editor/detail/post/${post.postId}" >Continue Reading . . .</a>
				</c:otherwise>
			</c:choose>	
			<br>
			<!-- Show Button	 -->
		 	<c:choose>
				<c:when test="${post.status == 'Topublish'}" >
					<a href="${pageContext.request.contextPath}/editor/draft/post/${post.postId}" class="btn btn-secondary col-lg-12">Draft</a>					
				</c:when>	
				<c:when test="${post.status == 'Draft'}" >
					<a href="${pageContext.request.contextPath}/editor/publish/post/${post.postId}" class="btn btn-primary col-lg-12">Publish</a>
				</c:when>						
			</c:choose>		
			<hr>
		</c:forEach>
	</div>
	<!-- 2 -->
	<div class="col-lg-3 col-ms-9" style="background-color: #F8F2F0;">
		<%@ include file="editor_right_menu.jsp"%>		
	</div>
</div>	




</div>
