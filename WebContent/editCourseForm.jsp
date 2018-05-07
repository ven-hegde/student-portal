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
			<h6>Edit Course Details Form</h6>
		</div>
	</div>
	<hr>
	<form action="AdminController" method="post">
		<div class="form-row justify-content-center">
			<div class="col-sm-3 mb-3 mt-2">
				<div class="form-group">
					<ul>
						<li><small class="form-text text-muted">Use this form
								to edit Course information.</small></li>
						<li><small class="form-text text-muted">Course ID is
								not editable.</small></li>
						<li><small class="form-text text-muted">Fields with *
								are mandatory.</small></li>
						<li><small class="form-text text-muted">Fields with *
								are mandatory.</small></li>
						<li><small class="form-text text-muted">Course Name
								should have minimum 10 letters.</small></li>
						<li><small class="form-text text-muted">Instructor
								Name should have minimum 4 letters.</small></li>
						<li><small class="form-text text-muted">Instruction
								Mode should have minimum 3 letters.</small></li>
						<li><small class="form-text text-muted">Term name
								should have minimum 6 letters.</small></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="form-row justify-content-center">
			<div class="col-sm-3 mb-3">
				<label for="validationDefault01">Course ID*</label> <input
					type="text" class="form-control form-control-sm"
					id="validationDefault01" name="courseName"
					value="<c:out value='${ editingCourse.courseId}'></c:out>"
					disabled="disabled">
			</div>
			<div class="col-sm-3 mb-3">
				<label for="validationDefault01">Course name*</label> <input
					type="text" class="form-control form-control-sm"
					id="validationDefault01" name="courseName"
					value="<c:out value='${editingCourse.courseName}'></c:out>"
					pattern=".{10,}" title="Minmum 10 letters for Course Name" required />
			</div>
			<div class="col-sm-3 mb-3">
				<label for="validationDefault02">Term*</label> <input type="text"
					class="form-control form-control-sm" id="validationDefault02"
					name="term" value="<c:out value='${editingCourse.term}'></c:out>"
					pattern=".{6,}" title="Minmum 6 letters for Term" required />
			</div>

		</div>
		<div class="form-row justify-content-center">
			<div class="col-sm-3 mb-3">
				<label for="validationDefault02">Credit*</label> <input
					type="number" class="form-control form-control-sm"
					id="validationDefault02" name="credit"
					value="<c:out value='${editingCourse.credit}'></c:out>" required>
			</div>
			<div class="col-sm-3 mb-3">
				<label for="validationDefault03">Instructor*</label> <input
					type="text" class="form-control form-control-sm"
					id="validationDefault03" name="instructor"
					value="<c:out value='${ editingCourse.instructor}'></c:out>"
					pattern=".{4,}" title="Minmum 4 letters for Instructor Name"
					required />
			</div>
			<div class="col-sm-3 mb-3">
				<label for="validationDefault04">Mode*</label> <input type="text"
					class="form-control form-control-sm" id="validationDefault04"
					name="mode" value="<c:out value='${ editingCourse.mode}'></c:out>"
					pattern=".{3,}" title="Minmum 3 letters for Mode of Instruction"
					required />
			</div>

		</div>
		<input type="hidden" name="action" value="editCourseForm"> <input
			type="hidden" name="courseId"
			value="<c:out value='${ editingCourse.courseId}'></c:out>">
		<div class="row justify-content-center mt-5">
			<div class="col-2">
				<button type="Submit"
					class="btn btn-uncc btn-block btn-sm material-card material-card-2"
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