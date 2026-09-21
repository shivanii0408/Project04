<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Marksheet</title>

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

.btn-primary {
	background-color: #0d6efd;
	border-color: #0d6efd;
}

.btn-primary:hover {
	background-color: #0b5ed7;
	border-color: #0a58ca;
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
	class="in.co.rays.proj4.bean.MarksheetBean"
	scope="request">
</jsp:useBean>


<div class="container form-container">

	<div class="card">

		<!-- Header -->

		<div class="card-header">

			<h2 class="mb-0">

				<i class="bi bi-journal-text me-2"></i>

				<%=bean != null && bean.getId() > 0
						? "Update Marksheet"
						: "Add Marksheet"%>

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


			<form action="<%=ORSView.MARKSHEET_CTL%>" method="post">

				<!-- Hidden ID -->

				<input type="hidden"
					name="id"
					value="<%=DataUtility.getStringData(bean.getId())%>">


				<!-- Roll No -->

				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-person-badge field-icon"></i>
						Roll No
						<span class="required">*</span>

					</label>

					<input type="text"
						class="form-control"
						name="rollNo"
						value="<%=DataUtility.getStringData(bean.getRollNo())%>"
						placeholder="Enter roll no">

					<div class="error">
						<%=ServletUtility.getErrorMessage("rollNo", request)%>
					</div>

				</div>


				<!-- Name -->

				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-person field-icon"></i>
						Name
						<span class="required">*</span>

					</label>

					<input type="text"
						class="form-control"
						name="name"
						value="<%=DataUtility.getStringData(bean.getName())%>"
						placeholder="Enter name">

					<div class="error">
						<%=ServletUtility.getErrorMessage("name", request)%>
					</div>

				</div>


				<!-- Physics -->

				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-book field-icon"></i>
						Physics
						<span class="required">*</span>

					</label>

					<input type="text"
						class="form-control"
						name="physics"
						value="<%=DataUtility.getStringData(bean.getPhysics())%>"
						placeholder="Enter physics marks">

					<div class="error">
						<%=ServletUtility.getErrorMessage("physics", request)%>
					</div>

				</div>


				<!-- Chemistry -->

				<div class="mb-3">

					<label class="form-label">

						<i class="bi bi-book field-icon"></i>
						Chemistry
						<span class="required">*</span>

					</label>

					<input type="text"
						class="form-control"
						name="chemistry"
						value="<%=DataUtility.getStringData(bean.getChemistry())%>"
						placeholder="Enter chemistry marks">

					<div class="error">
						<%=ServletUtility.getErrorMessage("chemistry", request)%>
					</div>

				</div>


				<!-- Maths -->

				<div class="mb-4">

					<label class="form-label">

						<i class="bi bi-calculator field-icon"></i>
						Maths
						<span class="required">*</span>

					</label>

					<input type="text"
						class="form-control"
						name="maths"
						value="<%=DataUtility.getStringData(bean.getMaths())%>"
						placeholder="Enter maths marks">

					<div class="error">
						<%=ServletUtility.getErrorMessage("maths", request)%>
					</div>

				</div>


				<!-- Submit -->

				<div class="text-center">

					<button type="submit"
						name="operation"
						value="<%=bean != null && bean.getId() > 0
								? "Update"
								: BaseCtl.OP_SAVE%>"
						class="btn btn-primary px-5">

						<i class="bi bi-check-circle me-2"></i>

						<%=bean != null && bean.getId() > 0
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