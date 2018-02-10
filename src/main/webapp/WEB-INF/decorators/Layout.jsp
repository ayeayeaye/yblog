<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style type="text/css">
	.body{
	margin-top: 75px;
	margin-left: 78px;
	}
	</style>
	
</head>
<body>

<div class="container-fluid">

<div>
<!-- ======== Header ======== -->
<div class="row">
	<%@include file="Header.jsp"%>
</div>
<!-- ======== Body ======== -->	
		<div class="row">
			
			<div>
				<div class="col-md-1"><%@ include file="Menu.jsp"%></div>
			</div>
			
			<div class="col-md-11 body">
				<spring:message code="${bodyTitle}" />
				<dec:body />
			</div>
		</div>
</div>		
	
</div>
</body>
</html>
