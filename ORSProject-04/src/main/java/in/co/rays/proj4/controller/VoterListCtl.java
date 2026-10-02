package in.co.rays.proj4.controller;

import in.co.rays.proj4.bean.GymMemberBean;
import in.co.rays.proj4.bean.VoterBean;
import in.co.rays.proj4.model.GymMemberModel;
import in.co.rays.proj4.model.VoterModel;
import in.co.rays.proj4.util.DataUtility;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/ctl/VoterListCtl")
public class  VoterListCtl extends BaseListCtl< VoterBean,  VoterModel>{

	@Override
	protected  VoterBean populateBean(HttpServletRequest request) {
		VoterBean bean = new VoterBean();
		bean.setName(DataUtility.getString(request.getParameter("Name")));

		return bean;
	}

	@Override
	protected String getView() {
		return ORSView.VOTER_LIST_VIEW;
	}

	@Override
	protected  VoterModel getModel() {
		return new  VoterModel();
	}
	
}