<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>Login</title>

<!-- Bootstrap CSS -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Bootstrap Icons -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style type="text/css">
body {
	background-color: #ffffff;
	color: #212529;
	margin: 0;
}

/* Login Section */
.login-container {
	min-height: 72vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px 15px;
}

/* Login Card */
.login-card {
	width: 100%;
	max-width: 500px;
	border: none;
	border-radius: 15px;
	box-shadow: 0 8px 30px rgba(0, 0, 0, 0.10);
	background-color: #ffffff;
}

/* Card Header */
.login-header {
	text-align: center;
	background-color: #ffffff;
	border-bottom: 1px solid #eeeeee;
	padding: 25px;
	border-radius: 15px 15px 0 0;
}

.login-header h1 {
	margin: 0;
	font-size: 30px;
	font-weight: 600;
	color: #212529;
}

.login-header i {
	font-size: 28px;
	margin-right: 8px;
}

/* Card Body */
.login-body {
	padding: 30px;
}

/* Form Group */
.form-group {
	margin-bottom: 24px;
}

/* Labels */
.form-label {
	display: block;
	font-weight: 600;
	color: #343a40;
	margin-bottom: 8px;
}

/* Input */
.form-control {
	width: 100%;
	height: 45px;
	box-sizing: border-box;
	border-radius: 8px;
	border: 1px solid #ced4da;
	padding: 10px 13px;
	font-size: 14px;
}

.form-control:focus {
	border-color: #0d6efd;
	outline: none;
	box-shadow: 0 0 0 3px rgba(13, 110, 253, 0.15);
}

/* Login Button */
.login-btn {
	width: 100%;
	height: 45px;
	border-radius: 8px;
	font-weight: 600;
	margin-top: 10px;
}

/* Error Message */
.error-message {
	color: #dc3545;
	font-size: 13px;
	margin-top: 5px;
}

/* Alert */
.alert {
	border-radius: 8px;
}
</style>

</head>

<body>


	<!-- User Bean -->
	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean"
		scope="request">
	</jsp:useBean>

	<!-- Header -->
	<%@ include file="Header.jsp"%>

	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	%>

	<!-- LOGIN FORM -->
	<form action="<%=ORSView.LOGIN_CTL%>" method="post">

		<div class="login-container">

			<div class="login-card">

				<!-- HEADER -->
				<div class="login-header">

					<h1>
						<i class="bi bi-box-arrow-in-right text-primary"></i>
						<%=ms.get("login.title")%>
					</h1>

				</div>


				<!-- BODY -->
				<div class="login-body">

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


					<!-- LOGIN FIELD -->
					<div class="form-group">

						<label class="form-label"> <i
							class="bi bi-person-fill text-primary"></i> <%=ms.get("login.userid")%>

							<span class="text-danger">*</span>

						</label> <input type="text" name="login"
							value="<%=DataUtility.getStringData(bean.getLogin())%>"
							placeholder="Enter your login" class="form-control">

						<div class="error-message">

							<%=ServletUtility.getErrorMessage("login", request)%>

						</div>

					</div>


					<!-- PASSWORD FIELD -->
					<div class="form-group">

						<label class="form-label"> <i
							class="bi bi-lock-fill text-primary"></i> <%=ms.get("login.password")%>

							<span class="text-danger">*</span>

						</label> <input type="password" name="password"
							value="<%=DataUtility.getStringData(bean.getPassword())%>"
							placeholder="Enter your password" class="form-control">

						<div class="error-message">

							<%=ServletUtility.getErrorMessage("password", request)%>

						</div>

					</div>


					<!-- LOGIN BUTTON -->
					<div>

						<input type="submit" name="operation"
							value="<%=LoginCtl.OP_SIGN_IN%>"
							class="btn btn-primary login-btn">

					</div>
					<tr>
						<th></th>
						<td><a href="<%=ORSView.FORGET_PASSWORD_CTL%>">forget
								your password ?</a></td>
					</tr>

				</div>

			</div>

		</div>

	</form>

	<!-- Footer -->
	<%@ include file="Footer.jsp"%>


</body>

</html>
