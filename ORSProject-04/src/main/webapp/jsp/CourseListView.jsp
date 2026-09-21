<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.bean.CourseBean"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Course List</title>


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
	margin-top: 35px;
	margin-bottom: 100px;
}

.card {
	border: 1px solid #dee2e6;
	border-radius: 12px;
	box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
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
	background-color: #f8f9fa;
	padding: 18px;
	border-radius: 8px;
	border: 1px solid #dee2e6;
	margin-bottom: 20px;
}

.table th {
	background-color: #e9f2ff;
	color: #212529;
	text-align: center;
	vertical-align: middle;
}

.table td {
	text-align: center;
	vertical-align: middle;
}

.check-box {
	width: 18px;
	height: 18px;
}

</style>

</head>


<body>

<%@ include file="Header.jsp"%>


<%

int pageNo = ServletUtility.getPageNo(request);

int pageSize = ServletUtility.getPageSize(request);

int index = ((pageNo - 1) * pageSize) + 1;

List<CourseBean> list = ServletUtility.getList(request);

Iterator<CourseBean> it = list.iterator();

String _suc = ServletUtility.getSuccessMessage(request);

String _err = ServletUtility.getErrorMessage(request);

%>


<div class="container-fluid list-container">

	<div class="card">


		<!-- Header -->

		<div class="card-header">

			<h2 class="mb-0">

				<i class="bi bi-list-ul me-2"></i>

				Course List

			</h2>

		</div>

<!-- PDF Button - Top Right -->

				<div class="position-absolute top-0 end-0 mt-2 me-3">

					<a href="<%=ORSView.COURSE_REPORT_CTL%>?type=pdf"
						class="btn btn-outline-danger btn-sm px-3"> <i
						class="bi bi-file-earmark-pdf me-1"></i> PDF

					</a>

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


			<form action="<%=ORSView.COURSE_LIST_CTL%>"
				method="post">


				<!-- Hidden -->

				<input type="hidden"
					name="pageNo"
					value="<%=pageNo%>">

				<input type="hidden"
					name="pageSize"
					value="<%=pageSize%>">


				<!-- Search -->

				<div class="search-box">

					<div class="row g-3">

						<div class="col-md-8">

							<div class="input-group">

								<span class="input-group-text">

									<i class="bi bi-book"></i>

								</span>


								<input type="text"
									class="form-control"
									name="name"
									value=""
									placeholder="Search by course name">

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

								<th>S.No</th>

								<th>Name</th>

								<th>Description</th>

								<th>Duration</th>

								<th>Edit</th>

							</tr>

						</thead>


						<tbody>


						<%

						while (it.hasNext()) {

							CourseBean bean = it.next();

						%>


							<tr>


								<td>

									<input type="checkbox"
										class="form-check-input check-box"
										name="ids"
										value="<%=bean.getId()%>">

								</td>


								<td>

									<%=index++%>

								</td>


								<td>

									<%=bean.getName()%>

								</td>


								<td>

									<%=bean.getDescription()%>

								</td>


								<td>

									<%=bean.getDuration()%>

								</td>


								<td>

									<a
										href="<%=ORSView.COURSE_CTL + "?id=" + bean.getId()%>"
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


				<!-- Pagination -->

				<div class="row mt-4">


					<!-- Previous -->

					<div class="col-md-4">

						<button type="submit"
							name="operation"
							value="<%=BaseCtl.OP_PREVIOUS%>"
							class="btn btn-secondary"
							<%=pageNo == 1 ? "disabled" : ""%>>

							<i class="bi bi-arrow-left me-2"></i>

							Previous

						</button>

					</div>


					<!-- Delete -->

					<div class="col-md-4 text-center">

						<button type="submit"
							name="operation"
							value="<%=BaseCtl.OP_DELETE%>"
							class="btn btn-danger">

							<i class="bi bi-trash me-2"></i>

							Delete

						</button>

					</div>


					<!-- Next -->

					<div class="col-md-4 text-end">

						<button type="submit"
							name="operation"
							value="<%=BaseCtl.OP_NEXT%>"
							class="btn btn-secondary"
							<%=list.size() < 10 ? "disabled" : ""%>>

							Next

							<i class="bi bi-arrow-right ms-2"></i>

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