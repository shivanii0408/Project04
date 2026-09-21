<%@ page import="in.co.rays.proj4.bean.StudentBean"%>
<%@ page import="in.co.rays.proj4.util.ServletUtility"%>
<%@ page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@ page import="in.co.rays.proj4.controller.ORSView"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student List</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
	background-color: #f8f9fa;
}

.list-container {
	margin: 35px auto;
	width: 95%;
}

.page-title {
	font-weight: 600;
}

.search-box {
	background: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
	margin-bottom: 20px;
}

.table-container {
	background: white;
	border-radius: 10px;
	padding: 15px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.student-table {
	vertical-align: middle;
}

.student-table thead {
	background-color: #212529;
	color: white;
}

.student-table tbody tr:hover {
	background-color: #f1f3f5;
}

.student-table td, .student-table th {
	text-align: center;
	vertical-align: middle;
}

.action-buttons {
	margin-top: 20px;
}

.photo {
	width: 55px;
	height: 55px;
	object-fit: cover;
	border-radius: 50%;
	border: 1px solid #ddd;
}
</style>

</head>

<body>

	<%@ include file="Header.jsp"%>

	<%
	int pageNo = ServletUtility.getPageNo(request);

	int pageSize = ServletUtility.getPageSize(request);

	int index = ((pageNo - 1) * pageSize) + 1;

	List<StudentBean> list = ServletUtility.getList(request);

	Iterator<StudentBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.STUDENT_LIST_CTL%>" method="post">

		<div class="list-container">


			<!-- Page Heading -->

			<div class="text-center mb-4">

				<h2 class="page-title">

					<i class="bi bi-people-fill text-primary me-2"></i> Student List

				</h2>

			</div>

			<!-- PDF Button - Top Right -->

			<div class="position-absolute top-0 end-0 mt-2 me-3">

				<a href="<%=ORSView.STUDENT_REPORT_CTL%>?type=pdf"
					class="btn btn-outline-danger btn-sm px-3"> <i
					class="bi bi-file-earmark-pdf me-1"></i>Download PDF

				</a>
				<a href="<%=ORSView.STUDENT_REPORT_CTL%>?type=doc"
					class="btn btn-outline-primary btn-sm px-3"> <i
					class="bi bi-file-earmark-pdf me-1"></i>Download DOC

				</a>

			</div>
			<!-- Success Message -->

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


			<!-- Error Message -->

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


			<!-- Hidden Fields -->

			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


			<!-- Search -->

			<div class="search-box">

				<div class="row g-3 align-items-center">

					<div class="col-md-5">

						<div class="input-group">

							<span class="input-group-text"> <i class="bi bi-building"></i>
							</span> <input type="text" name="collegeName" value=""
								placeholder="Search by college name" class="form-control">

						</div>

					</div>


					<div class="col-md-5">

						<div class="input-group">

							<span class="input-group-text"> <i class="bi bi-person"></i>
							</span> <input type="text" name="firstName" value=""
								placeholder="Search by first name" class="form-control">

						</div>

					</div>


					<div class="col-md-2">

						<input type="submit" name="operation"
							value="<%=BaseCtl.OP_SEARCH%>" class="btn btn-primary w-100">

					</div>

				</div>

			</div>


			<!-- Student Table -->

			<div class="table-container">

				<div class="table-responsive">

					<table class="table table-bordered table-hover student-table mb-0">

						<thead>

							<tr>

								<th><input type="checkbox" class="form-check-input"
									onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">
								</th>

								<th>S.No</th>

								<th>College Name</th>

								<th>First Name</th>

								<th>Last Name</th>

								<th>DOB</th>

								<th>Mobile No</th>

								<th>Email</th>

								<th>Edit</th>

							</tr>

						</thead>


						<tbody>

							<%
							while (it.hasNext()) {

								StudentBean bean = it.next();
							%>

							<tr>

								<td><input type="checkbox" name="ids"
									class="form-check-input" value="<%=bean.getId()%>"></td>


								<td><%=index++%></td>


								<td><%=bean.getCollegeName()%></td>


								<td><%=bean.getFirstName()%></td>


								<td><%=bean.getLastName()%></td>


								<td><%=bean.getDob()%></td>


								<td><%=bean.getMobileNo()%></td>


								<td><%=bean.getEmail()%></td>


								<td><a
									href="<%=ORSView.STUDENT_CTL + "?id=" + bean.getId()%>"
									class="btn btn-sm btn-outline-primary"> <i
										class="bi bi-pencil-square"></i> Edit

								</a></td>

							</tr>

							<%
							}
							%>

						</tbody>

					</table>

				</div>

			</div>


			<!-- Pagination / Actions -->

			<div class="action-buttons">

				<div class="row align-items-center">

					<div class="col-md-4">

						<input type="submit" name="operation"
							<%=pageNo == 1 ? "disabled" : ""%>
							value="<%=BaseCtl.OP_PREVIOUS%>"
							class="btn btn-outline-secondary">

					</div>


					<div class="col-md-4 text-center">

						<input type="submit" name="operation"
							value="<%=BaseCtl.OP_DELETE%>" class="btn btn-danger">

					</div>


					<div class="col-md-4 text-end">

						<input type="submit" name="operation"
							<%=list.size() < 10 ? "disabled" : ""%>
							value="<%=BaseCtl.OP_NEXT%>" class="btn btn-outline-primary">

					</div>

				</div>

			</div>

		</div>

	</form>


	<%@ include file="Footer.jsp"%>

</body>

</html>