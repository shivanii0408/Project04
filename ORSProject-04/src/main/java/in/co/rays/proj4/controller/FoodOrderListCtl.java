package in.co.rays.proj4.controller;

import in.co.rays.proj4.bean.FoodOrderBean;
import in.co.rays.proj4.model.FoodOrderModel;
import in.co.rays.proj4.util.DataUtility;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;

@WebServlet("/ctl/FoodOrderListCtl")
public class FoodOrderListCtl extends BaseListCtl<FoodOrderBean, FoodOrderModel> {

	@Override
	protected FoodOrderBean populateBean(HttpServletRequest request) {

		FoodOrderBean bean = new FoodOrderBean();

		bean.setCustomerName(
				DataUtility.getString(request.getParameter("customerName")));

		return bean;
	}

	@Override
	protected String getView() {
		return ORSView.FOODORDER_LIST_VIEW;
	}

	@Override
	protected FoodOrderModel getModel() {
		return new FoodOrderModel();
	}
}