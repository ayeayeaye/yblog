<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>
<head>
<style>
.sidenav {
	margin-top:70px;
    height: 100%;
    width: 120px;
    position: fixed;
    z-index: 1;
    left: 0;
    background-color: #B0F5E8;
    overflow-x: hidden;
    padding-top: 70px;
}
.sidenav a {
    padding: 6px 8px 6px 16px;
    text-decoration: none;
    font-size: 16px;
    display: block;
    margin-bottom: 20px;
}
.fa{
    font-size: 25px;
}
</style>
<script>
window.onload = function() {
		 	var currentUrl = document.getElementById("mycurrentUrl").innerHTML;
		    var links = document.getElementsByTagName("a");
		    for(var i=0;i<links.length;i++)
		    {
	        	 if(links[i].href  == currentUrl )
		        	{
		        		 links[i].style.background = "#E7EDEC";   
		        	}		        	            
		    } 	  
};
</script>
</head>


<body>
<c:if test="${sessionScope.USERSESSION.getSessionId() ne null}"> 

<!-- Get current url -->
<c:set value="${pageContext.request.requestURL}" var="currentPageUrl"></c:set>
<label id="mycurrentUrl" hidden="">${currentPageUrl}</label>

<div class="sidenav">	
 						<c:choose>
							<c:when test="${ sessionScope.USERSESSION.getUser().isAdmin() == true}">
								<div>
									<a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fa fa-home"></i><br>Home</a>
								</div>							
								<div>
									<a href="${pageContext.request.contextPath}/admin/view/editor"><i class="fa fa-users"></i><br>View Editors </a>
								</div>
								<div>
									<a href="${pageContext.request.contextPath}/admin/create/editor"><i class="fa fa-id-card-o"></i><br>Create Editor</a>
								</div>
								<div>
									<a href="${pageContext.request.contextPath}/admin/view/post"><i class="fa fa-newspaper-o"></i><br>View Posts</a>
								</div>
							</c:when>
							<c:when test="${ sessionScope.USERSESSION.getUser().isEditor() == true}">	
								<div>
									<a href="${pageContext.request.contextPath}/editor/dashboard"><i class="fa fa-home"></i><br>Home</a>
								</div>	
								<div>
									<a href="${pageContext.request.contextPath}/editor/create/post"><i class="fa fa-plus-circle"></i><br>Create Post</a>
								</div>
								<div>
									<a href="${pageContext.request.contextPath}/editor/preview/post"><i class="fa fa-newspaper-o"></i><br>Your Posts</a>
								</div>
								<div>
								</div>				
							</c:when>
						</c:choose>		
</div>


 </c:if> 
</body>
</html>
	
	