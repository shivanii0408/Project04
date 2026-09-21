package in.co.rays.proj4.controller;

import in.co.rays.proj4.model.BaseModel;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/WelcomeCtl")
public class WelcomeCtl extends BaseCtl {

	@Override
	protected String getView() { //view return krne k liye
		return ORSView.WELCOME_VIEW;
	}

	@Override
	protected BaseModel getModel() { //model a object return krne k liye
		return null;
	}

}