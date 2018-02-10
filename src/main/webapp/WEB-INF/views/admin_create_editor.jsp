<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



	<form:form action="${pageContext.request.contextPath}/admin/create/editor" commandName="editorUser" method="POST">
		<div class="form-group">
			<label></label>
			<table>
				<tr>
					<td><b>Editor Name </b></td>
				</tr>
				<tr>
					<td >
						<form:input path="userName"  />
					</td>				
				</tr>
				<tr>
					<td><br/><b>Password</b></td>
				</tr>				
				<tr>
					<td>
						<form:input path="password"/>
					<td>
				</tr>
				<tr>
					<td><br/><b>Activation</b></td>
				</tr>
				<tr>
					<td>			   
						<form:select path="active">
						    <form:option value="YES" label="YES"></form:option>
						    <form:option value="NO" label="NO"></form:option>
					   </form:select>
					<td>
				</tr>
				<tr>
					<td colspan="2"><br/><br/><button type="submit" Class="btn btn-default" >Create</button></td>
				</tr>
			</table>
		</div>
	</form:form>
	


