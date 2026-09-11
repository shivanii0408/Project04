<%@page import="in.co.rays.proj4.bean.CourseBean"%>
<%@page import="in.co.rays.proj4.bean.SubjectBean"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.proj4.controller.SubjectCtl"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Subject</title>

</head>

<body>

<%@ include file="Header.jsp"%>

<%
    String _suc = ServletUtility.getSuccessMessage(request);
    String _err = ServletUtility.getErrorMessage(request);

    List<CourseBean> courseList =
            (List<CourseBean>) request.getAttribute("courseList");
%>


<!-- Subject Bean -->

<jsp:useBean id="bean" class="in.co.rays.proj4.bean.SubjectBean"
    scope="request"></jsp:useBean>


<form action="<%=ORSView.SUBJECT_CTL%>" method="post">

    <!-- Hidden ID -->

    <input type="hidden" name="id"
        value="<%=DataUtility.getStringData(bean.getId())%>">


    <div align="center">

        <!-- Heading -->

        <h1>
            <%=bean != null && bean.getId() > 0
                    ? "Update Subject"
                    : "Add Subject"%>
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


            <!-- Name -->

            <tr>

                <th>
                    Name
                    <font color="red">*</font>
                </th>

                <td>

                    <input type="text"
                           name="name"
                           value="<%=DataUtility.getStringData(bean.getName())%>"
                           placeholder="enter subject name">

                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("name", request)%>
                </td>

            </tr>


            <!-- Description -->

            <tr>

                <th>
                    Description
                    <font color="red">*</font>
                </th>

                <td>

                    <input type="text"
                           name="description"
                           value="<%=DataUtility.getStringData(bean.getDescription())%>"
                           placeholder="enter description">

                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("description", request)%>
                </td>

            </tr>


            <!-- Course -->

            <tr>

                <th>
                    Course
                    <font color="red">*</font>
                </th>

                <td>

                    <%=HTMLUtility.getList(
                            "courseId",
                            DataUtility.getStringData(bean.getCourseId()),
                            courseList)%>

                </td>

                <td style="color: red">
                    <%=ServletUtility.getErrorMessage("courseId", request)%>
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
                                   : BaseCtl.OP_SAVE%>">

                </td>

            </tr>


        </table>

    </div>

</form>


<%@ include file="Footer.jsp"%>

</body>

</html>