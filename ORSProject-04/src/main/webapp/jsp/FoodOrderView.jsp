<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Food Order</title>

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
		class="in.co.rays.proj4.bean.FoodOrderBean"
		scope="request">
	</jsp:useBean>

	<div class="container form-container">

		<div class="card">

			<!-- Header -->
			<div class="card-header">

				<h2 class="mb-0">

					<i class="bi bi-cart-check-fill me-2"></i>

					<%=bean.getOrderId() != null
							&& !bean.getOrderId().isEmpty()
							? "Update Food Order"
							: "Add Food Order"%>

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

				<form action="<%=ORSView.FOODORDER_CTL%>" method="post">

					<!-- Order ID -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-receipt field-icon"></i>
							Order ID
							<span class="required">*</span>

						</label>

						<input type="text"
							class="form-control"
							name="orderId"
							value="<%=DataUtility.getStringData(bean.getOrderId())%>"
							placeholder="Enter Order ID">

						<div class="error">
							<%=ServletUtility.getErrorMessage("orderId", request)%>
						</div>

					</div>


					<!-- Customer Name -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-person-fill field-icon"></i>
							Customer Name
							<span class="required">*</span>

						</label>

						<input type="text"
							class="form-control"
							name="customerName"
							value="<%=DataUtility.getStringData(bean.getCustomerName())%>"
							placeholder="Enter customer name">

						<div class="error">
							<%=ServletUtility.getErrorMessage("customerName", request)%>
						</div>

					</div>


					<!-- Restaurant -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-shop field-icon"></i>
							Restaurant
							<span class="required">*</span>

						</label>

						<input type="text"
							class="form-control"
							name="restaurant"
							value="<%=DataUtility.getStringData(bean.getRestaurant())%>"
							placeholder="Enter restaurant name">

						<div class="error">
							<%=ServletUtility.getErrorMessage("restaurant", request)%>
						</div>

					</div>


					<!-- Order Amount -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-currency-rupee field-icon"></i>
							Order Amount
							<span class="required">*</span>

						</label>

						<input type="number"
							step="0.01"
							class="form-control"
							name="orderAmount"
							value="<%=bean.getOrderAmount() != null
									? bean.getOrderAmount()
									: ""%>"
							placeholder="Enter order amount">

						<div class="error">
							<%=ServletUtility.getErrorMessage("orderAmount", request)%>
						</div>

					</div>


					<!-- Delivery Status -->
					<div class="mb-3">

						<label class="form-label">

							<i class="bi bi-truck field-icon"></i>
							Delivery Status
							<span class="required">*</span>

						</label>

						<select class="form-select"
							name="deliveryStatus">

							<option value="">-- Select Status --</option>

							<option value="Pending"
								<%="Pending".equals(bean.getDeliveryStatus())
										? "selected" : ""%>>
								Pending
							</option>

							<option value="Preparing"
								<%="Preparing".equals(bean.getDeliveryStatus())
										? "selected" : ""%>>
								Preparing
							</option>

							<option value="Out for Delivery"
								<%="Out for Delivery".equals(bean.getDeliveryStatus())
										? "selected" : ""%>>
								Out for Delivery
							</option>

							<option value="Delivered"
								<%="Delivered".equals(bean.getDeliveryStatus())
										? "selected" : ""%>>
								Delivered
							</option>

							<option value="Cancelled"
								<%="Cancelled".equals(bean.getDeliveryStatus())
										? "selected" : ""%>>
								Cancelled
							</option>

						</select>

						<div class="error">
							<%=ServletUtility.getErrorMessage("deliveryStatus", request)%>
						</div>

					</div>


					<!-- Submit -->
					<div class="text-center">

						<button type="submit"
							name="operation"
							value="<%=bean.getOrderId() != null
									&& !bean.getOrderId().isEmpty()
									? "Update"
									: BaseCtl.OP_SAVE%>"
							class="btn btn-primary px-5">

							<i class="bi bi-check-circle me-2"></i>

							<%=bean.getOrderId() != null
									&& !bean.getOrderId().isEmpty()
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