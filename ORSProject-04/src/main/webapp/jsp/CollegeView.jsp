<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>College</title>

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
}

.college-card {
	width: 650px;
	margin: 45px auto;
	border: none;
	border-radius: 15px;
}

.card-header {
	background-color: white;
	border-bottom: 1px solid #e9ecef;
	padding: 20px;
}

.card-header h2 {
	margin: 0;
	font-weight: 600;
	color: #212529;
}

.form-label {
	font-weight: 500;
}

.required {
	color: red;
}

.error-message {
	color: red;
	font-size: 14px;
}

.form-control {
	border-radius: 8px;
	padding: 10px 12px;
}

.form-control:focus {
	box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.15);
}

.btn-save {
	border-radius: 8px;
	padding: 10px 28px;
}

.alert {
	border-radius: 8px;
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
	class="in.co.rays.proj4.bean.CollegeBean"
	scope="request">
</jsp:useBean>

<form action="<%=ORSView.COLLEGE_CTL%>" method="post">

	<input type="hidden" name="id"
		value="<%=DataUtility.getStringData(bean.getId())%>">

	<div class="container">

		<div class="card college-card shadow-sm">

			<!-- HEADER -->
			<div class="card-header text-center">

				<h2>
					<i class="bi bi-building text-primary"></i>

					<%=bean != null && bean.getId() > 0
							? "Update College"
							: "Add College"%>

				</h2>

			</div>

			<div class="card-body p-4">

				<!-- SUCCESS MESSAGE -->
				<%
				if (_suc != null && !_suc.isEmpty()) {
				%>

				<div class="alert alert-success d-flex align-items-center"
					role="alert">

					<i class="bi bi-check-circle-fill me-2"></i>

					<div>
						<%=_suc%>
					</div>

				</div>

				<%
				}
				%>

				<!-- ERROR MESSAGE -->
				<%
				if (_err != null && !_err.isEmpty()) {
				%>

				<div class="alert alert-danger d-flex align-items-center"
					role="alert">

					<i class="bi bi-exclamation-triangle-fill me-2"></i>

					<div>
						<%=_err%>
					</div>

				</div>

				<%
				}
				%>


				<!-- COLLEGE NAME -->
				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-building text-primary"></i>
						Name
						<span class="required">*</span>

					</label>

					<input type="text"
						name="name"
						class="form-control"
						value="<%=DataUtility.getStringData(bean.getName())%>"
						placeholder="Enter college name">

					<div class="error-message">
						<%=ServletUtility.getErrorMessage("name", request)%>
					</div>

				</div>


				<!-- ADDRESS -->
				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-geo-alt text-danger"></i>
						Address
						<span class="required">*</span>

					</label>

					<input type="text"
						name="address"
						class="form-control"
						value="<%=DataUtility.getStringData(bean.getAddress())%>"
						placeholder="Enter address">

					<div class="error-message">
						<%=ServletUtility.getErrorMessage("address", request)%>
					</div>

				</div>


				<!-- STATE -->
				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-map text-success"></i>
						State
						<span class="required">*</span>

					</label>

					<input type="text"
						name="state"
						class="form-control"
						value="<%=DataUtility.getStringData(bean.getState())%>"
						placeholder="Enter state">

					<div class="error-message">
						<%=ServletUtility.getErrorMessage("state", request)%>
					</div>

				</div>


				<!-- CITY -->
				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-geo text-warning"></i>
						City
						<span class="required">*</span>

					</label>

					<input type="text"
						name="city"
						class="form-control"
						value="<%=DataUtility.getStringData(bean.getCity())%>"
						placeholder="Enter city">

					<div class="error-message">
						<%=ServletUtility.getErrorMessage("city", request)%>
					</div>

				</div>


				<!-- PHONE -->
				<div class="mb-4">

					<label class="form-label">

						<i class="bi bi-telephone text-info"></i>
						Phone No
						<span class="required">*</span>

					</label>

					<input type="text"
						name="phoneNo"
						class="form-control"
						value="<%=DataUtility.getStringData(bean.getPhoneNo())%>"
						placeholder="Enter phone number">

					<div class="error-message">
						<%=ServletUtility.getErrorMessage("phoneNo", request)%>
					</div>

				</div>


				<!-- BUTTON -->
				<div class="text-center">

					<button type="submit"
						name="operation"
						value="<%=bean != null && bean.getId() > 0
								? "Update"
								: BaseCtl.OP_SAVE%>"
						class="btn btn-primary btn-save">

						<i class="bi bi-check-circle me-1"></i>

						<%=bean != null && bean.getId() > 0
								? "Update"
								: "Save"%>

					</button>

				</div>

			</div>

		</div>

	</div>

</form>

<%@ include file="Footer.jsp"%>

</body>
</html>