<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.io.*,java.util.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><c:out value="${user.firstName}" />|Profile</title>
<link rel="stylesheet" href="/style/style.css">
<c:import url="/header.jsp" />

</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http 1.0
		response.setHeader("Expires", "0"); //http 1.0
	%>
	<div class="row mt-5 justify-content-center">
		<div class="col-6">
			<table class="table table-bordered material-card material-card-2">
				<thead>
					<tr>
						<th scope="col" class="text-center border-0"><c:if
								test="${user.proPic}">
								<img class="avtar" src="getProPic.jsp?id=${user.userId}" />
							</c:if> <c:if test="${!user.proPic}">
								<img class="avtar" src="img/missing-image-avatar.png" />
							</c:if></th>
						<th scope="col" class="text-center center-new border-0 mb-4"><c:out
								value="${user.firstName}" />'s Profile</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>ID</th>
						<td><c:out value="${user.userId}"></c:out></td>
					</tr>
					<tr>
						<th>First Name</th>
						<td><c:out value="${user.firstName}"></c:out></td>
					</tr>
					<tr>
						<th>Last Name</th>
						<td><c:out value="${user.lastName}"></c:out></td>
					</tr>
					<tr>
						<th>Email</th>
						<td><c:out value="${user.email}"></c:out></td>
					</tr>
					<tr>
						<th>Phone Number</th>
						<td><c:out value="${user.phonenumber}"></c:out></td>
					</tr>
					<tr>
						<th class="width-25">Role</th>
						<td><c:out value="${user.role}"></c:out></td>
					</tr>
					<tr>
						<th>Address</th>
						<td><c:out value="${user.address}"></c:out></td>
					</tr>
				</tbody>
			</table>
			<!-- Button trigger modal -->
			<div class="row">
				<div class="col-4">
					<button type="button"
						class="btn btn-uncc btn-sm btn-block mt-3 material-card material-card-2"
						data-toggle="modal" data-target="#exampleModal"
						data-whatever="@mdo">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit
						Profile
					</button>
				</div>
			</div>
			<c:if test="${requestScope.proedit eq true}">
				<div
					class="alert alert-uncc alert-dismissible fade show mt-3 material-card material-card-2"
					role="alert">
					<c:out value="${proUpMsg}"></c:out>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

			</c:if>

		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Edit your
						profile</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="ProfileController" method="post"
					enctype="multipart/form-data">
					<div class="modal-body">

						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Last
								Name:</label> <input type="text" class="form-control"
								id="recipient-name" name="lastname"
								value="<c:out value='${ user.lastName}'></c:out>" required>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Phone
								Number:</label> <input type="text" class="form-control"
								id="recipient-name" name="phonenumber"
								value="<c:out value='${user.phonenumber}'></c:out>" required
								maxlength="10">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Address:</label>
							<input type="text" class="form-control" id="recipient-name"
								name="address" value="<c:out value='${user.address}'></c:out>"
								required>
						</div>
						<label for="recipient-name" class="col-form-label">Profile
							Photo:</label>
						<div class="custom-file">
							<input type="file" class="custom-file-input"
								id="validatedCustomFile" name="photo"> <label
								class="custom-file-label" for="validatedCustomFile">Choose
								a photo...</label>

						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="action" value="editprofile">
						<button type="button"
							class="btn btn-uncc-secondary btn-sm material-card material-card-2"
							data-dismiss="modal">
							<i class="fa fa-window-close" aria-hidden="true"></i>Close
						</button>
						<button type="submit"
							class="btn btn-uncc btn-sm material-card material-card-2">
							<i class="fa fa-floppy-o" aria-hidden="true"></i> Save Changes
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<c:import url="/footer.jsp" />
</html>