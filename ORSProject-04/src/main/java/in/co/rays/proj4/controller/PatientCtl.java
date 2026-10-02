package in.co.rays.proj4.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import in.co.rays.proj4.bean.PatientBean;
import in.co.rays.proj4.model.PatientModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;

@WebServlet("/ctl/PatientCtl")
public class PatientCtl extends BaseCtl<PatientBean, PatientModel> {

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

		// Disease
		if (DataValidator.isNull(request.getParameter("Disease"))) {

			request.setAttribute("Disease",
					"Disease is required");
			pass = false;
		}

		

		return pass;
	}

	@Override
	protected PatientBean populateBean(HttpServletRequest request) {

		PatientBean bean = new PatientBean();

		//Patient ID
		bean.setPatientId(
				DataUtility.getString(request.getParameter("PatientId")));

		// Name
		bean.setName(
				DataUtility.getString(request.getParameter("name")));
		
		// BloodGroup
				bean.setBloodGroup(
						DataUtility.getString(request.getParameter("Blood Group")));

		// Age
		bean.setAge(
				DataUtility.getInt(request.getParameter("age")));
		
		//Disease
		bean.setDisease(
				DataUtility.getString(request.getParameter("Disease")));



		populateDTO(bean, request);

		return bean;
	}

	@Override
	protected String getView() {

		return ORSView.PATIENT_VIEW;
	}

	@Override
	protected PatientModel getModel() {

		return new PatientModel();
	}
}