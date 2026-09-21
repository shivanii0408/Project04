<%@page import="in.co.rays.proj4.controller.UserRegistrationCtl"%>
<%@page import="in.co.rays.proj4.controller.LoginCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Registration</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
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

}


/* Registration Section */

.registration-container {

    min-height: 75vh;

    display: flex;

    justify-content: center;

    align-items: center;

    padding: 30px 15px;

}


/* Registration Card */

.registration-card {

    width: 100%;

    max-width: 700px;

    border: none;

    border-radius: 15px;

    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.10);

    background-color: #ffffff;

}


/* Header */

.registration-header {

    text-align: center;

    background-color: #ffffff;

    border-bottom: 1px solid #eeeeee;

    padding: 22px;

    border-radius: 15px 15px 0 0;

}


.registration-header h1 {

    margin: 0;

    font-size: 30px;

    font-weight: 600;

    color: #212529;

}


.registration-header i {

    font-size: 28px;

    margin-right: 8px;

}


/* Card Body */

.registration-body {

    padding: 30px 40px;

}


/* Labels */

.form-label {

    font-weight: 600;

    color: #343a40;

}


/* Inputs */

.form-control {

    height: 44px;

    border-radius: 8px;

    border: 1px solid #ced4da;

}


.form-control:focus {

    border-color: #0d6efd;

    box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.15);

}


/* Error Messages */

.error-message {

    color: #dc3545;

    font-size: 13px;

    margin-top: 5px;

}


/* Button */

.register-btn {

    height: 44px;

    padding: 0 30px;

    border-radius: 8px;

    font-weight: 600;

}


/* Alerts */

.alert {

    border-radius: 8px;

}


/* Required Star */

.required {

    color: #dc3545;

}

</style>

</head>


<body>


<%@ include file="Header.jsp"%>


<%

String _suc = ServletUtility.getSuccessMessage(request);

String _err = ServletUtility.getErrorMessage(request);

%>


<!-- Bootstrap Alert Icons -->

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">

    <symbol id="check-circle-fill"
        fill="currentColor"
        viewBox="0 0 16 16">

        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>

    </symbol>


    <symbol id="exclamation-triangle-fill"
        fill="currentColor"
        viewBox="0 0 16 16">

        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>

    </symbol>

</svg>



<form action="<%=ORSView.USER_REGISTRATION_CTL%>" method="post">


    <div class="registration-container">


        <div class="card registration-card">


            <!-- HEADER -->

            <div class="registration-header">

                <h1>

                    <i class="bi bi-person-plus-fill text-primary"></i>

                    Registration

                </h1>

            </div>



            <!-- BODY -->

            <div class="registration-body">


                <!-- SUCCESS MESSAGE -->

                <%

                if (_suc != null && !_suc.isEmpty()) {

                %>

                <div class="alert alert-success d-flex align-items-center"
                    role="alert">

                    <svg class="bi flex-shrink-0 me-2"
                        width="20"
                        height="20"
                        role="img"
                        aria-label="Success:">

                        <use xlink:href="#check-circle-fill"></use>

                    </svg>

                    <div>

                        <%= _suc %>

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

                    <svg class="bi flex-shrink-0 me-2"
                        width="20"
                        height="20"
                        role="img"
                        aria-label="Error:">

                        <use xlink:href="#exclamation-triangle-fill"></use>

                    </svg>

                    <div>

                        <%= _err %>

                    </div>

                </div>

                <%

                }

                %>



                <!-- FIRST NAME -->

                <div class="mb-3">

                    <label class="form-label">

                        <i class="bi bi-person text-primary"></i>

                        First Name

                        <span class="required">*</span>

                    </label>

                    <input type="text"
                        name="firstName"
                        value=""
                        placeholder="Enter your first name"
                        class="form-control">

                    <div class="error-message">

                        <%=ServletUtility.getErrorMessage("firstName", request)%>

                    </div>

                </div>



                <!-- LAST NAME -->

                <div class="mb-3">

                    <label class="form-label">

                        <i class="bi bi-person text-primary"></i>

                        Last Name

                        <span class="required">*</span>

                    </label>

                    <input type="text"
                        name="lastName"
                        value=""
                        placeholder="Enter your last name"
                        class="form-control">

                    <div class="error-message">

                        <%=ServletUtility.getErrorMessage("lastName", request)%>

                    </div>

                </div>



                <!-- LOGIN -->

                <div class="mb-3">

                    <label class="form-label">

                        <i class="bi bi-envelope text-primary"></i>

                        Login

                        <span class="required">*</span>

                    </label>

                    <input type="text"
                        name="login"
                        value=""
                        placeholder="Enter your email"
                        class="form-control">

                    <div class="error-message">

                        <%=ServletUtility.getErrorMessage("login", request)%>

                    </div>

                </div>



                <!-- PASSWORD -->

                <div class="mb-3">

                    <label class="form-label">

                        <i class="bi bi-lock-fill text-primary"></i>

                        Password

                        <span class="required">*</span>

                    </label>

                    <input type="password"
                        name="password"
                        value=""
                        placeholder="Enter your password"
                        class="form-control">

                    <div class="error-message">

                        <%=ServletUtility.getErrorMessage("password", request)%>

                    </div>

                </div>



                <!-- CONFIRM PASSWORD -->

                <div class="mb-3">

                    <label class="form-label">

                        <i class="bi bi-shield-lock-fill text-primary"></i>

                        Confirm Password

                        <span class="required">*</span>

                    </label>

                    <input type="password"
                        name="confirmPassword"
                        value=""
                        placeholder="Re-enter your password"
                        class="form-control">

                    <div class="error-message">

                        <%=ServletUtility.getErrorMessage("confirmPassword", request)%>

                    </div>

                </div>



                <!-- GENDER -->

                <div class="mb-3">

                    <label class="form-label">

                        <i class="bi bi-gender-ambiguous text-primary"></i>

                        Gender

                        <span class="required">*</span>

                    </label>

                    <select class="form-control"
                        name="gender">

                        <option selected value="">
                            ----------- Select Gender -----------
                        </option>

                        <option value="female">
                            Female
                        </option>

                        <option value="male">
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

                        <i class="bi bi-calendar-event text-primary"></i>

                        Date of Birth

                        <span class="required">*</span>

                    </label>

                    <input type="date"
                        name="dob"
                        value=""
                        class="form-control">

                    <div class="error-message">

                        <%=ServletUtility.getErrorMessage("dob", request)%>

                    </div>

                </div>



                <!-- REGISTER BUTTON -->

                <div class="text-center">

                    <input type="submit"
                        name="operation"
                        value="<%=UserRegistrationCtl.OP_SIGN_UP%>"
                        class="btn btn-primary register-btn">

                </div>


            </div>

        </div>

    </div>

</form>


<%@ include file="Footer.jsp"%>


</body>

</html>