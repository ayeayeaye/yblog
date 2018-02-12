<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<link rel="stylesheet" href="../css/styles.css">

<c:if test="${empty sessionScope.USERSESSION.getSessionId()}">	
<%@ include file="login_redirect.jsp"%>
</c:if>


<diV class="container">

<div class="col-lg-12">	
	<!-- 1 -->
	<div class="row col-lg-12">
			
			<div class="col-lg-2 dbone">
				<i class="fa fa-rss-square" style="color: gray;"></i>
				<b>${d} Draft Files.</b> 
			</div>
			<div class="col-lg-2 dbone">
				<i class="fa fa-rss-square" style="color: orange;"></i>
				<b>${tp} Draft Files.</b> 
			</div>
			<div class="col-lg-2 dbone">
				<i class="fa fa-rss-square" style="color: blue;"></i>
				<b>${p} Draft Files.</b> 
			</div>
			<div class="col-lg-2 dbone">
				<i class="fa fa-rss-square" style="color: red;"></i>
				<b>${r} Draft Files.</b> 
			</div>
			<div class="col-lg-2 dbone">
				<i class="fa fa-rss-square" style="color: green;"></i>
				<b>${ar} Draft Files.</b> 
			</div>	
			
	</diV>
	<br>
	<!-- 2 -->
	<c:set value="4" var="limitRow" ></c:set>
	<div class="row col-lg-12 dbtwo">
		<div class="card">
	  	<div class="card-header">
    		Last Update Posts
  		</div>
  		<div class="card-block">
		<table class="table table-bordered">
			<thead >
				<tr>
					<th>Editor</th>
					<th>Title</th>
					<th>Status</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
			
				<c:choose>
					<c:when test="${ fn:length(reversePostList) < limitRow}">
						<c:forEach items="${reversePostList}" var="post">
							<tr>
								<td>${post.userModel.userName}</td>
								<td>${post.title}</td>
								<td>${post.status}</td>
								<td>
									<c:set var="fmtReqDate">	
										<fmt:formatDate value="${post.postDate}" pattern="dd-MM-yyyy" />
									</c:set>
								${fmtReqDate}
								</td>
							</tr>
						</c:forEach>					
					</c:when>
					<c:otherwise>
							<c:forEach items="${reversePostList}" var="post" begin="0" end="${limitRow}">
							<tr>
								<td>${post.userModel.userName}</td>
								<td>${post.title}</td>
								<td>${post.status}</td>
								<td>
									<c:set var="fmtReqDate">	
										<fmt:formatDate value="${post.postDate}" pattern="dd-MM-yyyy" />
									</c:set>
								${fmtReqDate}
								</td>
							</tr>
						</c:forEach>				
	 			</c:otherwise>			
				</c:choose>
			</tbody>
		</table>	
		<div><a href="${pageContext.request.contextPath}/admin/view/post" class="btn btn-info">View All</a></diV>
		</div>
	</diV>
</div>
</div>
</div>




