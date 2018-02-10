<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
		
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>NO</th>
				<th>TITLE</th>
				<th>CONTENT</th>
				<th>IMAGE</th>
				<th>STATUS</th>
				<th>TOPUBLISH/<br>PUBLISHED DATE</th>
				<th>CHANGE STATUS</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${posts}" var="post" varStatus="counter">
			<tr>
				<td>${counter.count}</td>
				<td>${post.title}</td>
				<td>
					<c:set var="shortDesc" value="${fn:substring(post.content, 0, 200)}" />
					${shortDesc} 
					<c:if test="${ fn:length(shortDesc) > 199}">
						<a href="${pageContext.request.contextPath}/editor/detail/post/${post.postId}" class="btn btn-link"><b>. . . . . .</b></a>	
					</c:if>
				</td>
				<td>			
					<c:set value="${post.image}" var="img"></c:set>
					<img src="<%= request.getContextPath()%>/images/${img}" width="200px" height="150px">			
				</td>
				<td>${post.status}</td>
				<td>
					<c:set var="fmtReqDate">	
						<fmt:formatDate value="${post.postDate}" pattern="dd-MM-yyyy" />
					</c:set>
					${fmtReqDate}
				</td>
				<td>				
					<c:choose>
						<c:when test="${post.status == 'Draft'}">
							<a href="${pageContext.request.contextPath}/editor/publish/post/${post.postId}" class="btn btn-primary" >Publish</a>
						</c:when>											
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${post.status == 'Draft' or post.status == 'Topublish'}">
							<a href="${pageContext.request.contextPath}/editor/edit/post/${post.postId}" class="btn btn-link">Edit</a>
						</c:when>
					</c:choose>																															
				</td>
			</tr>			
			</c:forEach>			
		</tbody>
	</table>

</body>
</html>