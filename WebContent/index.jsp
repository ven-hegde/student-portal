<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="https://www.uncc.edu/sites/www.uncc.edu/files/favicon.ico"
	type="image/vnd.microsoft.icon">


<link rel="stylesheet" href="style/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	function background() {
		var random = Math.floor(Math.random() * 4) + 0;
		var bgImages = [
				"url('https://cdn.uncc.edu/its/my/d07/themes/img/front_page/15572279429_a0c0dd34b5_b.jpg')",
				"url('https://cdn.uncc.edu/its/my/d07/themes/img/front_page/15624666481_b5334ddd99_b.jpg')",
				"url('https://cdn.uncc.edu/its/my/d07/themes/img/front_page/15571382628_7b6a891b2b_b.jpg')",
				"url('https://cdn.uncc.edu/its/my/d07/themes/img/front_page/17094515785_73a96cb107_b.jpg')" ];
		document.getElementById("indexBody").style.backgroundImage = bgImages[random];
	}
</script>
<title>Login</title>
</head>
<body id="indexBody" onload="background()">


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
		response.setHeader("Pragma", "no-cache"); //http 1.0
		response.setHeader("Expires", "0"); //http 1.0
	%>
	<div class="container justify-content-center">
		<div class="row mt-12 justify-content-center">
			<div class="col-5">

				<form class="form-signin material-card material-card-2"
					action="LoginController" method="post">
					<div class="justify-content-center mt-3">
						<center>
							<img class="uncc-rounded" src="img/crown.png" width="100" />

						</center>
					</div>
					<div class="form-group mt-5">
						<h6 class="text-center">Please Login to Student Portal</h6>
						<input type="text" name="username"
							value="<c:out value='${user.email}'></c:out>"
							class="form-control form-control-sm mt-5" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="User Name" required>
						<input type="hidden" name="action" value="login">
					</div>
					<div class="form-group">
						<input type="password" name="password"
							value="<c:out value='${user.password}'></c:out>"
							class="form-control form-control-sm mt-4"
							id="exampleInputPassword1" placeholder="Password" required>
					</div>
					<div class="form-group mt-4" align="center">
						<button type="submit"
							class="btn btn-lg btn-uncc btn-block btn-sm material-card material-card-2">
							<i class="fa fa-sign-in" aria-hidden="true"></i>Login
						</button>
					</div>
				</form>
			</div>
		</div>
		<div class="row mt-2 justify-content-center">
			<div class="col-4">

				<center>
					<button type="button" class="btn btn-link" data-toggle="modal"
						data-target=".bd-example-modal-lg">About Student Portal</button>
				</center>
				<div class="full-height modal fade bd-example-modal-lg"
					tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
					aria-hidden="true">
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
								<object
									data="otheresources/Student-Portal-User-Manual.pdf#page=1"
									type="application/pdf" width="100%" height="600px;" />

								<iframe
									src="otheresources/Student-Portal-User-Manual.pdf#page=1"
									width="100%" height="600px;" style="border: none;" />
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

</body>

</html>