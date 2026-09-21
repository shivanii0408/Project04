<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Role</title>

<!-- Bootstrap CSS -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    crossorigin="anonymous">

<!-- Bootstrap Icons -->

<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


<style type="text/css">

body {
    background-color: #ffffff;
}

.role-container {
    min-height: 75vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 30px 15px;
}

.role-card {
    width: 100%;
    max-width: 600px;
    border: none;
    border-radius: 15px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.10);
}

.role-header {
    text-align: center;
    background-color: white;
    border-bottom: 1px solid #eeeeee;
    padding: 20px;
    border-radius: 15px 15px 0 0;
}

.role-header h1 {
    margin: 0;
    font-size: 30px;
    font-weight: 600;
}

.role-header i {
    margin-right: 8px;
}

.role-body {
    padding: 30px 40px;
}

.form-label {
    font-weight: 600;
}

.form-control {
    height: 44px;
    border-radius: 8px;
}

.form-control:focus {
    border-color: #0d6efd;
    box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.15);
}

.required {
    color: red;
}

.error-message {
    color: red;
    font-size: 13px;
    margin-top: 5px;
}

.role-btn {
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

String _suc = ServletUtility.getSuccessMessage(request);

String _err = ServletUtility.getErrorMessage(request);

%>


<jsp:useBean id="bean"
    class="in.co.rays.proj4.bean.RoleBean"
    scope="request">
</jsp:useBean>


<form action="<%=ORSView.ROLE_CTL%>" method="post">

<input type="hidden"
    name="id"
    value="<%=DataUtility.getStringData(bean.getId())%>">


<div class="role-container">

    <div class="card role-card">


        <!-- CARD HEADER -->

        <div class="role-header">

            <h1>

                <i class="bi bi-person-badge-fill text-primary"></i>

                <%=bean != null && bean.getId() > 0
                    ? "Update Role"
                    : "Add Role"%>

            </h1>

        </div>


        <!-- CARD BODY -->

        <div class="role-body">


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


            <!-- ROLE NAME -->

            <div class="mb-4">

                <label class="form-label">

                    <i class="bi bi-person-badge text-primary"></i>

                    Role Name

                    <span class="required">*</span>

                </label>


                <input type="text"
                    name="name"
                    value="<%=DataUtility.getStringData(bean.getName())%>"
                    placeholder="Enter role name"
                    class="form-control">


                <div class="error-message">

                    <%=ServletUtility.getErrorMessage("name", request)%>

                </div>

            </div>



            <!-- DESCRIPTION -->

            <div class="mb-4">

                <label class="form-label">

                    <i class="bi bi-card-text text-primary"></i>

                    Description

                    <span class="required">*</span>

                </label>


                <input type="text"
                    name="description"
                    value="<%=DataUtility.getStringData(bean.getDescription())%>"
                    placeholder="Enter role description"
                    class="form-control">


                <div class="error-message">

                    <%=ServletUtility.getErrorMessage("description", request)%>

                </div>

            </div>



            <!-- BUTTON -->

            <div class="text-center">

                <input type="submit"
                    name="operation"
                    value="<%=bean != null && bean.getId() > 0
                        ? "Update"
                        : BaseCtl.OP_SAVE%>"
                    class="btn btn-primary role-btn">

            </div>


        </div>

    </div>

</div>

</form>


<%@ include file="Footer.jsp"%>


</body>

</html>