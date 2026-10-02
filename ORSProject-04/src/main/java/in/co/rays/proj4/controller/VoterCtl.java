package in.co.rays.proj4.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import in.co.rays.proj4.bean.VoterBean;
import in.co.rays.proj4.model.VoterModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;

@WebServlet("/ctl/VoterCtl")
public class VoterCtl extends BaseCtl<VoterBean, VoterModel> {

	@Override
	protected boolean validate(HttpServletRequest request) {

		boolean pass = true;

		// Name
		if (DataValidator.isNull(request.getParameter("name"))) {

			request.setAttribute("name", "Name is required");
			pass = false;
		}

		// Age
		if (DataValidator.isNull(request.getParameter("age"))) {

			request.setAttribute("age", "Age is required");
			pass = false;
		}

		// Constituency
		if (DataValidator.isNull(request.getParameter("constituency"))) {

			request.setAttribute("constituency",
					"Constituency is required");
			pass = false;
		}

		// Has Voted
		if (DataValidator.isNull(request.getParameter("hasVoted"))) {

			request.setAttribute("hasVoted",
					"Please select Has Voted");
			pass = false;
		}

		return pass;
	}

	@Override
	protected VoterBean populateBean(HttpServletRequest request) {

		VoterBean bean = new VoterBean();

		// Voter ID
		bean.setVoterId(
				DataUtility.getString(request.getParameter("voterId")));

		// Name
		bean.setName(
				DataUtility.getString(request.getParameter("name")));

		// Age
		bean.setAge(
				DataUtility.getInt(request.getParameter("age")));

		// Constituency
		bean.setConstituency(
				DataUtility.getString(request.getParameter("constituency")));

		// Has Voted
		bean.setHasVoted(
				"true".equals(request.getParameter("hasVoted")));

		populateDTO(bean, request);

		return bean;
	}

	@Override
	protected String getView() {

		return ORSView.VOTER_VIEW;
	}

	@Override
	protected VoterModel getModel() {

		return new VoterModel();
	}
}