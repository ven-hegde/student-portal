<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
<link rel="stylesheet" href="/style/style.css">
<c:import url="/header.jsp" />

</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
response.setHeader("Pragma", "no-cache"); //http 1.0
response.setHeader("Expires", "0"); //http 1.0
%>
<div class="row justify-content-center">
<div class="col-6">
	<div class="card material-card material-card-2">
		<div class="card-header bg-uncc material-card material-card-2">
		<img
				src="https://www.uncc.edu/sites/all/themes/uncctheme/assets/images/logo.png"
				width="80" class="d-inline-block align-center text-font text-header"
				alt=""> Student Portal
		</div>
		<div class="card-body">
			<h5 class="card-title">Logged Out</h5>
			<p class="card-text">You have successfully logged out from the system.</p>
			<a href="http://localhost:8080/Student_Portal/" class="btn btn-uncc btn-sm material-card material-card-2">Go to Login</a>
		</div>
	</div>
</div>
</div>
</body>

</html>