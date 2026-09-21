<%@page import="in.co.rays.proj4.util.DataUtility"%>

<%@page import="in.co.rays.proj4.controller.LoginCtl"%>

<%@page import="in.co.rays.proj4.util.ServletUtility"%>

<%@page import="in.co.rays.proj4.controller.BaseCtl"%>

<%@page import="in.co.rays.proj4.controller.ORSView"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Change Password</title>

</head>

<body>

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean"
        scope="request"></jsp:useBean>

    <%@ include file="Header.jsp"%>

    <%

    String _suc = ServletUtility.getSuccessMessage(request);

    String _err = ServletUtility.getErrorMessage(request);

    %>


    <form action="<%=ORSView.CHANGE_PASSWORD_CTL%>" method="post">

        <div align="center">

            <h1>Change Password</h1>

            <h3 style="color: green"><%=_suc%></h3>

            <h3 style="color: red"><%=_err%></h3>


            <table>

                <!-- LOGIN -->

                <tr>

                    <th>
                        <%=ms.get("login.userid")%>
                        <font color="red">*</font>
                    </th>

                    <td>
                        <input type="text" name="login"
                            value="<%=DataUtility.getStringData(bean.getLogin())%>"
                            placeholder="Enter your login">
                    </td>

                    <td style="color: red">
                        <%=ServletUtility.getErrorMessage("login", request)%>
                    </td>

                </tr>


                <!-- OLD PASSWORD -->

                <tr>

                    <th>
                        Old Password
                        <font color="red">*</font>
                    </th>

                    <td>
                        <input type="password" name="oldPassword"
                            placeholder="Enter your old password">
                    </td>

                    <td style="color: red">
                        <%=ServletUtility.getErrorMessage("oldPassword", request)%>
                    </td>

                </tr>


                <!-- NEW PASSWORD -->

                <tr>

                    <th>
                        New Password
                        <font color="red">*</font>
                    </th>

                    <td>
                        <input type="password" name="newPassword"
                            placeholder="Enter your new password">
                    </td>

                    <td style="color: red">
                        <%=ServletUtility.getErrorMessage("newPassword", request)%>
                    </td>

                </tr>


                <!-- SUBMIT BUTTON -->

                <tr>

                    <th></th>

                    <td>
                        <input type="submit" name="operation"
                            value="<%=BaseCtl.OP_GO%>">
                    </td>

                </tr>

            </table>

        </div>

    </form>


    <%@ include file="Footer.jsp"%>

</body>

</html>