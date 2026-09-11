<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.bean.MarksheetBean"%>
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

	<jsp:useBean id="bean" class="in.co.rays.proj4.bean.MarksheetBean"
		scope="request"></jsp:useBean>


	<form action="<%=ORSView.MARKSHEET_CTL%>" method="post">

		<input type="hidden" name="id"
			value="<%=DataUtility.getStringData(bean.getId())%>">

		<div align="center">

			<h1>
				<%=bean != null && bean.getId() > 0 ? "Update Marksheet" : "Add Marksheet"%>
			</h1>

			<h3 style="color: green"><%=_suc%></h3>
			<h3 style="color: red"><%=_err%></h3>

			<table>

				<tr>
					<th>Roll No</th>
					<td><input type="text" name="rollNo"
						value="<%=DataUtility.getStringData(bean.getRollNo())%>"
						placeholder="Enter roll no"></td>
				</tr>

				<tr>
					<th>Name</th>
					<td><input type="text" name="name"
						value="<%=DataUtility.getStringData(bean.getName())%>"
						placeholder="Enter name"></td>
				</tr>

				<tr>
					<th>Physics</th>
					<td><input type="text" name="physics"
						value="<%=DataUtility.getStringData(bean.getPhysics())%>"
						placeholder="Enter physics marks"></td>
				</tr>

				<tr>
					<th>Chemistry</th>
					<td><input type="text" name="chemistry"
						value="<%=DataUtility.getStringData(bean.getChemistry())%>"
						placeholder="Enter chemistry marks"></td>
				</tr>

				<tr>
					<th>Maths</th>
					<td><input type="text" name="maths"
						value="<%=DataUtility.getStringData(bean.getMaths())%>"
						placeholder="Enter maths marks"></td>
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