<%@page import="in.co.rays.proj4.controller.UserRegistrationCtl"%>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>User</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

body {
    background-color: #ffffff;
}

.user-container {
    min-height: 75vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 30px 15px;
}

.user-card {
    width: 100%;
    max-width: 850px;
    border: none;
    border-radius: 15px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.10);
}

.user-header {
    text-align: center;
    background-color: white;
    border-bottom: 1px solid #eeeeee;
    padding: 20px;
    border-radius: 15px 15px 0 0;
}

.user-header h1 {
    margin: 0;
    font-size: 30px;
    font-weight: 600;
}

.user-body {
    padding: 30px 45px;
}

.form-label {
    font-weight: 600;
}

.required {
    color: red;
}

.form-control,
.form-select {
    border-radius: 8px;
    min-height: 42px;
}

.form-control:focus,
.form-select:focus {
    border-color: #0d6efd;
    box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.15);
}

.error-message {
    color: red;
    font-size: 13px;
    margin-top: 4px;
}

.photo-section {
    text-align: center;
    margin-bottom: 25px;
}

.user-photo {
    width: 90px;
    height: 90px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid #dee2e6;
    margin-bottom: 12px;
}

.photo-section input[type="file"] {
    max-width: 300px;
    margin: auto;
}

.action-btn {
    min-width: 120px;
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

String _suc = ServletUtility.getSuccessMessage(request);

String _err = ServletUtility.getErrorMessage(request);

%>

<jsp:useBean id="bean"
    class="in.co.rays.proj4.bean.UserBean"
    scope="request">
</jsp:useBean>


<form action="<%=ORSView.USER_CTL%>" method="post">

<input type="hidden"
    name="id"
    value="<%=DataUtility.getStringData(bean.getId())%>">


<div class="user-container">

<div class="card user-card">


<!-- HEADER -->

<div class="user-header">

<h1>

<i class="bi bi-person-circle text-primary"></i>

<%=bean != null && bean.getId() > 0
    ? "Update User"
    : "Add User"%>

</h1>

</div>


<div class="user-body">


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


<!-- PHOTO -->

<div class="photo-section">

<label class="form-label d-block">

<i class="bi bi-camera-fill text-primary"></i>

Photo

</label>

<img
    src="<%=ORSView.UPLOAD_PHOTO_CTL%>?id=<%=bean.getId()%>"
    onerror="this.style.display='none';"
    alt="User Photo"
    class="user-photo d-block mx-auto">

<input
    type="file"
    name="photo"
    accept="image/*"
    class="form-control mb-2">

<input
    type="submit"
    value="Upload Photo"
    class="btn btn-outline-primary btn-sm action-btn">

</div>


<!-- FIRST NAME -->

<div class="mb-3">

<label class="form-label">

<i class="bi bi-person-fill text-primary"></i>

First Name <span class="required">*</span>

</label>

<input
    type="text"
    name="firstName"
    value="<%=DataUtility.getStringData(bean.getFirstName())%>"
    placeholder="Enter your first name"
    class="form-control">

<div class="error-message">
<%=ServletUtility.getErrorMessage("firstName", request)%>
</div>

</div>


<!-- LAST NAME -->

<div class="mb-3">

<label class="form-label">

<i class="bi bi-person-fill text-primary"></i>

Last Name <span class="required">*</span>

</label>

<input
    type="text"
    name="lastName"
    value="<%=DataUtility.getStringData(bean.getLastName())%>"
    placeholder="Enter your last name"
    class="form-control">

<div class="error-message">
<%=ServletUtility.getErrorMessage("lastName", request)%>
</div>

</div>


<!-- LOGIN -->

<div class="mb-3">

<label class="form-label">

<i class="bi bi-envelope-fill text-primary"></i>

Login <span class="required">*</span>

</label>

<input
    type="text"
    name="login"
    value="<%=DataUtility.getStringData(bean.getLogin())%>"
    placeholder="Enter an email"
    class="form-control">

<div class="error-message">
<%=ServletUtility.getErrorMessage("login", request)%>
</div>

</div>


<!-- PASSWORD -->

<div class="mb-3">

<label class="form-label">

<i class="bi bi-lock-fill text-danger"></i>

Password <span class="required">*</span>

</label>

<input
    type="password"
    name="password"
    value="<%=DataUtility.getStringData(bean.getPassword())%>"
    placeholder="Enter a password"
    class="form-control">

<div class="error-message">
<%=ServletUtility.getErrorMessage("password", request)%>
</div>

</div>


<!-- CONFIRM PASSWORD -->

<div class="mb-3">

<label class="form-label">

<i class="bi bi-shield-lock-fill text-warning"></i>

Confirm Password <span class="required">*</span>

</label>

<input
    type="password"
    name="confirmPassword"
    value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>"
    placeholder="Re-enter your password"
    class="form-control">

<div class="error-message">
<%=ServletUtility.getErrorMessage("confirmPassword", request)%>
</div>

</div>


<!-- ROLE -->

<div class="mb-3">

<label class="form-label">

<i class="bi bi-person-badge-fill text-success"></i>

Role <span class="required">*</span>

</label>

<select class="form-select" name="roleId">

<option value="">-------------Select------------</option>

<option value="1"
<%=bean.getRoleId() == 1 ? "selected" : ""%>>
Admin
</option>

<option value="2"
<%=bean.getRoleId() == 2 ? "selected" : ""%>>
Student
</option>

<option value="3"
<%=bean.getRoleId() == 3 ? "selected" : ""%>>
College
</option>

<option value="4"
<%=bean.getRoleId() == 4 ? "selected" : ""%>>
KIOSK
</option>

</select>

<div class="error-message">
<%=ServletUtility.getErrorMessage("roleId", request)%>
</div>

</div>


<!-- GENDER -->

<div class="mb-3">

<label class="form-label">

<i class="bi bi-gender-ambiguous text-info"></i>

Gender <span class="required">*</span>

</label>

<select class="form-select" name="gender">

<option value="">-------------Select------------</option>

<option value="female"
<%="female".equals(bean.getGender()) ? "selected" : ""%>>
Female
</option>

<option value="male"
<%="male".equals(bean.getGender()) ? "selected" : ""%>>
Male
</option>

</select>

<div class="error-message">
<%=ServletUtility.getErrorMessage("gender", request)%>
</div>

</div>


<!-- DOB -->

<div class="mb-4">

<label class="form-label">

<i class="bi bi-calendar-date-fill text-primary"></i>

Date of Birth <span class="required">*</span>

</label>

<input
    type="date"
    name="dob"
    value="<%=DataUtility.getStringData(bean.getDob())%>"
    class="form-control">

<div class="error-message">
<%=ServletUtility.getErrorMessage("dob", request)%>
</div>

</div>


<!-- SUBMIT -->

<div class="text-center">

<input
    type="submit"
    name="operation"
    value="<%=UserRegistrationCtl.OP_SIGN_UP%>"
    class="btn btn-primary action-btn">

</div>


</div>

</div>

</div>

</form>


<%@ include file="Footer.jsp"%>

</body>

</html>