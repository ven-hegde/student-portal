<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Drop Course | Student</title>
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
		<div class="table-responsive pre-scrollable mt-5  material-card material-card-2 ml-2 mr-2">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Course Name</th>
						<th scope="col">Term</th>
						<th scope="col">Credit</th>
						<th scope="col">Instructor</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="regCourse" items="${allRegCourses}">
		
						<tr>
							<td><c:out value="${regCourse.courseId}"></c:out></td>
							<td><c:out value="${regCourse.courseName}"></c:out></td>
							<td><c:out value="${regCourse.term}"></c:out></td>
							<td><c:out value="${regCourse.credit}"></c:out></td>
							<td><c:out value="${regCourse.instructor}"></c:out></td>
							
									<td>
								<form action="StudentController" method="post">
											<input type="hidden" name="courseId"
												value="<c:out value='${regCourse.courseId}'/>"> 
												<input type="hidden" name="courseName"
												value="<c:out value='${regCourse.courseName}'/>"> 
											<input type="hidden" name="dropCourseRegId"
												value="<c:out value='${regCourse.registrationId}'/>">
												<input type="hidden" name="dropCourseTr"
												value="<c:out value='${regCourse.term}'/>"> 
												<input
												type="hidden" name="action" value="dropSelectedCourse" /> <button
												class="btn btn-uncc btn-sm btn-block material-card material-card-2"
												type="submit"><i class="fa fa-minus-square" aria-hidden="true"></i> Drop</button>
										</form>
										</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		
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