<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.BaseCtl"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.bean.TimeTableBean"%>
<%@page import="in.co.rays.proj4.bean.CourseBean"%>
<%@page import="in.co.rays.proj4.bean.SubjectBean"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time Table</title>
<!-- Bootstrap CSS/JS already loaded via Header.jsp, isliye yahan dobara nahi liya -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">

<%@ include file="Header.jsp"%>
	<%
	String _suc = ServletUtility.getSuccessMessage(request);
	String _err = ServletUtility.getErrorMessage(request);
	List<CourseBean> courseList = (List) request.getAttribute("courseList");
	List<SubjectBean> subjectList = (List) request.getAttribute("subjectList");
	/* TimeTableBean bean = (TimeTableBean) request.getAttribute("bean"); */
	%>

    <jsp:useBean id="bean" class="in.co.rays.proj4.bean.TimeTableBean"
		scope="request"></jsp:useBean>

	<!-- FIX: extra bottom padding taaki fixed/sticky Footer Save button ko
	     overlap na kare -->
	<div class="container pt-5" style="padding-bottom: 100px !important;">
		<div class="row justify-content-center">
			<div class="col-md-10 col-lg-7">

				<div class="card shadow-lg border-0">

					<div class="card-header bg-white text-center py-3">
						<h3 class="mb-1 text-primary">
							<i class="bi bi-calendar3"></i>
							<%=bean != null && bean.getId() > 0 ? "Update TimeTable" : "Add TimeTable"%>
						</h3>
						<small class="text-muted">Manage ORS exam time table</small>
					</div>

					<div class="card-body p-4">

						<%
						if (_suc != null && _suc.length() > 0) {
						%>
						<div class="alert alert-success"><i
							class="bi bi-check-circle-fill"></i> <%=_suc%></div>
						<%
						}
						if (_err != null && _err.length() > 0) {
						%>
						<div class="alert alert-danger"><i
							class="bi bi-exclamation-triangle-fill"></i> <%=_err%></div>
						<%
						}
						%>

						<form action="<%=ORSView.TIMETABLE_CTL%>" method="post">

						<input type="hidden" name="id"
							value="<%=DataUtility.getStringData(bean.getId())%>">

							<!-- Semester + Exam Date side-by-side -->
							<div class="row">
								<div class="col-md-6 mb-3">
									<label class="form-label fw-bold"><i
										class="bi bi-mortarboard-fill text-primary"></i> Semester
										<span class="text-danger">*</span></label> <input type="text"
										name="semester" class="form-control"
										value="<%=DataUtility.getStringData(bean.getSemester())%>"
										placeholder="enter semester">
									<small class="text-danger"><%=ServletUtility.getErrorMessage("semester", request)%></small>
								</div>
								<div class="col-md-6 mb-3">
									<label class="form-label fw-bold"><i
										class="bi bi-calendar-event-fill text-danger"></i> Exam Date
										<span class="text-danger">*</span></label> <input type="date"
										name="examDate" class="form-control"
										value="<%=DataUtility.getStringData(bean.getExamDate())%>"
										placeholder="enter exam date">
									<small class="text-danger"><%=ServletUtility.getErrorMessage("examDate", request)%></small>
								</div>
							</div>

							<!-- Description full width -->
							<div class="mb-3">
								<label class="form-label fw-bold"><i
									class="bi bi-align-start text-success"></i> Description <span
									class="text-danger">*</span></label> <input type="text"
									name="description" class="form-control"
									value="<%=DataUtility.getStringData(bean.getDescription())%>"
									placeholder="enter role description">
								<small class="text-danger"><%=ServletUtility.getErrorMessage("description", request)%></small>
							</div>

							<!-- Exam Time full width -->
							<div class="mb-3">
								<label class="form-label fw-bold"><i
									class="bi bi-clock-fill text-warning"></i> Exam Time <span
									class="text-danger">*</span></label> <input type="text"
									name="examTime" class="form-control"
									value="<%=DataUtility.getStringData(bean.getExamTime())%>"
									placeholder="enter exam time">
								<small class="text-danger"><%=ServletUtility.getErrorMessage("examTime", request)%></small>
							</div>

							<!-- Course Name + Subject Name side-by-side -->
							<div class="row">
								<div class="col-md-6 mb-4">
									<label class="form-label fw-bold"><i
										class="bi bi-journal-bookmark-fill text-info"></i> Course
										Name <span class="text-danger">*</span></label>
									<%
									String courseHtml = HTMLUtility.getList("courseId",
											DataUtility.getStringData(bean.getCourseId()), courseList);
									courseHtml = courseHtml.replaceFirst("<select",
											"<select class=\"form-control\"");
									%>
									<%=courseHtml%>
									<small class="text-danger"><%=ServletUtility.getErrorMessage("courseId", request)%></small>
								</div>
								<div class="col-md-6 mb-4">
									<label class="form-label fw-bold"><i
										class="bi bi-book-fill text-primary"></i> Subject Name <span
										class="text-danger">*</span></label>
									<%
									String subjectHtml = HTMLUtility.getList("subjectId",
											DataUtility.getStringData(bean.getSubjectId()), subjectList);
									subjectHtml = subjectHtml.replaceFirst("<select",
											"<select class=\"form-control\"");
									%>
									<%=subjectHtml%>
									<small class="text-danger"><%=ServletUtility.getErrorMessage("subjectId", request)%></small>
								</div>
							</div>

							<div class="text-center">
								<input type="submit" name="operation"
									class="btn btn-primary px-4"
									value="<%=bean != null && bean.getId() > 0 ? "Update" : BaseCtl.OP_SAVE%>">
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="Footer.jsp"%>

</body>
</html>