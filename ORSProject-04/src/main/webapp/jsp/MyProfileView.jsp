<%@page import="in.co.rays.proj4.bean.UserBean"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<%
    UserBean bean = (UserBean) request.getAttribute("bean");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>My Profile</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>

<body>

<%@ include file="Header.jsp"%>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-7">

            <div class="card shadow-sm">

                <div class="card-header text-center">
                    <h3 class="mb-0">
                        <i class="bi bi-person-circle"></i>
                        My Profile
                    </h3>
                </div>

                <div class="card-body">

                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <i class="bi bi-person"></i> Name
                        </label>

                        <input type="text"
                               class="form-control"
                               value="<%=DataUtility.getStringData(bean.getFirstName())%> <%=DataUtility.getStringData(bean.getLastName())%>"
                               readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <i class="bi bi-envelope"></i> Login
                        </label>

                        <input type="text"
                               class="form-control"
                               value="<%=DataUtility.getStringData(bean.getLogin())%>"
                               readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <i class="bi bi-lock"></i> Password
                        </label>

                        <input type="password"
                               class="form-control"
                               value="<%=DataUtility.getStringData(bean.getPassword())%>"
                               readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <i class="bi bi-calendar"></i> Date of Birth
                        </label>

                        <input type="text"
                               class="form-control"
                               value="<%=DataUtility.getDateString(bean.getDob())%>"
                               readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">
                            <i class="bi bi-gender-ambiguous"></i> Gender
                        </label>

                        <input type="text"
                               class="form-control"
                               value="<%=DataUtility.getStringData(bean.getGender())%>"
                               readonly>
                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<%@ include file="Footer.jsp"%>

</body>
</html>