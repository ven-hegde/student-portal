<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Term Tool | Admin</title>
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
				<h5 class="text-center">Term Detail</h5>
			</div>
			<div class="col">
				<!-- Add new student Button -->
				<button type="button"
					class="btn btn-uncc btn-sm material-card material-card-2"
					data-toggle="modal" data-target="#exampleModal"
					data-whatever="@mdo"><i class="fa fa-plus-square" aria-hidden="true"></i>Add New Term</button>

				<!-- Add new Student Form -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add New Term</h5>
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
											<li><small class="form-text text-muted">Term
													Name should have minimum 7 letters.</small></li>
											<li><small class="form-text text-muted">Select
													the Start Date and End Date from calendar.</small></li>
											
										</ul>
									</div>
									<div class="form-group">
										<label class="col-form-label">Term Name*:</label> <input
											type="text" class="form-control form-control-sm"
											name="termName" value="" placeholder="Term Name*"
											pattern=".{7,}" required
											title="Minmum 7 letters for Term Name" />
									</div>
									<div class="form-group">
										<label class="col-form-label">Start Date*:</label> <input
											type="date" class="form-control form-control-sm"
											name="startDate" data-date-format="DD MMMM YYYY" value=""
											required />
									</div>
									<div class="form-group">
										<label class="col-form-label">End Date*:</label> <input
											type="date" class="form-control form-control-sm"
											name="endDate" data-date-format="DD MMMM YYYY" value=""
											required />
									</div>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">Enable
											Term*:</label> <select class="form-control form-control-sm"
											name="isTermEnabled" required>
											<option value="">None</option>
											<option value="true">Yes</option>
											<option value="false">No</option>
										</select>
									</div>
									<div class="form-group">
										<label for="recipient-name" class="col-form-label">Registration
											Open*:</label> <select class="form-control form-control-sm"
											name="isRegOpen" required>
											<option value="">None</option>
											<option value="true">Yes</option>
											<option value="false">No</option>
										</select>
									</div>


								</div>
								<div class="modal-footer">
									<input type="hidden" name="action" value="addNewTerm">
									<button type="button"
										class="btn btn-uncc-secondary btn-sm material-card material-card-2"
										data-dismiss="modal"><i class="fa fa-window-close" aria-hidden="true"></i>Close</button>
									<button type="submit"
										class="btn btn-uncc btn-sm material-card material-card-2"
										><i class="fa fa-plus-square" aria-hidden="true"></i>Add Term</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Student details -->
		<div
			class="full-height table-responsive pre-scrollable mt-5 material-card material-card-2 ml-2 mr-2">
			<table class="table table-hover mr-2 ml-2">
				<thead>
					<tr>
						<th scope="col">Term Name</th>
						<th scope="col">Start Date</th>
						<th scope="col">End Date</th>
						<th scope="col">Activated</th>
						<th scope="col" colspan="2">Action</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="term" items="${termList}">

						<tr>
							<td><c:out value="${term.termName}"></c:out></td>
							<td><c:out value="${term.startDate}"></c:out></td>
							<td><c:out value="${term.endDate}"></c:out></td>
							<td><c:out value="${term.termEnabled}"></c:out></td>
							<td>
								<form action="AdminController" method="post">
									<input type="hidden" name="termId" 
										value="<c:out value='${term.termId}'/>">
									<c:if test="${term.termEnabled}">
										<input type="hidden" name="action" value="acDsTerm" />
										<input type="hidden" name="isTermEnabled"
											value="<c:out value="${term.termEnabled}"/> "/>
										<button
											class="btn btn-uncc-secondary btn-70 btn-sm material-card material-card-2"
											type="submit"><i class="fa fa-toggle-off" aria-hidden="true"></i>Disable Term</button>
									</c:if>
									<c:if test="${!term.termEnabled}">
										<input type="hidden" name="action" value="acDsTerm" />
										<input type="hidden" name="isTermEnabled"
											value="<c:out value="${term.termEnabled}"/>" />
										<button
											class="btn btn-uncc-secondary btn-sm btn-70 material-card material-card-2"
											type="submit"><i class="fa fa-toggle-on" aria-hidden="true"></i>Enable Term</button>
									</c:if>
								</form>
							</td>


							<td>
								<form action="AdminController" method="post">
									<input type="hidden" name="termId"
										value="<c:out value='${term.termId}'/>">
									<c:if test="${term.regOpen}">
										<input type="hidden" name="action" value="regOpTerm" />
										<input type="hidden" name="isRegEnabled"
											value="<c:out value="${term.regOpen}"/>">
										<button
											class="btn btn-uncc btn-sm  material-card material-card-2"
											type="submit"><i class="fa fa-stop-circle-o" aria-hidden="true"></i>Close Registration</button>
									</c:if>
									<c:if test="${!term.regOpen}">
										<input type="hidden" name="action" value="regOpTerm" />
										<input type="hidden" name="isRegEnabled"
											value="<c:out value="${term.regOpen}"/>" >
										<button
											class="btn btn-uncc btn-sm  material-card material-card-2"
											type="submit"><i class="fa fa-check-circle-o" aria-hidden="true"></i>Open Registration</button>
									</c:if>
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
					<c:out value="${addNewStMsg}"/>
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