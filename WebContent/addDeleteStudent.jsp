<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Management Tool | Admin</title>
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
				<h5 class="text-center">Students Details</h5>
			</div>
			<div class="col">
				<!-- Add new student Button -->
				<button type="button"
					class="btn btn-uncc btn-sm  material-card material-card-2"
					data-toggle="modal" data-target="#exampleModal"
					data-whatever="@mdo">
					<i class="fa fa-user-plus" aria-hidden="true"></i>Add New Student
				</button>

				<!-- Add new Student Form -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add New
									Student</h5>
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
											<li><small class="form-text text-muted">First
													Name should have minimum 4 letters.</small></li>
											<li><small class="form-text text-muted">Last
													Name should have minimum 3 letters.</small></li>
										</ul>
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="recipient-name"
											name="firstname" value="" placeholder="First Name*"
											pattern=".{4,}" required
											title="Minmum 4 letters for First Name" />
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="recipient-name"
											name="lastname" value="" placeholder="Last Name*"
											pattern=".{3,}" required
											title="Minmum 3 letters for Last Name" />
									</div>
									<div class="form-group">
										<input type="email" class="form-control" id="recipient-name"
											name="email" placeholder="Email*" value="" required />
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="recipient-name"
											name="phonenumber" value="" maxlength="10" pattern=".{10,10}"
											placeholder="Phone Number"
											title="Enter 10 digit mobile number" />
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="recipient-name"
											name="address" value="" placeholder="Address"
											title="Address of Residence" />
									</div>

								</div>
								<div class="modal-footer">
									<input type="hidden" name="action" value="addNewStudent">
									<button type="button"
										class="btn btn-uncc-secondary btn-sm material-card material-card-2"
										data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i>Close</button>
									<button type="submit"
										class="btn btn-uncc btn-sm material-card material-card-2"
										><i class="fa fa-user-plus" aria-hidden="true"></i>Add student</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Student details -->
		<div
			class="full-height table-responsive pre-scrollable mt-5 ml-2 mr-2">
			<table class="table table-hover material-card material-card-2">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Last Name</th>
						<th scope="col">First Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Phone</th>
						<th scope="col" colspan="2">Action</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="student" items="${requestScope.studentList}">

						<tr>
							<td><c:out value="${student.userId}"></c:out></td>
							<td><c:out value="${student.lastName}"></c:out></td>
							<td><c:out value="${student.firstName}"></c:out></td>
							<td><c:out value="${student.email}"></c:out></td>
							<td><c:out value="${student.address}"></c:out></td>
							<td><c:out value="${student.phonenumber}"></c:out></td>
							<td>
								<form action="AdminController" method="post">
									<input type="hidden" name="delStudentId"
										value="<c:out value='${student.userId}'/>"> <input
										type="hidden" name="action" value="delStudent" />
									<button
										class="dropdown-item btn btn-uncc-secondary btn-sm material-card material-card-2"
										type="submit">
										<i class="fa fa-user-times" aria-hidden="true"></i>Delete
									</button>
								</form>
							</td>
							<td>
								<form action="AdminController" method="post">
									<input type="hidden" name="editStudentId"
										value="<c:out value='${student.userId}'/>"> <input
										type="hidden" name="editStudentFnm"
										value="<c:out value='${student.firstName}'/>"> <input
										type="hidden" name="editStudentLnm"
										value="<c:out value='${student.lastName}'/>"> <input
										type="hidden" name="editStudentEmail"
										value="<c:out value='${student.email}'/>"> <input
										type="hidden" name="editStudentAdd"
										value="<c:out value='${student.address}'/>"> <input
										type="hidden" name="editStudentPhone"
										value="<c:out value='${student.phonenumber}'/>"> <input
										type="hidden" name="action" value="editStudentInit" />
									<button
										class="dropdown-item btn btn-uncc btn-sm material-card material-card-2"
										type="submit">
										<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
									</button>
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