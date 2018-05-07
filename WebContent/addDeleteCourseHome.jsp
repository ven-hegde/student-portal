<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Course Home | Admin</title>
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
			<h6>Please select the term to proceed.</h6>
		</div>
	</div>
	<hr>
	<div class="row mt-5 justify-content-center">
		<div class="col-3 col-sm-3">
			<form action="AdminController" method="post">
				<select class="form-control form-control-sm" name="term" required>
					<option value="">None</option>
					<c:forEach var="term" items="${termList}">
						<option value="${term.termName}"><c:out
								value="${term.termName}"></c:out></option>
					</c:forEach>
				</select>
				<div class="row mt-5 justify-content-center">
					<div class="col-6">
						<input type="hidden" name="action" value="termSelected" />
						<button type="submit"
							class="btn btn-uncc btn-block btn-sm material-card material-card-2">
							<i class="fa fa-paper-plane" aria-hidden="true"></i>Submit
						</button>
					</div>
					<div class="col-6">
						<button type="reset"
							class="btn btn-uncc-secondary btn-block btn-sm material-card material-card-2">
							<i class="fa fa-undo" aria-hidden="true"></i> Reset
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<c:if test="${requestScope.addNewSt eq true}">
		<div class="row justify-content-center">
			<div class="col-4">
				<div class="alert alert-uncc alert-dismissible fade show mt-3"
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