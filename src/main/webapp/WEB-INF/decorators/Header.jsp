<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<style type="text/css">
.header
{
	height: 70px;
	width : 100%;
    position: fixed;
    z-index: 1;
    left: 0;
    overflow-x: hidden;
    background-color: #B0F5E8;
}
</style>
</head>

<body>	
<div class="header">	

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <h3>YBlog</h3>
    </div>
    <ul class="nav navbar-nav navbar-right">
    	 <c:if test="${sessionScope.USERSESSION.getSessionId() ne null  and sessionScope.USERSESSION.getUser().getActive() != 'NO'}"> 
    	 	<li><a href="#"><i class="fa fa-user"></i> ${sessionScope.USERSESSION.user.userName}</a></li>
    	 	<li><a href="${pageContext.request.contextPath}/logout" ><i class="fa fa-sign-out"></i>Logout</a></li>
    	 </c:if>		
    </ul>
  </div>
</nav>
</div>	
</body>
</html>