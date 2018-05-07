<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home | Student</title>
<link rel="stylesheet" href="/style/style.css">
<c:import url="/header.jsp" />

</head>
<body class="content-container">
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http 1.0
		response.setHeader("Expires", "0"); //http 1.0
	%>

	<!-- Profile Details -->
	<div class="row mt-5 mr-1 ml-1">
		<div class="col-sm-6">
			<div class="card material-card material-card-2">
				<h5 class="card-header">Profile Details</h5>
				<div class="card-body">
					<p class="card-text">Clicking the My Profile button will
						navigate you to your profile page. You can see your personal
						details.</p>
					<div class="row">
						<div class="col-5">
							<a href="profile.jsp"
								class="btn btn-uncc btn-sm btn-block mt-4 mb-2 material-card material-card-2"><i
								class="fa fa-user" aria-hidden="true"></i>My Profile</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ADD/DELETE Student -->
		<div class="col-sm-6">
			<div class="card material-card material-card-2">
				<h5 class="card-header">Registered Courses</h5>
				<div class="card-body">
					<form action="StudentController" method="post">
						<p class="card-text">Clicking My Courses button will navigate
							to see the registered courses. Select the term of courses.</p>
						<div class="row">
							<div class="col-5">
								<input type="hidden" name="action" value="myCourses"> <button
									type="submit"
									class="btn btn-uncc btn-sm mt-4 btn-block mb-2 material-card material-card-2"
									><i class="fa fa-th-list" aria-hidden="true"></i>My Courses </button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ADD/DELETE Courses -->
	<div class="row mt-5 mr-1 ml-1">
		<div class="col-sm-6">
			<div class="card material-card material-card-2">
				<h5 class="card-header">Add Courses</h5>
				<div class="card-body">
					<form action="StudentController" method="post">
						<p class="card-text">Clicking Add Course button will navigate
							to add course tool allows you to add or drop the course for
							specific term.</p>
						<div class="row">
							<div class="col-5">
								<input type="hidden" name="action" value="addCourse"> <button
									type="submit"
									class="btn btn-uncc btn-sm mt-4 btn-block mb-2 material-card material-card-2"
									><i class="fa fa-plus-square" aria-hidden="true"></i>Add Course</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="card material-card material-card-2">
				<h5 class="card-header">Drop Courses</h5>
				<div class="card-body">
					<form action="StudentController" method="post">
						<p class="card-text">Clicking Drop Course button will navigate
							to drop course tool allows you to drop the course for specific
							term.</p>
						<div class="row">
							<div class="col-5">
								<input type="hidden" name="action" value="dropCourse"> <button
									type="submit"
									class="btn btn-uncc btn-sm mt-4 btn-block mb-2 material-card material-card-2"
									><i class="fa fa-minus-square" aria-hidden="true"></i>Drop Course</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

<c:import url="/footer.jsp" />
</html>