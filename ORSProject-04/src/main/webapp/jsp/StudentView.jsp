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

    <!-- Hidden ID -->
    <input type="hidden" name="id"
        value="<%=DataUtility.getStringData(bean != null ? bean.getId() : 0)%>">

    <div align="center">

        <!-- Page Heading -->
        <h1>
            <%=bean != null && bean.getId() > 0
                    ? "Update Student"
                    : "Add Student"%>
        </h1>

        <!-- Success Message -->
        <h3 style="color: green">
            <%=_suc%>
        </h3>

        <!-- Error Message -->
        <h3 style="color: red">
            <%=_err%>
        </h3>

        <table>

            <!-- First Name -->
            <tr>

                <th>
                    FirstName
                    <font color="red">*</font>
                </th>

                <td>
                    <input type="text"
                           name="firstName"
                           value="<%=DataUtility.getStringData(
                                   bean != null ? bean.getFirstName() : "")%>"
                           placeholder="enter your firstName">
                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("firstName", request)%>
                </td>

            </tr>


            <!-- Last Name -->
            <tr>

                <th>
                    LastName
                    <font color="red">*</font>
                </th>

                <td>
                    <input type="text"
                           name="lastName"
                           value="<%=DataUtility.getStringData(
                                   bean != null ? bean.getLastName() : "")%>"
                           placeholder="enter your lastName">
                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("lastName", request)%>
                </td>

            </tr>


            <!-- DOB -->
            <tr>

                <th>
                    DOB
                    <font color="red">*</font>
                </th>

                <td>
                    <input type="date"
                           name="dob"
                           value="<%=bean != null && bean.getDob() != null
                                   ? DataUtility.getDateString(bean.getDob())
                                   : ""%>"
                           placeholder="enter dob">
                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("dob", request)%>
                </td>

            </tr>


            <!-- Mobile Number -->
            <tr>

                <th>
                    Mobile No
                    <font color="red">*</font>
                </th>

                <td>
                    <input type="text"
                           name="mobileNo"
                           value="<%=DataUtility.getStringData(
                                   bean != null ? bean.getMobileNo() : "")%>"
                           placeholder="enter a mobile no">
                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("mobileNo", request)%>
                </td>

            </tr>


            <!-- Email -->
            <tr>

                <th>
                    Email
                    <font color="red">*</font>
                </th>

                <td>
                    <input type="email"
                           name="email"
                           value="<%=DataUtility.getStringData(
                                   bean != null ? bean.getEmail() : "")%>"
                           placeholder="enter email">
                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("email", request)%>
                </td>

            </tr>


            <!-- College -->
            <tr>

                <th>
                    College Name
                    <font color="red">*</font>
                </th>

                <td>
                    <%=HTMLUtility.getList(
                            "collegeId",
                            bean != null
                                    ? DataUtility.getStringData(bean.getCollegeId())
                                    : "",
                            collegeList)%>
                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("collegeId", request)%>
                </td>

            </tr>


            <!-- Submit Button -->
            <tr>

                <th></th>

                <td>

                    <input type="submit"
                           name="operation"
                           value="<%=bean != null && bean.getId() > 0
                                   ? "Update"
                                   : BaseCtl.OP_SAVE%>">

                </td>

            </tr>

        </table>

    </div>

</form>

<%@ include file="Footer.jsp"%>

</body>

</html>