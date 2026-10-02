package in.co.rays.proj4.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import in.co.rays.proj4.bean.FoodOrderBean;
import in.co.rays.proj4.model.FoodOrderModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;

@WebServlet("/ctl/FoodOrderCtl")
public class FoodOrderCtl extends BaseCtl<FoodOrderBean, FoodOrderModel> {

	@Override
	protected boolean validate(HttpServletRequest request) {

		boolean pass = true;

		// Customer Name
		if (DataValidator.isNull(request.getParameter("customerName"))) {

			request.setAttribute("customerName",
					"Customer Name is required");
			pass = false;
		}

		// Restaurant
		if (DataValidator.isNull(request.getParameter("restaurant"))) {

			request.setAttribute("restaurant",
					"Restaurant is required");
			pass = false;
		}

		// Order Amount
		if (DataValidator.isNull(request.getParameter("orderAmount"))) {

			request.setAttribute("orderAmount",
					"Order Amount is required");
			pass = false;
		}

		// Delivery Status
		if (DataValidator.isNull(request.getParameter("deliveryStatus"))) {

			request.setAttribute("deliveryStatus",
					"Please select Delivery Status");
			pass = false;
		}

		return pass;
	}

	@Override
	protected FoodOrderBean populateBean(HttpServletRequest request) {

		FoodOrderBean bean = new FoodOrderBean();

		// Order ID
		bean.setOrderId(
				DataUtility.getString(request.getParameter("orderId")));

		// Customer Name
		bean.setCustomerName(
				DataUtility.getString(request.getParameter("customerName")));

		// Restaurant
		bean.setRestaurant(
				DataUtility.getString(request.getParameter("restaurant")));

		bean.setOrderAmount(
		        Double.parseDouble(request.getParameter("orderAmount")));

		// Delivery Status
		bean.setDeliveryStatus(
				DataUtility.getString(request.getParameter("deliveryStatus")));

		populateDTO(bean, request);

		return bean;
	}

	@Override
	protected String getView() {

		return ORSView.FOODORDER_VIEW;
	}

	@Override
	protected FoodOrderModel getModel() {

		return new FoodOrderModel();
	}
}