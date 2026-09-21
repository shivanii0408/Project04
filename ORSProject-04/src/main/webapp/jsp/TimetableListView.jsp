<%@ page import="in.co.rays.proj4.bean.CourseBean" %>
<%@ page import="in.co.rays.proj4.model.CourseModel" %>
<%@ page import="in.co.rays.proj4.bean.SubjectBean" %>
<%@ page import="in.co.rays.proj4.model.SubjectModel" %>
<%@ page import="in.co.rays.proj4.bean.TimeTableBean" %>
<%@ page import="in.co.rays.proj4.util.ServletUtility" %>
<%@ page import="in.co.rays.proj4.controller.BaseCtl" %>
<%@ page import="in.co.rays.proj4.controller.ORSView" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Time Table List</title>

    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body class="bg-light">

<%@ include file="Header.jsp" %>

<%
    int pageNo = ServletUtility.getPageNo(request);
    int pageSize = ServletUtility.getPageSize(request);
    int index = ((pageNo - 1) * pageSize) + 1;

    List<TimeTableBean> list = ServletUtility.getList(request);
    Iterator<TimeTableBean> it = list.iterator();

    String _suc = ServletUtility.getSuccessMessage(request);
    String _err = ServletUtility.getErrorMessage(request);
%>

<form action="<%=ORSView.TIMETABLE_LIST_CTL%>" method="post">

    <input type="hidden" name="pageNo" value="<%=pageNo%>">
    <input type="hidden" name="pageSize" value="<%=pageSize%>">

    <div class="container pt-5" style="padding-bottom: 100px !important;">

        <div class="card shadow-sm border-0">

            <div class="card-header bg-white text-center border-bottom py-4">
                <h2 class="text-primary fw-bold mb-0">
                    <i class="bi bi-calendar3"></i> Time Table List
                </h2>
            </div>

            <div class="card-body p-4">

                <%
                    if (_suc != null && _suc.length() > 0) {
                %>
                    <div class="alert alert-success text-center py-2">
                        <%= _suc %>
                    </div>
                <%
                    }

                    if (_err != null && _err.length() > 0) {
                %>
                    <div class="alert alert-danger text-center py-2">
                        <%= _err %>
                    </div>
                <%
                    }
                %>

                <div class="row g-2 mb-4">

                    <div class="col-md-4">
                        <input type="text"
                               name="courseName"
                               value=""
                               class="form-control"
                               placeholder="search by courseName">
                    </div>

                    <div class="col-md-4">
                        <input type="text"
                               name="semester"
                               value=""
                               class="form-control"
                               placeholder="search by semester">
                    </div>

                    <div class="col-md-2">
                        <input type="submit"
                               name="operation"
                               class="btn btn-primary w-100"
                               value="<%=BaseCtl.OP_SEARCH%>">
                    </div>

                </div>

                <div class="table-responsive">

                    <table class="table table-bordered table-hover align-middle">

                        <thead class="table-primary text-center">
                            <tr>
                                <th>
                                    <input type="checkbox"
                                           onclick="document.querySelectorAll('input[name=ids]').forEach(c=>c.checked=this.checked)">
                                </th>
                                <th>S.No</th>
                                <th>Semester</th>
                                <th>Description</th>
                                <th>Exam Date</th>
                                <th>Exam Time</th>
                                <th>Course Name</th>
                                <th>Subject Name</th>
                                <th>Edit</th>
                            </tr>
                        </thead>

                        <tbody>

                        <%
                            while (it.hasNext()) {

                                TimeTableBean bean = it.next();

                                CourseModel cmodel = new CourseModel();
                                CourseBean cbean =
                                        cmodel.findByPK(bean.getCourseId());

                                SubjectModel smodel = new SubjectModel();
                                SubjectBean sbean =
                                        smodel.findByPK(bean.getSubjectId());

                                String courseName =
                                        (cbean != null) ? cbean.getName() : "-";

                                String subjectName =
                                        (sbean != null) ? sbean.getName() : "-";
                        %>

                            <tr class="text-center">

                                <td>
                                    <input type="checkbox"
                                           name="ids"
                                           value="<%=bean.getId()%>">
                                </td>

                                <td>
                                    <%=index++%>
                                </td>

                                <td>
                                    <%=bean.getSemester()%>
                                </td>

                                <td>
                                    <%=bean.getDescription()%>
                                </td>

                                <td>
                                    <%=bean.getExamDate()%>
                                </td>

                                <td>
                                    <%=bean.getExamTime()%>
                                </td>

                                <td>
                                    <%=courseName%>
                                </td>

                                <td>
                                    <%=subjectName%>
                                </td>

                                <td>
                                    <a class="btn btn-sm btn-outline-primary"
                                       href="<%=ORSView.TIMETABLE_CTL + "?id=" + bean.getId()%>">

                                        <i class="bi bi-pencil-square"></i>
                                        Edit

                                    </a>
                                </td>

                            </tr>

                        <%
                            }
                        %>

                        </tbody>

                    </table>

                </div>

                <div class="d-flex justify-content-between align-items-center mt-3">

                    <input type="submit"
                           name="operation"
                           class="btn btn-secondary"
                           <%=pageNo == 1 ? "disabled" : ""%>
                           value="<%=BaseCtl.OP_PREVIOUS%>">

                    <input type="submit"
                           name="operation"
                           class="btn btn-danger"
                           value="<%=BaseCtl.OP_DELETE%>">

                    <input type="submit"
                           name="operation"
                           class="btn btn-secondary"
                           <%=list.size() < 10 ? "disabled" : ""%>
                           value="<%=BaseCtl.OP_NEXT%>">

                </div>

            </div>
        </div>
    </div>

</form>

<%@ include file="Footer.jsp" %>

</body>
</html>