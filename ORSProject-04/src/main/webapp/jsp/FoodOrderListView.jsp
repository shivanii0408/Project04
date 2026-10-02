<%@page import="in.co.rays.proj4.bean.FoodOrderBean"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Food Order List</title>

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

.list-container {
	margin-top: 40px;
	margin-bottom: 100px;
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

.search-box {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 20px;
	border: 1px solid #dee2e6;
}

.form-control {
	border-radius: 7px;
}

.form-control:focus {
	border-color: #0d6efd;
	box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.15);
}

.table {
	margin-bottom: 0;
}

.table th {
	background-color: #e9f2ff;
	color: #212529;
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
}

.table td {
	text-align: center;
	vertical-align: middle;
}

.check-box {
	width: 18px;
	height: 18px;
}

.error {
	color: red;
}

</style>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%

	int pageNo = ServletUtility.getPageNo(request);

	int pageSize = ServletUtility.getPageSize(request);

	int index = ((pageNo - 1) * pageSize) + 1;

	List<FoodOrderBean> list = ServletUtility.getList(request);

	Iterator<FoodOrderBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);

	%>


	<div class="container-fluid list-container">

		<div class="card">

			<!-- Header -->

			<div class="card-header">

				<h2 class="mb-0">

					<i class="bi bi-cart-check-fill me-2"></i>

					Food Order List

				</h2>

			</div>


			<!-- PDF Button -->

			<div class="position-absolute top-0 end-0 mt-2 me-3">

				<a href="<%=ORSView.FOODORDER_LIST_CTL%>?type=pdf"
					class="btn btn-outline-danger btn-sm px-3">

					<i class="bi bi-file-earmark-pdf me-1"></i>

					PDF

				</a>

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


				<form action="<%=ORSView.FOODORDER_LIST_CTL%>" method="post">


					<!-- Hidden Fields -->

					<input type="hidden"
						name="pageNo"
						value="<%=pageNo%>">

					<input type="hidden"
						name="pageSize"
						value="<%=pageSize%>">


					<!-- Search -->

					<div class="search-box">

						<div class="row g-3 align-items-center">

							<div class="col-md-8">

								<div class="input-group">

									<span class="input-group-text bg-white">

										<i class="bi bi-search text-primary"></i>

									</span>

									<input type="text"
										class="form-control"
										name="customerName"
										value=""
										placeholder="Search by customer name">

								</div>

							</div>


							<div class="col-md-4">

								<button type="submit"
									name="operation"
									value="<%=BaseCtl.OP_SEARCH%>"
									class="btn btn-primary w-100">

									<i class="bi bi-search me-2"></i>

									Search

								</button>

							</div>

						</div>

					</div>


					<!-- Table -->

					<div class="table-responsive">

						<table class="table table-bordered table-hover">

							<thead>

								<tr>

									<th>

										<input type="checkbox"
											class="form-check-input check-box"
											onclick="selectAll(this)">

									</th>


									<th>

										<i class="bi bi-list-ol me-1"></i>

										S.No

									</th>


									<th>

										<i class="bi bi-receipt me-1"></i>

										Order ID

									</th>


									<th>

										<i class="bi bi-person-fill me-1"></i>

										Customer Name

									</th>


									<th>

										<i class="bi bi-shop me-1"></i>

										Restaurant

									</th>


									<th>

										<i class="bi bi-currency-rupee me-1"></i>

										Order Amount

									</th>


									<th>

										<i class="bi bi-truck me-1"></i>

										Delivery Status

									</th>


									<th>

										<i class="bi bi-pencil-square me-1"></i>

										Edit

									</th>

								</tr>

							</thead>


							<tbody>

								<%

								while (it.hasNext()) {

									FoodOrderBean bean = it.next();

								%>

								<tr>


									<!-- Checkbox -->

									<td>

										<input type="checkbox"
											class="form-check-input check-box"
											name="ids"
											value="<%=bean.getOrderId()%>">

									</td>


									<!-- S.No -->

									<td>

										<%=index++%>

									</td>


									<!-- Order ID -->

									<td>

										<%=bean.getOrderId()%>

									</td>


									<!-- Customer Name -->

									<td>

										<%=bean.getCustomerName()%>

									</td>


									<!-- Restaurant -->

									<td>

										<%=bean.getRestaurant()%>

									</td>


									<!-- Order Amount -->

									<td>

										₹<%=bean.getOrderAmount()%>

									</td>


									<!-- Delivery Status -->

									<td>

										<%

										String status = bean.getDeliveryStatus();

										if ("Delivered".equals(status)) {

										%>

										<span class="badge bg-success">

											Delivered

										</span>

										<%

										} else if ("Cancelled".equals(status)) {

										%>

										<span class="badge bg-danger">

											Cancelled

										</span>

										<%

										} else if ("Out for Delivery".equals(status)) {

										%>

										<span class="badge bg-info">

											Out for Delivery

										</span>

										<%

										} else if ("Preparing".equals(status)) {

										%>

										<span class="badge bg-warning text-dark">

											Preparing

										</span>

										<%

										} else {

										%>

										<span class="badge bg-secondary">

											<%=status%>

										</span>

										<%

										}

										%>

									</td>


									<!-- Edit -->

									<td>

										<a
											href="<%=ORSView.FOODORDER_CTL + "?orderId=" + bean.getOrderId()%>"
											class="btn btn-sm btn-outline-primary">

											<i class="bi bi-pencil-square me-1"></i>

											Edit

										</a>

									</td>


								</tr>

								<%

								}

								%>

							</tbody>

						</table>

					</div>


					<!-- Pagination / Delete -->

					<div class="row mt-4 align-items-center">


						<!-- Previous -->

						<div class="col-md-4">

							<button type="submit"
								name="operation"
								value="<%=BaseCtl.OP_PREVIOUS%>"
								class="btn btn-secondary"
								<%=pageNo == 1 ? "disabled" : ""%>>

								<i class="bi bi-chevron-left me-1"></i>

								Previous

							</button>

						</div>


						<!-- Delete -->

						<div class="col-md-4 text-center">

							<button type="submit"
								name="operation"
								value="<%=BaseCtl.OP_DELETE%>"
								class="btn btn-danger">

								<i class="bi bi-trash3 me-1"></i>

								Delete

							</button>

						</div>


						<!-- Next -->

						<div class="col-md-4 text-end">

							<button type="submit"
								name="operation"
								value="<%=BaseCtl.OP_NEXT%>"
								class="btn btn-secondary"
								<%=list.size() < pageSize ? "disabled" : ""%>>

								Next

								<i class="bi bi-chevron-right ms-1"></i>

							</button>

						</div>

					</div>


				</form>

			</div>

		</div>

	</div>


	<%@ include file="Footer.jsp"%>


	<!-- Select All -->

	<script>

		function selectAll(source) {

			let checkboxes =
				document.querySelectorAll('input[name="ids"]');

			checkboxes.forEach(function(checkbox) {

				checkbox.checked = source.checked;

			});

		}

	</script>


</body>

</html>