<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style/style.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http 1.0
		response.setHeader("Expires", "0"); //http 1.0
	%>

	<nav
		class="navbar fixed-bottom navbar-expand-lg navbar-light bg-unccft">

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav ml-30">
				<li class="nav-item"><span class="nav-link cp-right">©
						2018 UNC Charlotte | All Rights Reserved </span></li>
				<li class="nav-item">

					<button type="button" class="btn btn-link"
						data-toggle="modal" data-target=".bd-example-modal-lg">About
						Student Portal</button>

				</li>
			</ul>

		</div>
	</nav>

	<div class="full-height modal fade bd-example-modal-lg" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">About
						Student Portal</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body full-height">
					<object data="otheresources/Student-Portal-User-Manual.pdf#page=1"
						type="application/pdf" width="100%" height="600px;"></object>

					<iframe src="otheresources/Student-Portal-User-Manual.pdf#page=1"
						width="100%" height="600px;" style="border: none;"></iframe>
				</div>
			</div>
		</div>
	</div>


</body>
</html>