<%@page import="in.co.rays.proj4.bean.CollegeBean"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.controller.StudentCtl"%>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">

<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
    body {
        background-color: #f8f9fa;
    }

    .student-card {
        width: 650px;
        margin: 40px auto;
        border: none;
        border-radius: 12px;
    }

    .student-card .card-header {
        background-color: #212529;
        color: white;
        text-align: center;
        padding: 18px;
        border-radius: 12px 12px 0 0;
    }

    .student-card .card-body {
        padding: 30px;
    }

    .form-label {
        font-weight: 600;
        white-space: nowrap;
    }

    .required {
        color: red;
    }

    .error-message {
        color: red;
        font-size: 13px;
        min-width: 150px;
    }

    .form-control,
    .form-select {
        border-radius: 7px;
    }

    .btn-save {
        min-width: 120px;
        border-radius: 7px;
    }
</style>

</head>

<body>

<%@ include file="Header.jsp"%>

<%
    StudentBean bean = (StudentBean) ServletUtility.getBean(request);

    String _suc = ServletUtility.getSuccessMessage(request);
    String _err = ServletUtility.getErrorMessage(request);

    List<CollegeBean> collegeList =
            (List<CollegeBean>) request.getAttribute("collegeList");
%>

<form action="<%=ORSView.STUDENT_CTL%>" method="post">

    <input type="hidden" name="id"
        value="<%=DataUtility.getStringData(bean != null ? bean.getId() : 0)%>">

    <div class="card student-card shadow">

        <!-- Header -->
        <div class="card-header">

            <h3 class="mb-0">
                <i class="bi bi-person-vcard-fill me-2"></i>

                <%=bean != null && bean.getId() > 0
                        ? "Update Student"
                        : "Add Student"%>
            </h3>

        </div>

        <div class="card-body">

            <!-- Success Message -->
            <% if (_suc != null && !_suc.isEmpty()) { %>

            <div class="alert alert-success d-flex align-items-center"
                role="alert">

                <i class="bi bi-check-circle-fill me-2"></i>

                <div>
                    <%=_suc%>
                </div>

            </div>

            <% } %>


            <!-- Error Message -->
            <% if (_err != null && !_err.isEmpty()) { %>

            <div class="alert alert-danger d-flex align-items-center"
                role="alert">

                <i class="bi bi-exclamation-triangle-fill me-2"></i>

                <div>
                    <%=_err%>
                </div>

            </div>

            <% } %>


            <table class="table table-borderless align-middle">

                <!-- First Name -->
                <tr>

                    <th class="form-label">
                        <i class="bi bi-person-fill text-primary me-1"></i>
                        First Name <span class="required">*</span>
                    </th>

                    <td>
                        <input type="text"
                            name="firstName"
                            value="<%=DataUtility.getStringData(
                                    bean != null ? bean.getFirstName() : "")%>"
                            placeholder="Enter your first name"
                            class="form-control">
                    </td>

                    <td class="error-message">
                        <%=ServletUtility.getErrorMessage("firstName", request)%>
                    </td>

                </tr>


                <!-- Last Name -->
                <tr>

                    <th class="form-label">
                        <i class="bi bi-person-fill text-primary me-1"></i>
                        Last Name <span class="required">*</span>
                    </th>

                    <td>
                        <input type="text"
                            name="lastName"
                            value="<%=DataUtility.getStringData(
                                    bean != null ? bean.getLastName() : "")%>"
                            placeholder="Enter your last name"
                            class="form-control">
                    </td>

                    <td class="error-message">
                        <%=ServletUtility.getErrorMessage("lastName", request)%>
                    </td>

                </tr>


                <!-- DOB -->
                <tr>

                    <th class="form-label">
                        <i class="bi bi-calendar-event-fill text-danger me-1"></i>
                        DOB <span class="required">*</span>
                    </th>

                    <td>
                        <input type="date"
                            name="dob"
                            value="<%=bean != null && bean.getDob() != null
                                    ? DataUtility.getDateString(bean.getDob())
                                    : ""%>"
                            class="form-control">
                    </td>

                    <td class="error-message">
                        <%=ServletUtility.getErrorMessage("dob", request)%>
                    </td>

                </tr>


                <!-- Mobile Number -->
                <tr>

                    <th class="form-label">
                        <i class="bi bi-phone-fill text-success me-1"></i>
                        Mobile No <span class="required">*</span>
                    </th>

                    <td>
                        <input type="text"
                            name="mobileNo"
                            value="<%=DataUtility.getStringData(
                                    bean != null ? bean.getMobileNo() : "")%>"
                            placeholder="Enter mobile number"
                            class="form-control">
                    </td>

                    <td class="error-message">
                        <%=ServletUtility.getErrorMessage("mobileNo", request)%>
                    </td>

                </tr>


                <!-- Email -->
                <tr>

                    <th class="form-label">
                        <i class="bi bi-envelope-fill text-warning me-1"></i>
                        Email <span class="required">*</span>
                    </th>

                    <td>
                        <input type="email"
                            name="email"
                            value="<%=DataUtility.getStringData(
                                    bean != null ? bean.getEmail() : "")%>"
                            placeholder="Enter email"
                            class="form-control">
                    </td>

                    <td class="error-message">
                        <%=ServletUtility.getErrorMessage("email", request)%>
                    </td>

                </tr>


                <!-- College -->
                <tr>

                    <th class="form-label">
                        <i class="bi bi-building-fill text-info me-1"></i>
                        College Name <span class="required">*</span>
                    </th>

                    <td>
                        <%=HTMLUtility.getList(
                                "collegeId",
                                bean != null
                                    ? DataUtility.getStringData(bean.getCollegeId())
                                    : "",
                                collegeList)%>
                    </td>

                    <td class="error-message">
                        <%=ServletUtility.getErrorMessage("collegeId", request)%>
                    </td>

                </tr>


                <!-- Submit -->
                <tr>

                    <th></th>

                    <td>

                        <input type="submit"
                            name="operation"
                            value="<%=bean != null && bean.getId() > 0
                                    ? "Update"
                                    : BaseCtl.OP_SAVE%>"
                            class="btn btn-primary btn-save">

                    </td>

                </tr>

            </table>

        </div>

    </div>

</form>

<%@ include file="Footer.jsp"%>

</body>
</html>