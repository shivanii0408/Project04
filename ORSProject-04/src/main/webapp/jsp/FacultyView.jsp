<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.controller.FacultyCtl"%>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Faculty</title>

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

.form-control, .form-select {
	border-radius: 7px;
}

.form-control:focus, .form-select:focus {
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

	List<CollegeBean> collegeList = (List<CollegeBean>) request.getAttribute("collegeList");
	%>

	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.FacultyBean"
		scope="request">
	</jsp:useBean>


	<div class="container form-container">

		<div class="card">

			<!-- Header -->
			<div class="card-header">
				<h2 class="mb-0">

					<i class="bi bi-person-badge-fill me-2"></i>

					<%=bean != null && bean.getId() > 0 ? "Update Faculty" : "Add Faculty"%>

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


				<form action="<%=ORSView.FACULTY_CTL%>" method="post">

					<!-- Hidden ID -->
					<input type="hidden" name="id"
						value="<%=DataUtility.getStringData(bean.getId())%>">


					<!-- First Name -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-person field-icon"></i> First Name <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="firstName"
							value="<%=DataUtility.getStringData(bean.getFirstName())%>"
							placeholder="Enter first name">

						<div class="error">
							<%=ServletUtility.getErrorMessage("firstName", request)%>
						</div>

					</div>


					<!-- Last Name -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-person field-icon"></i> Last Name <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="lastName"
							value="<%=DataUtility.getStringData(bean.getLastName())%>"
							placeholder="Enter last name">

						<div class="error">
							<%=ServletUtility.getErrorMessage("lastName", request)%>
						</div>

					</div>


					<!-- Email -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-envelope field-icon"></i> Email <span
							class="required">*</span>

						</label> <input type="email" class="form-control" name="email"
							value="<%=DataUtility.getStringData(bean.getEmail())%>"
							placeholder="Enter email">

						<div class="error">
							<%=ServletUtility.getErrorMessage("email", request)%>
						</div>

					</div>


					<!-- Mobile -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-phone field-icon"></i> Mobile No <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="mobileNo"
							value="<%=DataUtility.getStringData(bean.getMobileNo())%>"
							placeholder="Enter mobile number">

						<div class="error">
							<%=ServletUtility.getErrorMessage("mobileNo", request)%>
						</div>

					</div>


					<!-- Address -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-geo-alt field-icon"></i> Address <span
							class="required">*</span>

						</label> <input type="text" class="form-control" name="address"
							value="<%=DataUtility.getStringData(bean.getAddress())%>"
							placeholder="Enter address">

						<div class="error">
							<%=ServletUtility.getErrorMessage("address", request)%>
						</div>

					</div>


					<!-- DOB -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-calendar-event field-icon"></i> DOB <span
							class="required">*</span>

						</label> <input type="date" class="form-control" name="dob"
							value="<%=DataUtility.getStringData(bean.getDob())%>">

						<div class="error">
							<%=ServletUtility.getErrorMessage("dob", request)%>
						</div>

					</div>


					<!-- College -->
					<div class="mb-3">

						<label class="form-label"> <i
							class="bi bi-building field-icon"></i> College Name <span
							class="required">*</span>

						</label>

						<%=HTMLUtility.getList("collegeId", String.valueOf(bean.getCollegeId()), collegeList)%>

						<div class="error">
							<%=ServletUtility.getErrorMessage("collegeId", request)%>
						</div>

					</div>


					<!-- Gender -->
					<div class="mb-4">

						<label class="form-label"> <i
							class="bi bi-gender-ambiguous field-icon"></i> Gender <span
							class="required">*</span>

						</label> <select class="form-select" name="gender">

							<option value="">------------- Select ------------</option>

							<option value="female"
								<%="female".equals(bean.getGender()) ? "selected" : ""%>>
								Female</option>

							<option value="male"
								<%="male".equals(bean.getGender()) ? "selected" : ""%>>
								Male</option>

						</select>

						<div class="error">
							<%=ServletUtility.getErrorMessage("gender", request)%>
						</div>

					</div>


					<!-- Submit -->
					<div class="text-center">

						<button type="submit" name="operation"
							value="<%=bean != null && bean.getId() > 0 ? "Update" : BaseCtl.OP_SAVE%>"
							class="btn btn-primary px-5">

							<i class="bi bi-check-circle me-2"></i>

							<%=bean != null && bean.getId() > 0 ? "Update" : "Save"%>

						</button>

					</div>

				</form>

			</div>
		</div>

	</div>


	<%@ include file="Footer.jsp"%>




</body>
</html>