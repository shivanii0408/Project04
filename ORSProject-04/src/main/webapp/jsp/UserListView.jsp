<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@page import="in.co.rays.proj4.bean.RoleBean"%>
<%@page import="in.co.rays.proj4.model.RoleModel"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>User List</title>

<!-- Bootstrap CSS -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<!-- Bootstrap Icons -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


<style>
body {
	background-color: #ffffff;
}

.user-list-container {
	padding: 35px 30px;
}

.user-list-card {
	border: none;
	border-radius: 15px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.10);
}

.user-list-header {
	background-color: white;
	border-bottom: 1px solid #eeeeee;
	padding: 20px;
	text-align: center;
	border-radius: 15px 15px 0 0;
}

.user-list-header h1 {
	margin: 0;
	font-size: 30px;
	font-weight: 600;
}

.search-box {
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 10px;
	margin-bottom: 25px;
}

.search-box .form-control {
	height: 42px;
	border-radius: 8px;
}

.search-btn {
	height: 42px;
	border-radius: 8px;
	font-weight: 600;
}

.table {
	vertical-align: middle;
}

.table thead th {
	background-color: #212529;
	color: white;
	text-align: center;
	vertical-align: middle;
}

.table tbody td {
	text-align: center;
	vertical-align: middle;
}

.table tbody tr:hover {
	background-color: #f8f9fa;
}

.user-photo {
	width: 50px;
	height: 50px;
	object-fit: cover;
	border-radius: 50%;
	border: 2px solid #dee2e6;
}

.edit-btn {
	border-radius: 6px;
	font-size: 14px;
}

.pagination-section {
	margin-top: 20px;
}

.pagination-btn {
	min-width: 110px;
	border-radius: 8px;
	font-weight: 600;
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

	List<UserBean> list = ServletUtility.getList(request);

	Iterator<UserBean> it = list.iterator();

	String _suc = ServletUtility.getSuccessMessage(request);

	String _err = ServletUtility.getErrorMessage(request);
	%>


	<form action="<%=ORSView.USER_LIST_CTL%>" method="post">


		<div class="user-list-container">

			<div class="card user-list-card">


				<!-- HEADER -->

				<div class="user-list-header">

					<h1>

						<i class="bi bi-people-fill text-primary"></i> User List

					</h1>

				</div>
				
				
				<!-- PDF Button - Top Right -->

				<div class="position-absolute top-0 end-0 mt-2 me-3">

					<a href="<%=ORSView.USER_REPORT_CTL%>?type=pdf"
						class="btn btn-outline-danger btn-sm px-3"> <i
						class="bi bi-file-earmark-pdf me-1"></i> Download PDF

					</a>
					
					<a href="<%=ORSView.USER_REPORT_CTL%>?type=doc"
						class="btn btn-outline-primary btn-sm px-3"> <i
						class="bi bi-file-earmark-pdf me-1"></i> Download DOC

					</a>

				</div>



				<div class="card-body p-4">

					<!-- SUCCESS -->

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


					<!-- ERROR -->

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


					<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
						type="hidden" name="pageSize" value="<%=pageSize%>">


					<!-- SEARCH -->

					<div class="search-box">

						<div class="row g-3 align-items-center">


							<div class="col-md-5">

								<div class="input-group">

									<span class="input-group-text"> <i
										class="bi bi-person-fill"></i>

									</span> <input type="text" name="firstName" value=""
										placeholder="Search by first name" class="form-control">

								</div>

							</div>


							<div class="col-md-5">

								<div class="input-group">

									<span class="input-group-text"> <i
										class="bi bi-person-fill"></i>

									</span> <input type="text" name="lastName" value=""
										placeholder="Search by last name" class="form-control">

								</div>

							</div>


							<div class="col-md-2">

								<input type="submit" name="operation"
									value="<%=BaseCtl.OP_SEARCH%>"
									class="btn btn-primary search-btn w-100">

							</div>


						</div>

					</div>


					<!-- TABLE -->

					<div class="table-responsive">

						<table class="table table-bordered table-hover">


							<thead>

								<tr>

									<th><input type="checkbox"
										onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">

									</th>

									<th>S.No</th>

									<th>Photo</th>

									<th>First Name</th>

									<th>Last Name</th>

									<th>Login</th>

									<th>DOB</th>

									<th>Role Name</th>

									<th>Edit</th>

								</tr>

							</thead>


							<tbody>


								<%
								while (it.hasNext()) {

									UserBean bean = it.next();

									RoleModel rmodel = new RoleModel();

									RoleBean rbean = rmodel.findByPK(bean.getRoleId());
								%>


								<tr>


									<td><input type="checkbox" name="ids"
										value="<%=bean.getId()%>"></td>


									<td><%=index++%></td>


									<td><img
										src="<%=ORSView.UPLOAD_PHOTO_CTL%>?id=<%=bean.getId()%>"
										onerror="this.style.display='none';" alt="User Photo"
										class="user-photo"></td>


									<td><%=bean.getFirstName()%></td>


									<td><%=bean.getLastName()%></td>


									<td><%=bean.getLogin()%></td>


									<td><%=bean.getDob()%></td>


									<td><%=rbean.getName()%></td>


									<td><a
										href="<%=ORSView.USER_CTL + "?id=" + bean.getId()%>"
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


					<!-- PAGINATION -->

					<div class="pagination-section">

						<div class="row align-items-center">


							<div class="col-md-4">

								<input type="submit" name="operation"
									value="<%=BaseCtl.OP_PREVIOUS%>"
									<%=pageNo == 1 ? "disabled" : ""%>
									class="btn btn-outline-primary pagination-btn">

							</div>


							<div class="col-md-4 text-center">

								<input type="submit" name="operation"
									value="<%=BaseCtl.OP_DELETE%>"
									class="btn btn-danger pagination-btn">

							</div>


							<div class="col-md-4 text-end">

								<input type="submit" name="operation"
									value="<%=BaseCtl.OP_NEXT%>"
									<%=list.size() < 10 ? "disabled" : ""%>
									class="btn btn-outline-primary pagination-btn">

							</div>


						</div>

					</div>


				</div>

			</div>

		</div>

	</form>


	<%@ include file="Footer.jsp"%>


</body>

</html>