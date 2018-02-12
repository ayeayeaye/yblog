<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<c:if test="${empty sessionScope.USERSESSION.getSessionId()}">	
<%@ include file="login_redirect.jsp"%>
</c:if>

	<form:form action="${pageContext.request.contextPath}/admin/create/editor" commandName="editorUser" method="POST">
	<div><label style="color: red;">${errmsg}.</label></div>
		<div class="form-group">
		
		    <div class="form-group row">
      			<label for="name" class="col-sm-2 col-form-label">Name</label>
      			<div class="col-sm-10">
       			 	<form:input path="userName" class="form-control" id="name" placeholder="Name"/>
      			</div>
    		</div>
    		
		    <div class="form-group row">
      			<label for="pass" class="col-sm-2 col-form-label">Password</label>
      			<div class="col-sm-10">
       			 	<form:input path="password" class="form-control" id="pass" placeholder="Password"/>
      			</div>
    		</div>  
   
   		    <div class="form-group row">
      			<label for="act" class="col-sm-2 col-form-label">Email</label>
      			<div class="col-sm-10">
       			 		<form:select path="active" class="form-control"  id="act">
						    <form:option value="YES" label="YES"></form:option>
						    <form:option value="NO" label="NO"></form:option>
					   </form:select>
      			</div>
    		</div>  
		<button type="submit" Class="btn btn-default" >Create</button>
		</div>
	</form:form>
	


