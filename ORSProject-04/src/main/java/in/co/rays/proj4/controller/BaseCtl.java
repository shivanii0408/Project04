package in.co.rays.proj4.controller;

import java.io.IOException;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.model.BaseModel;
import in.co.rays.proj4.util.DataUtility;
import in.co.rays.proj4.util.DataValidator;
import in.co.rays.proj4.util.MessageSource;
import in.co.rays.proj4.util.ServletUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Base controller class that provides common functionality
 * for all controllers in the application.
 *
 * @param <B> Bean type that extends BaseBean
 * @param <M> Model type that extends BaseModel
 */
public abstract class BaseCtl<B extends BaseBean, M extends BaseModel> extends HttpServlet {

	public static final String OP_SAVE = "Save";
	public static final String OP_CANCEL = "Cancel";
	public static final String OP_DELETE = "Delete";
	public static final String OP_LIST = "List";
	public static final String OP_SEARCH = "Search";
	public static final String OP_VIEW = "View";
	public static final String OP_NEXT = "Next";
	public static final String OP_PREVIOUS = "Previous";
	public static final String OP_NEW = "New";
	public static final String OP_GO = "Go";
	public static final String OP_BACK = "Back";
	public static final String OP_LOG_OUT = "Logout";

	public static final String HAS_ERROR = "haserror";
	public static final String MESSAGE = "message";

	public static final String MSG_SUCCESS = "success";
	public static final String MSG_ERROR = "error";

	/**
	 * Validates the request data.
	 *
	 * @param request HTTP servlet request
	 * @return true if request data is valid, otherwise false
	 */
	protected boolean validate(HttpServletRequest request) {
		return true;
	}

	/**
	 * Preloads the data required by the view.
	 *
	 * @param request HTTP servlet request
	 */
	protected void preload(HttpServletRequest request) {
	}

	/**
	 * Populates the bean using request parameters.
	 *
	 * @param request HTTP servlet request
	 * @return populated bean
	 */
	protected B populateBean(HttpServletRequest request) {
		return null;
	}

	/**
	 * Populates common audit information such as createdBy,
	 * modifiedBy, createdDatetime and modifiedDatetime.
	 *
	 * @param dto data transfer object
	 * @param request HTTP servlet request
	 * @return populated DTO
	 */
	protected BaseBean populateDTO(BaseBean dto, HttpServletRequest request) {

		String createdBy = request.getParameter("createdBy");
		String modifiedBy = null;
		UserBean userbean = (UserBean) request.getSession().getAttribute("user");

		if (userbean == null) {
			createdBy = "root";
			modifiedBy = "root";
		} else {
			modifiedBy = userbean.getLogin();

			if ("null".equalsIgnoreCase(createdBy) || DataValidator.isNull(createdBy)) {
				createdBy = modifiedBy;
			}
		}

		dto.setCreatedBy(createdBy);
		dto.setModifiedBy(modifiedBy);

		long cdt = DataUtility.getLong(request.getParameter("createdDatetime"));

		if (cdt > 0) {
			dto.setCreatedDatetime(DataUtility.getTimestamp(cdt));
		} else {
			dto.setCreatedDatetime(DataUtility.getCurrentTimestamp());
		}

		dto.setModifiedDatetime(DataUtility.getCurrentTimestamp());

		return dto;
	}

	/**
	 * Handles HTTP GET requests and forwards the request
	 * to the appropriate view.
	 *
	 * @param request HTTP servlet request
	 * @param response HTTP servlet response
	 * @throws ServletException if a servlet error occurs
	 * @throws IOException if an input or output error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op = DataUtility.getString(request.getParameter("operation"));

		long id = DataUtility.getLong(request.getParameter("id"));

		if (id > 0 || op != null) {
			BaseBean bean = getModel().findByPK(id);
			ServletUtility.setBean(bean, request);
		}

		preload(request);

		ServletUtility.forward(getView(), request, response);
	}

	/**
	 * Handles HTTP POST requests for adding or updating records.
	 *
	 * @param request HTTP servlet request
	 * @param response HTTP servlet response
	 * @throws ServletException if a servlet error occurs
	 * @throws IOException if an input or output error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long id = DataUtility.getLong(request.getParameter("id"));

		B bean = populateBean(request);
		M model = getModel();

		if (id > 0) {
			model.update(bean);
			ServletUtility.setSuccessMessage("Data is successfully updated", request);
		} else {
			model.add(bean);
			ServletUtility.setSuccessMessage("Data is successfully saved", request);
		}

		preload(request);

		ServletUtility.forward(getView(), request, response);
	}

	/**
	 * Processes HTTP requests before calling doGet or doPost.
	 * It performs validation and handles duplicate record exceptions.
	 *
	 * @param request HTTP servlet request
	 * @param response HTTP servlet response
	 * @throws ServletException if a servlet error occurs
	 * @throws IOException if an input or output error occurs
	 */
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		getMessageSource(request);

		preload(request);

		if ("POST".equals(request.getMethod())) {
			if (validate(request) == false) {
				ServletUtility.forward(getView(), request, response);
				return;
			}
		}

		try {
			super.service(request, response);
		} catch (DuplicateRecordException e) {
			ServletUtility.setErrorMessage(e.getMessage(), request);
			ServletUtility.forward(getView(), request, response);
		}
	}

	/**
	 * Returns the JSP view associated with the controller.
	 *
	 * @return view path
	 */
	protected abstract String getView();

	/**
	 * Returns the model associated with the controller.
	 *
	 * @return model object
	 */
	protected abstract M getModel();

	/**
	 * Returns the message source instance used by the application.
	 *
	 * @param request HTTP servlet request
	 * @return MessageSource instance
	 */
	public MessageSource getMessageSource(HttpServletRequest request) {

		MessageSource messagesource = MessageSource.getInstance();

		return messagesource;
	}

}