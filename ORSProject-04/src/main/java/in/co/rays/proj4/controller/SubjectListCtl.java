package in.co.rays.proj4.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import in.co.rays.proj4.bean.SubjectBean;
import in.co.rays.proj4.model.SubjectModel;
import in.co.rays.proj4.util.DataUtility;

@WebServlet("/ctl/SubjectListCtl")
public class SubjectListCtl extends BaseListCtl<SubjectBean, SubjectModel> {

	@Override
	protected SubjectBean populateBean(HttpServletRequest request) {
		SubjectBean bean = new SubjectBean();
		bean.setName(DataUtility.getString(request.getParameter("name")));
		bean.setDescription(DataUtility.getString(request.getParameter("description")));
//		bean.setCourseId(DataUtility.getLong(request.getParameter("courseId")));
		return bean;
	}

	@Override
	protected String getView() {
		return ORSView.SUBJECT_LIST_VIEW;
	}

	@Override
	protected SubjectModel getModel() {
		return new SubjectModel();
	}

}