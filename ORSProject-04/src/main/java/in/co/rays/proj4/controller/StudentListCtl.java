package in.co.rays.proj4.controller;

import in.co.rays.proj4.bean.StudentBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.model.StudentModel;
import in.co.rays.proj4.model.UserModel;
import in.co.rays.proj4.util.DataUtility;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/StudentListCtl")
public class StudentListCtl extends BaseListCtl<StudentBean, StudentModel> {

	@Override
	protected StudentBean populateBean(HttpServletRequest request) {
		StudentBean bean = new StudentBean();
		bean.setCollegeName(DataUtility.getString(request.getParameter("collegeName")));
		bean.setFirstName(DataUtility.getString(request.getParameter("firstName")));

		return bean;
	}

	@Override
	protected String getView() {
		return ORSView.STUDENT_LIST_VIEW;
	}

	@Override
	protected StudentModel getModel() {
		return new StudentModel();
	}
}