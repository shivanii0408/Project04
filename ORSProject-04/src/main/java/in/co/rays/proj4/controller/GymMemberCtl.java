package in.co.rays.proj4.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import in.co.rays.proj4.bean.GymMemberBean;
import in.co.rays.proj4.model.GymMemberModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;

@WebServlet("/ctl/GymMemberCtl")
public class GymMemberCtl extends BaseCtl<GymMemberBean, GymMemberModel> {

	@Override
	protected boolean validate(HttpServletRequest request) {

		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("name"))) {
			request.setAttribute("name", "Name is required");
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("membershipType"))) {
			request.setAttribute("membershipType", "Membership Type is required");
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("joiningDate"))) {
			request.setAttribute("joiningDate", "Joining Date is required");
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("trainerName"))) {
			request.setAttribute("trainerName", "Trainer Name is required");
			pass = false;
		}

		return pass;
	}

	@Override
	protected GymMemberBean populateBean(HttpServletRequest request) {

		GymMemberBean bean = new GymMemberBean();

		bean.setId(DataUtility.getLong(request.getParameter("Id")));
		bean.setMemberId(DataUtility.getString(request.getParameter("memberId")));
		bean.setName(DataUtility.getString(request.getParameter("name")));
		bean.setMembershipType(
				DataUtility.getString(request.getParameter("membershipType")));
		bean.setJoiningDate(
				DataUtility.getString(request.getParameter("joiningDate")));
		bean.setTrainerName(
				DataUtility.getString(request.getParameter("trainerName")));

		populateDTO(bean, request);

		return bean;
	}

	@Override
	protected String getView() {
		return ORSView.GYMMEMBER_VIEW;
	}

	@Override
	protected GymMemberModel getModel() {
		return new GymMemberModel();
	}
}