<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="css/styles.css">

<div class="container loginForm">

	<form:form action="${pageContext.request.contextPath}/authentiate" commandName="user" method="POST" cssClass="form">
		<div class="form-group">
			<label style="color: red;" >${invalidLoginMsg}</label>
			<table>
				<tr>
					<td><label>User Name</label></td>
				</tr>
				<tr>
					<td >
					<div class="input-group">
						<div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
						<form:input path="userName" cssClass="form-control" size="60" />
					</div>
					</td>			
				</tr>
				<tr>
					<td><br/><label>Password</label></td>
				</tr>				
				<tr>
					<td>
					<div class="input-group">
						<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
						<form:password path="password" cssClass="form-control" size="60"/>
					</div>
					<td>
				</tr>
				<tr>
					<td colspan="2"><br/><br/><button type="submit" Class="btn btn-default" >Login</button></td>
				</tr>
			</table>			
		</div>
	</form:form>
</div>
