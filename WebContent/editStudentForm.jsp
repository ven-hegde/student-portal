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
	<div class="row mt-5">
		<div class="col">
			<h6>Edit Student Details Form</h6>
		</div>
	</div>
	<hr>
	<form class="mt-2" action="AdminController" method="post">
		<div class="form-row justify-content-center">
		<div class="col-sm-3 mb-3">
		<div class="form-group">
			<ul>
			<li><small class="form-text text-muted">Use this form to edit student information.</small></li>
			<li><small class="form-text text-muted">Student ID is not editable.</small></li>
				<li><small class="form-text text-muted">Fields with *
						are mandatory.</small></li>
				<li><small class="form-text text-muted">First Name
						should have minimum 4 letters.</small></li>
				<li><small class="form-text text-muted">Last Name
						should have minimum 3 letters.</small></li>
			</ul>
		</div>
		</div>
		</div>
		<div class="form-row justify-content-center">
		
			<div class="col-sm-3 mb-3">
				<label for="validationDefault01">Student ID*</label> <input
					type="text" class="form-control form-control-sm"
					id="validationDefault01" name="StudentID"
					value="<c:out value='${ editingStudent.userId}'></c:out>" disabled="disabled">
			</div>
			<div class="col-sm-3 mb-3">
				<label for="validationDefault01">First name*</label> <input
					type="text" class="form-control form-control-sm"
					id="validationDefault01" name="firstName" placeholder="First name"
					value="<c:out value='${editingStudent.firstName}'></c:out>" pattern=".{4,}" required
					title="Minmum 4 letters for First Name" />
			</div>
			<div class="col-sm-3 mb-3">
				<label for="validationDefault02">Last name*</label> <input
					type="text" class="form-control form-control-sm"
					id="validationDefault02" name="lastName" placeholder="Last name"
					value="<c:out value='${editingStudent.lastName}'></c:out>" pattern=".{3,}" required
					title="Minmum 3 letters for Last Name" />
			</div>

		</div>
		<div class="form-row justify-content-center">
			<div class="col-sm-3 mb-3">
				<label for="validationDefault02">Email*</label> <input type="email"
					class="form-control form-control-sm" id="validationDefault02"
					name="email" value="<c:out value='${editingStudent.email}'></c:out>" required>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="validationDefault03">Phone Number</label> <input
					type="text" class="form-control form-control-sm"
					id="validationDefault03" name="phone"
					value="<c:out value='${ editingStudent.phonenumber}'></c:out>" maxlength="10"
					pattern=".{10,10}" title="Enter 10 digit mobile number" />
			</div>
			<div class="col-sm-3 mb-3">
				<label for="validationDefault04">Address</label> <input type="text"
					class="form-control form-control-sm" id="validationDefault04"
					name="address" value="<c:out value='${ editingStudent.address}'></c:out>"
					title="Address of Residence" />
			</div>

		</div>
		<div class="form-row justify-content-center">
			<div class="col-sm-4 mb-4">
				<label>Role *</label> <select name="role"
					class="form-control form-control-sm" required>
					<option value="">None</option>
					<option value="Student">Student</option>
					<option value="Admin">Admin</option>
				</select>
			</div>
		</div>
		<input type="hidden" name="action" value="editStudentForm"> <input
			type="hidden" name="studentId" value="<c:out value='${ editingStudent.userId}'></c:out>">
		<div class="row justify-content-center mt-5">
			<div class="col-2">
				<button type="Submit"
					class="btn btn-uncc btn-sm btn-block material-card material-card-2"
					><i class="fa fa-floppy-o" aria-hidden="true"></i>Save Changes</button>
			</div>
			<div class="col-2">
				<button type="Reset"
					class="btn btn-uncc-secondary btn-block btn-sm material-card material-card-2"
					><i class="fa fa-undo" aria-hidden="true"></i> Reset</button>
			</div>
		</div>
	</form>

</body>
<c:import url="/footer.jsp" />
</html>