<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
<head>

</head>

<body>
 <div class="container">
	<form:form action="${pageContext.request.contextPath}/editor/edit/post/${post.postId}" method="post" enctype="multipart/form-data" >
	
		<div class="form-group">
		<table class="table table-bordered">
			<tr>			
				<td><b>Title</b></td>
				<td>
					<div class="input-group">
						<input value="${post.title}" name="EditedTitle" class="form-control"/>					
					</div>
				</td>
				
			</tr>	
			<tr>
				<td><b>New Image</b></td>
				<td>
					<div class="input-group">  						
  						<input type="file" name="EditedFile"  class="form-control" ></input>
  						<span class="input-group-addon" id="basic-addon1">
  							<a class="btn btn-link" data-toggle="modal" data-target="#myModal">Click to view Current Image</a>
  						</span>
					</div>
				</td>
			</tr>					
			<tr>
				<td><b>Content</b></td>
				<td>
					<div class="input-group">
				   		<div id="summernote">				   			
				   			${post.content}				   			
				   		</div>
				   </div>
				</td>
			</tr>	
			<tr >
				<td colspan="2">
					<button type="submit" value="Submit"  class="btn btn-primary" id="submitBtnId">Save</button>
					<a href="${pageContext.request.contextPath}/editor/preview/post" class="btn btn-secondary">Cancel</a>				
				</td>
			</tr>			
		</table>
		<textarea name="EditedContent" id="contentHideTA" hidden=""></textarea>
		</div>
	</form:form>


<!-- MODAL Start -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
         <!-- Header -->
        <div class="modal-header">
          <h5 class="modal-title">Current Image</h5>
          <span class="close btn btn-link" data-dismiss="modal" >&times;</span>
        </div>
               
        <!--body -->
        <div class="modal-body">
          	<c:set value="${post.image}" var="img"></c:set>
			<img src="<%= request.getContextPath()%>/images/${img}" >						 						
			<label>Image Name = <b>${post.image}</b></label>
        </div>
      
    </div>
   </div>
 </div>
<!-- MODAL End -->
</div>
		<script>
 	      $('#summernote').summernote({
	        tabsize: 2,
	        height: 300,
	        width : 1000
	      });
 	      $("#submitBtnId").click(function(){
 	    	 /* var plainText = $($("#summernote").summernote("code")).text(); */
 	    	  var text = $("#summernote").summernote("code");
 	    	  document.getElementById("contentHideTA").value = text;
 	    	});
	    </script>
</body>

</html>