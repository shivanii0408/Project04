package in.co.rays.proj4.controller;

import java.io.IOException;

import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.model.UserModel;
import in.co.rays.proj4.util.ServletUtility;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ctl/MyProfileCtl")
public class MyProfileCtl extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        UserBean sessionUser = (UserBean) session.getAttribute("user");

        if (sessionUser == null) {
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }

        try {
            UserModel model = new UserModel();

            UserBean bean = model.findByPK(sessionUser.getId());

            if (bean != null) {
                request.setAttribute("bean", bean);
            }

            ServletUtility.forward(getView(), request, response);

        } catch (Exception e) {
            e.printStackTrace();
            ServletUtility.handleException(e, request, response);
        }
    }

    protected String getView() {
        return ORSView.MY_PROFILE_VIEW;
    }
}