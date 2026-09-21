<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>College List</title>

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

.list-card {
	margin: 35px auto;
	border: none;
	border-radius: 15px;
}

.card-header {
	background-color: white;
	border-bottom: 1px solid #e9ecef;
	padding: 18px 22px;
}

.card-header h2 {
	margin: 0;
	font-weight: 600;
}

.search-box {
	background-color: #ffffff;
	border-radius: 10px;
	padding: 18px;
}

.form-control {
	border-radius: 8px;
}

.btn {
	border-radius: 7px;
}

.table {
	margin-bottom: 0;
	vertical-align: middle;
}

.table thead th {
	background-color: #e9f2ff;
	color: #212529;
	font-weight: 600;
	white-space: nowrap;
}

.table tbody tr:hover {
	background-color: #f8f9fa;
}

.edit-btn {
	padding: 5px 12px;
}

.pagination-buttons {
	margin-top: 20px;
}

.alert {
	border-radius: 8px;
}
</style>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	int pageNo = ServletUtility.getPageNo(request);

	int pageSize = ServletUtility.getPageSize(request);

	int index = ((pageNo - 1) * pageSize) + 1;

	List<CollegeBean> list = ServletUtility.getList(request);

	Iterator<CollegeBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.COLLEGE_LIST_CTL%>" method="post">

		<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
			type="hidden" name="pageSize" value="<%=pageSize%>">


		<div class="container-fluid px-4">

			<div class="card list-card shadow-sm">


				<!-- HEADER -->

				<div class="card-header">

					<h2 class="text-center">

						<i class="bi bi-building text-primary"></i> College List

					</h2>

				</div>

				<!-- PDF Button - Top Right -->

				<div class="position-absolute top-0 end-0 mt-2 me-3">

					<a href="<%=ORSView.COLLEGE_REPORT_CTL%>?type=pdf"
						class="btn btn-outline-danger btn-sm px-3"> <i
						class="bi bi-file-earmark-pdf me-1"></i> Download PDF

					</a>
					
					<a href="<%=ORSView.COLLEGE_REPORT_CTL%>?type=doc"
						class="btn btn-outline-primary btn-sm px-3"> <i
						class="bi bi-file-earmark-pdf me-1"></i> Download DOC

					</a>

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


					<!-- SEARCH -->

					<div class="search-box shadow-sm mb-4">

						<div class="row g-3 align-items-center">

							<div class="col-md-5">

								<div class="input-group">

									<span class="input-group-text"> <i
										class="bi bi-building"></i>
									</span> <input type="text" name="name" value="" class="form-control"
										placeholder="Search by college name">

								</div>

							</div>


							<div class="col-md-5">

								<div class="input-group">

									<span class="input-group-text"> <i class="bi bi-geo-alt"></i>
									</span> <input type="text" name="city" value="" class="form-control"
										placeholder="Search by city">

								</div>

							</div>


							<div class="col-md-2">

								<button type="submit" name="operation"
									value="<%=BaseCtl.OP_SEARCH%>" class="btn btn-primary w-100">

									<i class="bi bi-search me-1"></i> Search

								</button>

							</div>

						</div>

					</div>


					<!-- TABLE -->

					<div class="table-responsive">

						<table class="table table-bordered table-hover text-center">

							<thead>

								<tr>

									<th><input type="checkbox"
										onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">
									</th>

									<th>S.No</th>

									<th>Name</th>

									<th>Address</th>

									<th>State</th>

									<th>City</th>

									<th>Phone No</th>

									<th>Edit</th>

								</tr>

							</thead>


							<tbody>

								<%
								while (it.hasNext()) {

									CollegeBean bean = it.next();
								%>

								<tr>

									<td><input type="checkbox" name="ids"
										value="<%=bean.getId()%>"></td>


									<td><%=index++%></td>


									<td><i class="bi bi-building text-primary me-1"></i> <%=bean.getName()%>

									</td>


									<td><%=bean.getAddress()%></td>


									<td><%=bean.getState()%></td>


									<td><i class="bi bi-geo-alt text-danger me-1"></i> <%=bean.getCity()%>

									</td>


									<td><i class="bi bi-telephone text-success me-1"></i> <%=bean.getPhoneNo()%>

									</td>


									<td><a
										href="<%=ORSView.COLLEGE_CTL + "?id=" + bean.getId()%>"
										class="btn btn-outline-primary btn-sm edit-btn"> <i
											class="bi bi-pencil-square"></i> Edit

									</a></td>

								</tr>

								<%
								}
								%>

							</tbody>

						</table>

					</div>


					<!-- PAGINATION / ACTION BUTTONS -->

					<div class="row pagination-buttons align-items-center">

						<!-- PREVIOUS -->

						<div class="col-md-4">

							<button type="submit" name="operation"
								value="<%=BaseCtl.OP_PREVIOUS%>"
								<%=pageNo == 1 ? "disabled" : ""%>
								class="btn btn-outline-secondary">

								<i class="bi bi-arrow-left"></i> Previous

							</button>

						</div>


						<!-- DELETE -->

						<div class="col-md-4 text-center">

							<button type="submit" name="operation"
								value="<%=BaseCtl.OP_DELETE%>" class="btn btn-danger">

								<i class="bi bi-trash3"></i> Delete

							</button>

						</div>


						<!-- NEXT -->

						<div class="col-md-4 text-end">

							<button type="submit" name="operation"
								value="<%=BaseCtl.OP_NEXT%>"
								<%=list.size() < 10 ? "disabled" : ""%>
								class="btn btn-outline-primary">

								Next <i class="bi bi-arrow-right"></i>

							</button>

						</div>

					</div>

				</div>

			</div>

		</div>

	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>