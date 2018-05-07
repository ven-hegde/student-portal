<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<%@ page import="edu.uncc.student.portal.model.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="https://www.uncc.edu/sites/www.uncc.edu/files/favicon.ico"
	type="image/vnd.microsoft.icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style/style.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http 1.0
		response.setHeader("Expires", "0"); //http 1.0
	%>
	<c:if test="${user.role == 'admin' || user.role == 'Admin'}">
		<c:import url="/admin-header.jsp" />
	</c:if>
	<c:if test="${user.role == 'student' || user.role == 'Student'}">
		<c:import url="/student-header.jsp" />
	</c:if>
</body>
</html>