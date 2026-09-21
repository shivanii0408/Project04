<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Course</title>

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
	max-width: 650px;
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


<jsp:useBean id="bean"
	class="in.co.rays.proj4.bean.CourseBean"
	scope="request">
</jsp:useBean>


<div class="container form-container">

	<div class="card">


		<!-- Header -->

		<div class="card-header">

			<h2 class="mb-0">

				<i class="bi bi-mortarboard me-2"></i>

				<%=bean != null && bean.getId() > 0
						? "Update Course"
						: "Add Course"%>

			</h2>

		</div>


		<div class="card-body p-4">


			<!-- Success -->

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


			<!-- Error -->

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


			<form action="<%=ORSView.COURSE_CTL%>"
				method="post">


				<!-- ID -->

				<input type="hidden"
					name="id"
					value="<%=DataUtility.getStringData(bean.getId())%>">


				<!-- Name -->

				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-book field-icon"></i>

						Name

						<span class="required">*</span>

					</label>


					<input type="text"
						class="form-control"
						name="name"
						value="<%=DataUtility.getStringData(bean.getName())%>"
						placeholder="Enter course name">


					<div class="error">

						<%=ServletUtility.getErrorMessage("name", request)%>

					</div>

				</div>


				<!-- Description -->

				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-card-text field-icon"></i>

						Description

						<span class="required">*</span>

					</label>


					<input type="text"
						class="form-control"
						name="description"
						value="<%=DataUtility.getStringData(bean.getDescription())%>"
						placeholder="Enter course description">


					<div class="error">

						<%=ServletUtility.getErrorMessage("description", request)%>

					</div>

				</div>


				<!-- Duration -->

				<div class="mb-4">

					<label class="form-label">

						<i class="bi bi-clock field-icon"></i>

						Duration

						<span class="required">*</span>

					</label>


					<input type="text"
						class="form-control"
						name="duration"
						value="<%=DataUtility.getStringData(bean.getDuration())%>"
						placeholder="Enter duration">


					<div class="error">

						<%=ServletUtility.getErrorMessage("duration", request)%>

					</div>

				</div>


				<!-- Submit -->

				<div class="text-center">

					<button type="submit"
						name="operation"
						value="<%=BaseCtl.OP_SAVE%>"
						class="btn btn-primary px-5">

						<i class="bi bi-check-circle me-2"></i>

						Save

					</button>

				</div>


			</form>

		</div>

	</div>

</div>


<%@ include file="Footer.jsp"%>


<!-- Bootstrap JS -->




</body>

</html>