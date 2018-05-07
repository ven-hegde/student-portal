<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home | Admin</title>
<link rel="stylesheet" href="/style/style.css">
<c:import url="/header.jsp" />

</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
response.setHeader("Pragma", "no-cache"); //http 1.0
response.setHeader("Expires", "0"); //http 1.0
%>
	<!-- Profile Details -->
	<div class="row mt-5 ml-1 mr-1">
		<div class="col-sm-6">
			<div class="card material-card material-card-2">
				<h5 class="card-header">Profile Details</h5>
				<div class="card-body">
					<p class="card-text">Clicking the My Profile button will
						navigate you to your profile page. You can see your personal
						details.</p>
						<div class="row">
						<div class="col-5">
					<a href="profile.jsp" class="btn btn-uncc btn-sm btn-block mt-4 mb-2 material-card material-card-2"><i
								class="fa fa-user" aria-hidden="true"></i>My Profile</a>
					</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ADD/DELETE Student -->
		<div class="col-sm-6">
			<div class="card material-card material-card-2">
				<h5 class="card-header">Add/Delete Student</h5>
				<div class="card-body">
					<form action="AdminController" method="post">
						<p class="card-text">Clicking ADD/DELETE STUDENT button will
							navigate to add/delete student tool allows you to add or delete
							the students intto system.</p>
						<input type="hidden" name="action" value="addDeleteStudent">
						<div class="row">
						<div class="col-5">
						<button type="submit" class="btn btn-uncc btn-block mt-4 mb-2 btn-sm material-card material-card-2"
							><i class="fa fa-users" aria-hidden="true"></i>Add/Delete Student</button>
							</div>
							</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- ADD/DELETE Courses -->
	<div class="row mt-5 ml-1 mr-1">
		<div class="col-sm-6">
			<div class="card material-card material-card-2">
				<h5 class="card-header">Add/Delete Courses</h5>
				<div class="card-body">
					<form action="AdminController" method="post">
						<p class="card-text">Clicking ADD/DELETE COURSE button will
							navigate to add/delete course tool allows you to add or delete
							the courses into system.</p>
						<input type="hidden" name="action" value="getTerms">
						<div class="row">
						<div class="col-5">
						<button type="submit" class="btn btn-uncc btn-block mt-4 mb-2 btn-sm material-card material-card-2"
							> <i class="fa fa-book" aria-hidden="true"></i>Add/Delete Course</button>
							</div>
							</div>
							</form>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="card material-card material-card-2">
				<h5 class="card-header">Manage Terms</h5>
				<div class="card-body">
					<form action="AdminController" method="post">
						<p class="card-text">Clicking Manager Term button will
							navigate to manage terms tool which allows you to add or delete
							new terms/semester into system.</p>
						<input type="hidden" name="action" value="manageTerms">
						<div class="row">
						<div class="col-5">
						<button type="submit" class="btn btn-uncc btn-block mt-4 mb-2 btn-sm material-card material-card-2"
							> <i class="fa fa-cog" aria-hidden="true"></i>Manage Term</button>
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