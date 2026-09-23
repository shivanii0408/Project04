package in.co.rays.proj4.controller;

import in.co.rays.proj4.bean.GymMemberBean;
import in.co.rays.proj4.model.GymMemberModel;
import in.co.rays.proj4.util.DataUtility;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/ctl/GymMemberListCtl")
public class  GymMemberListCtl extends BaseListCtl< GymMemberBean,  GymMemberModel>{

	@Override
	protected  GymMemberBean populateBean(HttpServletRequest request) {
		 GymMemberBean bean = new  GymMemberBean();
		bean.setName(DataUtility.getString(request.getParameter("Name")));

		return bean;
	}

	@Override
	protected String getView() {
		return ORSView.GYMMEMBER_LIST_VIEW;
	}

	@Override
	protected  GymMemberModel getModel() {
		return new  GymMemberModel();
	}
	
}