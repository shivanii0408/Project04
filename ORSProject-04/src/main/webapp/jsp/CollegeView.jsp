<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="Header.jsp"%>
	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	%>

<jsp:useBean id="bean" class="in.co.rays.proj4.bean.CollegeBean"
		scope="request"></jsp:useBean>

	<form action="<%=ORSView.COLLEGE_CTL%>" method="post">

<input type="hidden" name="id"
			value="<%=DataUtility.getStringData(bean.getId())%>">

		<div align="center">
		
		<h1>
				<%=bean != null && bean.getId() > 0 ? "Update college" : "Add college"%>
			</h1>

			

			<h3 style="color: green"><%=_suc%></h3>
			<h3 style="color: red"><%=_err%></h3>

			<table>

				<tr>
					<th>Name<font color="red">*</font></th>
					<td><input type="text" name="name" value=""
						placeholder="enter college name"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("name", request)%></td>
				</tr>

				<tr>
					<th>Address<font color="red">*</font></th>
					<td><input type="text" name="address" value=""
						placeholder="enter address"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("address", request)%></td>
				</tr>
				
				<tr>
					<th>State<font color="red">*</font></th>
					<td><input type="text" name="state" value=""
						placeholder="enter state"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("state", request)%></td>
				</tr>
				
				<tr>
					<th>City<font color="red">*</font></th>
					<td><input type="text" name="city" value=""
						placeholder="enter city"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("city", request)%></td>
				</tr>

                <tr>
					<th>Phone no<font color="red">*</font></th>
					<td><input type="text" name="phoneNo" value=""
						placeholder="enter phone no"></td>
					<td style="color: red"><%=ServletUtility.getErrorMessage("phoneNo", request)%></td>
				</tr>
				
				<tr>
					<th></th>
								<td><input type="submit" name="operation"
						value="<%=bean != null && bean.getId() > 0 ? "Update" : BaseCtl.OP_SAVE%>"></td>
				</tr>

			</table>

		</div>

	</form>
	<%@ include file="Footer.jsp"%>

</body>
</html>