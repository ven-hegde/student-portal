<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Tool | Student</title>
<link rel="stylesheet" href="/style/style.css">
<c:import url="/header.jsp" />

</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
response.setHeader("Pragma", "no-cache"); //http 1.0
response.setHeader("Expires", "0"); //http 1.0
%>
	<div class="mt-5">
		<div class="row justify-content-center">
			<div class="col-10">
				<h5 class="text-center">Course Details</h5>
			</div>
		</div>
		
		<!-- Student details -->
		<div class="full-height table-responsive pre-scrollable mt-2  material-card material-card-2 ml-2 mr-2">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Course Name</th>
						<th scope="col">Term</th>
						<th scope="col">Credit</th>
						<th scope="col">Instructor</th>
						<th scope="col">Mode</th>
						<c:if test="${regStatus}">
						<th scope="col" colspan="2">Action</th>
						</c:if>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="course" items="${courseList}">
		
						<tr>
						<td><c:out value="${course.courseId}"></c:out></td>
							
							<td><c:out value="${course.courseName}"></c:out></td>
							<td><c:out value="${course.term}"></c:out></td>
							<td><c:out value="${course.credit}"></c:out></td>
							<td><c:out value="${course.instructor}"></c:out></td>
							<td><c:out value="${course.mode}"></c:out></td>
							<c:if test="${regStatus}">
							<td>
								<form action="StudentController" method="post">
											<input type="hidden" name="addCourseId"
												value="<c:out value='${course.courseId}'/>"> 
												<input type="hidden" name="addCourseName"
												value="<c:out value='${course.courseName}'/>"> 
												<input type="hidden" name="addCourseCr"
												value="<c:out value='${course.credit}'/>"> 
												<input type="hidden" name="addCourseTr"
												value="<c:out value='${course.term}'/>"> 
												<input
												type="hidden" name="action" value="addSelectedCourse" /> <button
												class="btn btn-uncc btn-sm btn-block material-card material-card-2"
												type="submit"><i class="fa fa-registered" aria-hidden="true"></i>Register</button>
										</form>
										</td>
								</c:if>		
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
		</div>
		<div class="row justify-content-left">
			<div class="col-10">
				<ul>
						<li><small class="form-text text-muted">Maximum 12 credits for a term</small></li>
						<li><small class="form-text text-muted">You can't register same course more than once.</small></li>
					</ul>
			</div>
		</div>
	</div>
	<c:if test="${requestScope.addNewSt eq true}">
	<div class="row justify-content-center">
	<div class="col-4">
			<div class="alert alert-uncc alert-dismissible fade show mt-3 material-card material-card-2"
				role="alert">
				<c:out value="${addNewStMsg}"></c:out>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			</div>
</div>
		</c:if>
</body>
<c:import url="/footer.jsp" />
</html>