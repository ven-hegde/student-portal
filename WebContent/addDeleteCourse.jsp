<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Tool | Admin</title>
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
				<h5 class="text-center">Course Detail</h5>
			</div>
			<div class="col">
				<!-- Add new student Button -->
				<button type="button"
					class="btn btn-uncc btn-sm material-card material-card-2"
					data-toggle="modal" data-target="#exampleModal"
					data-whatever="@mdo"><i class="fa fa-plus-square" aria-hidden="true"></i> Add New Course</button>

				<!-- Add new Student Form -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add New
									Course</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<form action="AdminController" method="post">
								<div class="modal-body">
									<div class="form-group">
										<ul>
											<li><small class="form-text text-muted">Fields
													with * are mandatory.</small></li>
											<li><small class="form-text text-muted">Course
													Name should have minimum 10 letters.</small></li>
											<li><small class="form-text text-muted">Instructor
													Name should have minimum 4 letters.</small></li>
											<li><small class="form-text text-muted">Instruction
													Mode should have minimum 3 letters.</small></li>
										</ul>
									</div>
									<div class="form-group">
										<label class="col-form-label">Course Name*:</label> <input
											type="text" class="form-control form-control-sm"
											name="courseName" value="" placeholder="Course Name*"
											pattern=".{10,}" title="Minmum 10 letters for Course Name"
											required />
									</div>
									<div class="form-group">
										<label class="col-form-label">Credit*:</label> <input
											type="number" class="form-control form-control-sm"
											name="credit" value="" required />
									</div>
									<div class="form-group">
										<label class="col-form-label">Instructor Name*:</label> <input
											type="text" class="form-control form-control-sm"
											name="instructor" value="" pattern=".{4,}"
											title="Minmum 4 letters for Instructor Name" required />
									</div>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">Term*:</label>
										<select name="term" class="form-control form-control-sm"
											required>
											<option value="">None</option>
											<c:forEach var="term" items="${termList}">
												<option value="${term.termName}"><c:out
														value="${term.termName}"></c:out></option>
											</c:forEach>
										</select>


									</div>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">Mode*:</label>
										<input type="text" class="form-control form-control-sm"
											id="recipient-name" name="mode" value="" pattern=".{3,}"
											title="Minmum 3 letters for Mode of Instruction" required />
									</div>

								</div>
								<div class="modal-footer">
									<input type="hidden" name="action" value="addNewCourse">
									<button type="button"
										class="btn btn-uncc-secondary btn-sm material-card material-card-2"
										data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i>Close</button>
									<button type="submit"
										class="btn btn-uncc btn-sm material-card material-card-2"
										><i class="fa fa-plus-square" aria-hidden="true"></i> Add Course</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Student details -->
		<div
			class="full-height table-responsive pre-scrollable mt-5  material-card material-card-2">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Course Name</th>
						<th scope="col">Term</th>
						<th scope="col">Credit</th>
						<th scope="col">Instructor</th>
						<th scope="col">Mode</th>
						<th scope="col" colspan="2">Action</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="course" items="${requestScope.courseList}">

						<tr>
							<td><c:out value="${course.courseId}"></c:out></td>
							<td><c:out value="${course.courseName}"></c:out></td>
							<td><c:out value="${course.term}"></c:out></td>
							<td><c:out value="${course.credit}"></c:out></td>
							<td><c:out value="${course.instructor}"></c:out></td>
							<td><c:out value="${course.mode}"></c:out></td>
							<td>
								<form action="AdminController" method="post">
									<input type="hidden" name="delCourseId"
										value="<c:out value='${course.courseId}'/>"> <input
										type="hidden" name="action" value="delCourse" /> <button
										class="dropdown-item btn btn-uncc-secondary btn-sm material-card material-card-2"
										type="submit"><i class="fa fa-trash" aria-hidden="true"></i>Delete</button>
								</form>
							</td>
							<td>
								<form action="AdminController" method="post">
									<input type="hidden" name="courseId"
										value="<c:out value='${course.courseId}'/>"> <input
										type="hidden" name="courseName"
										value="<c:out value='${course.courseName}'/>"> <input
										type="hidden" name="term"
										value="<c:out value='${course.term}'/>"> <input
										type="hidden" name="credit"
										value="<c:out value='${course.credit}'/>"> <input
										type="hidden" name="instructor"
										value="<c:out value='${course.instructor}'/>"> <input
										type="hidden" name="mode"
										value="<c:out value='${course.mode}'/>"> <input
										type="hidden" name="action" value="editCourseInit" /> <button
										class="dropdown-item btn btn-uncc btn-sm material-card material-card-2"
										type="submit"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit</button>
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
				<div
					class="alert alert-uncc alert-dismissible fade show mt-3 material-card material-card-2"
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