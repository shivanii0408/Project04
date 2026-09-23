<%@page import="in.co.rays.proj4.bean.GymMemberBean"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Gym Member</title>

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

.form-control {
	border-radius: 7px;
}

.form-control:focus {
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

	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.GymMemberBean"
		scope="request">
	</jsp:useBean>


	<div class="container form-container">

		<div class="card">

			<!-- Header -->
			<div class="card-header">

				<h2 class="mb-0">

					<i class="bi bi-person-badge-fill me-2"></i>

					<%=bean.getMemberId() != null && !bean.getMemberId().isEmpty() ? "Update Gym Member" : "Add Gym Member"%>

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


				<form action="<%=ORSView.GYMMEMBER_CTL%>" method="post">

					<!-- Hidden ID -->
					<input type="hidden" name="Id"
						value="<%=DataUtility.getStringData(bean.getId())%>">


					<!-- MemberID -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-person-fill field-icon"></i> MemberID <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="name"
							value="<%=DataUtility.getStringData(bean.getMemberId())%>"
							placeholder="Enter Member ID">

						<div class="error">

							<%=ServletUtility.getErrorMessage("MemberID", request)%>

						</div>

					</div>


					<!-- Name -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-person-fill field-icon"></i> Name <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="name"
							value="<%=DataUtility.getStringData(bean.getName())%>"
							placeholder="Enter member name">

						<div class="error">

							<%=ServletUtility.getErrorMessage("Name", request)%>

						</div>

					</div>


					<!-- Membership Type -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-card-checklist field-icon"></i> Membership Type <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="membershipType"
							value="<%=DataUtility.getStringData(bean.getMembershipType())%>"
							placeholder="Enter membership type">

						<div class="error">

							<%=ServletUtility.getErrorMessage("MembershipType", request)%>

						</div>

					</div>


					<!-- Joining Date -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-calendar-event field-icon"></i> Joining Date <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="joiningDate"
							value="<%=DataUtility.getStringData(bean.getJoiningDate())%>"
							placeholder="Enter joining date">

						<div class="error">

							<%=ServletUtility.getErrorMessage("JoiningDate", request)%>

						</div>

					</div>


					<!-- Trainer Name -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-person-workspace field-icon"></i> Trainer Name <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="trainerName"
							value="<%=DataUtility.getStringData(bean.getTrainerName())%>"
							placeholder="Enter trainer name">

						<div class="error">

							<%=ServletUtility.getErrorMessage("TrainerName", request)%>

						</div>

					</div>


					<!-- Submit -->
					<div class="text-center">

						<button type="submit" name="operation"
							value="<%=bean != null && bean.getMemberId() != null && !bean.getMemberId().isEmpty() ? "Update" : BaseCtl.OP_SAVE%>"
							class="btn btn-primary px-5">

							<i class="bi bi-check-circle me-2"></i>

							<%=bean != null && bean.getMemberId() != null && !bean.getMemberId().isEmpty() ? "Update" : "Save"%>

						</button>

					</div>

				</form>

			</div>

		</div>

	</div>

	<%@ include file="Footer.jsp"%>

</body>
</html>