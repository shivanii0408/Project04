<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@page import="in.co.rays.proj4.util.MessageSource"%>

<%
MessageSource ms = MessageSource.getInstance();
UserBean userBean = (UserBean) session.getAttribute("user");
String roleName = (String) session.getAttribute("role");

boolean isLogin = userBean != null;
String welcomeMsg = "Hi, ";
String locale = ms.getLanguage();
%>

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


<style>

/* ================================
   NAVBAR
================================ */
.navbar {
	padding: 8px 15px;
	background-color: #111111 !important;
	border-bottom: 1px solid #2f2f2f;
}

.navbar-brand {
	color: white !important;
}

/* RAYS LOGO */
.logo {
	width: 175px;
	height: 50px;
	object-fit: contain;
	background-color: white;
	border-radius: 6px;
	padding: 3px;
}

/* NAVIGATION TEXT */
.navbar-nav .nav-link {
	font-weight: 500;
	margin-left: 5px;
	color: #ffffff !important;
}

.navbar-nav .nav-link:hover {
	color: #d1d1d1 !important;
}

.navbar-nav .nav-link.active {
	color: #ffffff !important;
}

/* ================================
   DROPDOWN
================================ */
.dropdown-menu {
	border: 1px solid #dee2e6;
	border-radius: 7px;
	padding: 6px;
	background-color: #ffffff;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
}

.dropdown-item {
	padding: 8px 15px;
	border-radius: 5px;
	color: #212529;
}

.dropdown-item:hover {
	background-color: #f1f1f1;
	color: #000000;
}

/* ================================
   NAVBAR TOGGLER
================================ */
.navbar-toggler {
	border-color: #ffffff;
}

.navbar-toggler:focus {
	box-shadow: none;
}

.navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='white' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
}

/* ================================
   PAGE CARD
================================ */
.page-card {
	max-width: 900px;
	margin: 40px auto;
	background-color: #ffffff;
	border: 1px solid #dee2e6;
	border-radius: 6px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
}

/* ================================
   PAGE HEADER
================================ */
.page-header {
	padding: 22px;
	border-bottom: 1px solid #dee2e6;
	text-align: center;
}

.page-header h1 {
	margin: 0;
	font-size: 32px;
	font-weight: 500;
	color: #111111;
}

.page-header i {
	color: #000000;
	margin-right: 10px;
}

/* ================================
   FORM
================================ */
.form-label {
	font-weight: 500;
	color: #212529;
}

.form-control, .form-select {
	min-height: 48px;
	border: 1px solid #ced4da;
	border-radius: 5px;
}

.form-control:focus, .form-select:focus {
	border-color: #777777;
	box-shadow: 0 0 0 0.15rem rgba(0, 0, 0, 0.08);
}

/* ================================
   BUTTON
================================ */
.btn-primary {
	background-color: #111111;
	border-color: #111111;
	padding: 10px 35px;
}

.btn-primary:hover {
	background-color: #000000;
	border-color: #000000;
}

/* ================================
   TABLE
================================ */
.table thead th {
	background-color: #111111;
	color: #ffffff;
	vertical-align: middle;
}

.table tbody td {
	vertical-align: middle;
}

/* ================================
   FOOTER
================================ */
.footer {
	background-color: #111111;
	color: #ffffff;
	border-top: 1px solid #2f2f2f;
	padding: 18px 0;
	margin-top: 50px;
	text-align: center;
}

.footer p {
	margin: 0;
	font-size: 14px;
	color: #dddddd;
}

/* ================================
   MESSAGES
================================ */
.success-message {
	color: green;
	font-size: 15px;
}

.error-message {
	color: red;
	font-size: 14px;
}
</style>


<!-- ================================
     NAVBAR
================================ -->

<nav class="navbar navbar-expand-lg shadow-sm">

	<div class="container-fluid">

		<!-- RAYS LOGO -->

		<a class="navbar-brand" href="<%=ORSView.WELCOME_CTL%>"> <img
			src="<%=ORSView.APP_CONTEXT%>/img/customLogo.jpg" class="logo"
			alt="RAYS">

		</a>


		<!-- MOBILE BUTTON -->

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarContent" aria-controls="navbarContent"
			aria-expanded="false" aria-label="Toggle navigation">

			<span class="navbar-toggler-icon"></span>

		</button>


		<!-- MENU -->

		<div class="collapse navbar-collapse" id="navbarContent">

			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<%
				if (isLogin) {
				%>


				<!-- WELCOME DROPDOWN -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="profileDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<b> <%=welcomeMsg + userBean.getFirstName() + " (" + roleName + ")"%>
					</b>
				</a>

					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="profileDropdown">

						<li><a class="dropdown-item"
							href="<%=ORSView.MY_PROFILE_CTL%>"> My Profile </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.CHANGE_PASSWORD_CTL%>"> Change Password </a></li>

					</ul></li>


				<!-- ROLE -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="roleDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						Role </a>

					<ul class="dropdown-menu" aria-labelledby="roleDropdown">

						<li><a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>">

								Add Role </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.ROLE_LIST_CTL%>"> Role List </a></li>

					</ul></li>


				<!-- USER -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						User </a>

					<ul class="dropdown-menu" aria-labelledby="userDropdown">

						<li><a class="dropdown-item" href="<%=ORSView.USER_CTL%>">

								Add User </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.USER_LIST_CTL%>"> User List </a></li>

					</ul></li>


				<!-- STUDENT -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="studentDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						Student </a>

					<ul class="dropdown-menu" aria-labelledby="studentDropdown">

						<li><a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>">

								Add Student </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.STUDENT_LIST_CTL%>"> Student List </a></li>

					</ul></li>


				<!-- COLLEGE -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="collegeDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						College </a>

					<ul class="dropdown-menu" aria-labelledby="collegeDropdown">

						<li><a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>">

								Add College </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.COLLEGE_LIST_CTL%>"> College List </a></li>

					</ul></li>


				<!-- MARKSHEET -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="marksheetDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						Marksheet </a>

					<ul class="dropdown-menu" aria-labelledby="marksheetDropdown">

						<li><a class="dropdown-item"
							href="<%=ORSView.MARKSHEET_CTL%>"> Add Marksheet </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.MARKSHEET_LIST_CTL%>"> Marksheet List </a></li>

					</ul></li>


				<!-- COURSE -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="courseDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						Course </a>

					<ul class="dropdown-menu" aria-labelledby="courseDropdown">

						<li><a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>">

								Add Course </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.COURSE_LIST_CTL%>"> Course List </a></li>

					</ul></li>


				<!-- SUBJECT -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="subjectDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						Subject </a>

					<ul class="dropdown-menu" aria-labelledby="subjectDropdown">

						<li><a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>">

								Add Subject </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.SUBJECT_LIST_CTL%>"> Subject List </a></li>

					</ul></li>


				<!-- FACULTY -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="facultyDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						Faculty </a>

					<ul class="dropdown-menu" aria-labelledby="facultyDropdown">

						<li><a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>">

								Add Faculty </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.FACULTY_LIST_CTL%>"> Faculty List </a></li>

					</ul></li>

				<!-- Module-->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="facultyDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						Module </a>

					<ul class="dropdown-menu" aria-labelledby="gymmemberDropdown">

						<li><a class="dropdown-item"
							href="<%=ORSView.GYMMEMBER_CTL%>"> Add Gym Member</a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.GYMMEMBER_LIST_CTL%>"> Gym Member List </a></li>

						<li><a class="dropdown-item" href="<%=ORSView.VOTER_CTL%>">
								Add Voter </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.VOTER_LIST_CTL%>"> Voter List </a></li>


						<li><a class="dropdown-item"
							href="<%=ORSView.FOODORDER_CTL%>"> Add Food Order </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.FOODORDER_LIST_CTL%>"> Food Order List </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.PATIENT_CTL%>"> Add  Patient </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.PATIENT_LIST_CTL%>"> Patient List </a></li>

					</ul></li>



				<%-- 	<!-- TIMETABLE -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="timetableDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">

						Timetable </a>

					<ul class="dropdown-menu" aria-labelledby="timetableDropdown">

						<li><a class="dropdown-item"
							href="<%=ORSView.TIMETABLE_CTL%>"> Add Timetable </a></li>

						<li><a class="dropdown-item"
							href="<%=ORSView.TIMETABLE_LIST_CTL%>"> Timetable List </a></li>

					</ul></li>
 --%>

				<!-- LOGOUT -->

				<li class="nav-item"><a class="nav-link text-danger fw-bold"
					href="LoginCtl?operation=logout"> Logout </a></li>


				<%
				}
				%>


				<%
				if (!isLogin) {
				%>


				<!-- WELCOME -->

				<li class="nav-item"><a class="nav-link"
					href="<%=ORSView.WELCOME_CTL%>"> Welcome </a></li>


				<!-- LOGIN -->

				<li class="nav-item"><a class="nav-link"
					href="<%=ORSView.LOGIN_CTL%>"> Login </a></li>


				<!-- SIGN UP -->

				<li class="nav-item"><a class="nav-link"
					href="<%=ORSView.USER_REGISTRATION_CTL%>"> SignUp </a></li>


				<%
				}
				%>

			</ul>

		</div>

		<!-- Language Dropdown -->
		<td style="width: 120px; text-align: center;">

			<form style="margin: 0;">
				<select name="lang" onchange="this.form.submit()">

					<option value="en" <%=("en".equals(locale)) ? "selected" : ""%>>English</option>
					<option value="hi" <%=("hi".equals(locale)) ? "selected" : ""%>>Hindi</option>

				</select>
			</form>

		</td>
</nav>


<!-- Bootstrap JS -->

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
	
</script>