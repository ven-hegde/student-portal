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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http 1.0
		response.setHeader("Expires", "0"); //Proxy
	%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<c:if test="${sessionScope.isloggedin}">
		<%
			UserBean loggedUser = (UserBean) session.getAttribute("user");
		%>

		<nav
			class="navbar navbar-narrow navbar-expand-lg navbar-light bg-light bg-uncc material-card material-card-2">
			<a class="navbar-brand" href="#"><img
				src="https://www.uncc.edu/sites/all/themes/uncctheme/assets/images/logo.png"
				width="80" class="d-inline-block align-center text-font text-header"
				alt=""> Student Portal</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="studentHome.jsp"><i class="fa fa-home"
							aria-hidden="true"></i><span class="header-menu">Home</span> </a></li>
					<li class="nav-item"><a class="nav-link" href="profile.jsp"><i
							class="fa fa-user" aria-hidden="true"></i><span
							class="header-menu">Profile</span></a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><i class="fa fa-tasks"
							aria-hidden="true"></i> <span class="header-menu">Actions</span>
					</a>
						<div class="dropdown-menu dropdown-font"
							aria-labelledby="navbarDropdown">
							<form action="StudentController" method="post">
								<input type="hidden" name="action" value="myCourses"> <input
									type="submit" class="dropdown-item dropdown-font pointer"
									value="My Courses">
							</form>
							<form action="StudentController" method="post">
								<input type="hidden" name="action" value="addCourse"> <input
									type="submit" class="dropdown-item dropdown-font pointer"
									value="Add Course">

							</form>
							<form action="StudentController" method="post">
								<input type="hidden" name="action" value="dropCourse"> <input
									type="submit" class="dropdown-item dropdown-font pointer"
									value="Drop Course">
							</form>
						</div></li>
				</ul>
				<form class="form-inline my-2 my-lg-0" action="LoginController"
					method="post">
					<div class="btn-group mr-100">
						<button
							class="btn btn-uncc btn-sm"
							type="button" data-toggle="tooltip" data-placement="bottom" title="Click for more options">
							<span class="header-menu"> <c:if test="${user.proPic}">
									<img class="avtarSmall"
										src="getProPic.jsp?id=<%=loggedUser.getUserId()%>" />
								</c:if> <c:if test="${!user.proPic}">
									<img class="avtarSmall"
										src="img/missing-image-avatar.png"/>
								</c:if> <%=loggedUser.getFullName()%></span>
						</button>
						<button type="button"
							class="btn btn-sm btn-uncc dropdown-toggle dropdown-toggle-split"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<div class="dropdown-menu">
							<p class="dropdown-item">
								<c:out value="${user.email}"></c:out>
							</p>
							<p class="dropdown-item">
								<c:out value="${user.role}"></c:out>
							</p>
							<div class="dropdown-divider"></div>
							<input type="hidden" name="action" value="logout" />
							<button type="submit"
								class="dropdown-item btn-uncc-secondary pointer material-card material-card-2">
								<i class="fa fa-sign-out" aria-hidden="true"></i>Logout
							</button>
						</div>
					</div>
				</form>
			</div>
		</nav>
	</c:if>
</body>
</html>