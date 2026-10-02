<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Voter</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">

<style>

body {
	background-color: #f8f9fa;
}

.form-container {
	max-width: 750px;
	margin: 40px auto 100px auto;
}

.card {
	border: 1px solid #dee2e6;
	border-radius: 12px;
	box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
	background-color: white;
}

.card-header {
	background-color: #0d6efd;
	color: white;
	border-radius: 12px 12px 0 0 !important;
	text-align: center;
	padding: 18px;
}

.card-header h2 {
	font-size: 24px;
	font-weight: 600;
}

.form-label {
	font-weight: 600;
	color: #212529;
}

.required {
	color: red;
}

.error {
	color: red;
	font-size: 14px;
	margin-top: 4px;
}

.form-control,
.form-select {
	border-radius: 7px;
}

.form-control:focus,
.form-select:focus {
	border-color: #0d6efd;
	box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.15);
}

.field-icon {
	color: #0d6efd;
	margin-right: 6px;
}

</style>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
		String _suc = ServletUtility.getSuccessMessage(request);
		String _err = ServletUtility.getErrorMessage(request);
	%>

	<jsp:useBean id="bean"
		class="in.co.rays.proj4.bean.VoterBean"
		scope="request">
	</jsp:useBean>


	<div class="container form-container">

		<div class="card">

			<!-- Header -->
			<div class="card-header">

				<h2 class="mb-0">

					<i class="bi bi-person-badge-fill me-2"></i>

					<%=bean.getVoterId() != null
							&& !bean.getVoterId().isEmpty()
							? "Update Voter"
							: "Add Voter"%>

				</h2>

			</div>


			<div class="card-body p-4">

				<!-- Success Message -->
				<%
					if (_suc != null && !_suc.isEmpty()) {
				%>

				<div class="alert alert-success text-center">

					<i class="bi bi-check-circle-fill me-2"></i>

					<%=_suc%>

				</div>

				<%
					}
				%>


				<!-- Error Message -->
				<%
					if (_err != null && !_err.isEmpty()) {
				%>

				<div class="alert alert-danger text-center">

					<i class="bi bi-exclamation-triangle-fill me-2"></i>

					<%=_err%>

				</div>

				<%
					}
				%>


				<form action="<%=ORSView.VOTER_CTL%>" method="post">


					<!-- Hidden Voter ID -->
					<input type="hidden"
						name="voterId"
						value="<%=DataUtility.getStringData(bean.getVoterId())%>">


					<!-- Voter ID -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-person-vcard field-icon"></i>
							Voter ID
							<span class="required">*</span>

						</label>

						<input type="text"
							class="form-control"
							name="voterId"
							value="<%=DataUtility.getStringData(bean.getVoterId())%>"
							placeholder="Enter Voter ID">

						<div class="error">

							<%=ServletUtility.getErrorMessage("voterId", request)%>

						</div>

					</div>


					<!-- Name -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-person-fill field-icon"></i>
							Name
							<span class="required">*</span>

						</label>

						<input type="text"
							class="form-control"
							name="name"
							value="<%=DataUtility.getStringData(bean.getName())%>"
							placeholder="Enter voter name">

						<div class="error">

							<%=ServletUtility.getErrorMessage("name", request)%>

						</div>

					</div>


					<!-- Age -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-calendar3 field-icon"></i>
							Age
							<span class="required">*</span>

						</label>

						<input type="number"
							class="form-control"
							name="age"
							value="<%=bean.getAge()%>"
							placeholder="Enter age">

						<div class="error">

							<%=ServletUtility.getErrorMessage("age", request)%>

						</div>

					</div>


					<!-- Constituency -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-geo-alt-fill field-icon"></i>
							Constituency
							<span class="required">*</span>

						</label>

						<input type="text"
							class="form-control"
							name="constituency"
							value="<%=DataUtility.getStringData(bean.getConstituency())%>"
							placeholder="Enter constituency">

						<div class="error">

							<%=ServletUtility.getErrorMessage("constituency", request)%>

						</div>

					</div>


					<!-- Has Voted -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-check2-square field-icon"></i>
							Has Voted
							<span class="required">*</span>

						</label>

						<select class="form-select"
							name="hasVoted">

							<option value="">-- Select --</option>

							<option value="true"
								<%=bean.isHasVoted() ? "selected" : ""%>>
								Yes
							</option>

							<option value="false"
								<%=!bean.isHasVoted() ? "selected" : ""%>>
								No
							</option>

						</select>

						<div class="error">

							<%=ServletUtility.getErrorMessage("hasVoted", request)%>

						</div>

					</div>


					<!-- Submit -->
					<div class="text-center">

						<button type="submit"
							name="operation"
							value="<%=bean.getVoterId() != null
									&& !bean.getVoterId().isEmpty()
									? "Update"
									: BaseCtl.OP_SAVE%>"
							class="btn btn-primary px-5">

							<i class="bi bi-check-circle me-2"></i>

							<%=bean.getVoterId() != null
									&& !bean.getVoterId().isEmpty()
									? "Update"
									: "Save"%>

						</button>

					</div>

				</form>

			</div>

		</div>

	</div>


	<%@ include file="Footer.jsp"%>

</body>

</html>