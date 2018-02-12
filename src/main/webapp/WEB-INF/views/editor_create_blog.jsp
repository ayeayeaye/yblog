<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


 <div>
	<form:form action="${pageContext.request.contextPath}/editor/create/post" commandName="newPost"  method="post" enctype="multipart/form-data" >
		<label style="color: red" >.${sizeErrorMsg}</label>
		<label style="color: red" >.${typeErrorMsg}</label>
	
		<div class="form-group">
		<table class="table table-bordered">
			<tr>
				
				<td><b>Title</b></td>
				<td>
					<div class="input-group">
					<form:input path="title" cssClass="form-control"/>
					</div>
				</td>
				
			</tr>	
			<tr>
				<td><b>Image</b></td>
				<td>
					<div class="input-group">
					<input type="file" name="file"  class="form-control" />
					</div>
				</td>
			</tr>	
			<tr>
				<td><b>Content</b></td>
				<td>
					<div class="input-group">
				   		<div id="summernote"></div>
				   		<form:hidden path="content" id="contentInput" />
				   </div>
				</td>
			</tr>	
			<tr >
				<td colspan="2"><button type="submit" value="Submit" id="a">SUBMIT</button></td>
			</tr>			
		</table>
		</div>
	</form:form>

</div>
		<script>
	      $('#summernote').summernote({
	        tabsize: 2,
	        height: 300,
	        width : 1000
	      });
	      
	      $("#a").click(function(){
	    	 /* var plainText = $($("#summernote").summernote("code")).text();  */
	    	   var text = $("#summernote").summernote("code");
	    	  $('#contentInput').val(text);
	    	});
	    </script>
