package in.co.rays.proj4.controller;

import java.io.IOException;

import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import in.co.rays.proj4.util.ServletUtility;

@WebFilter("/ctl/*")
public class FrontCtl extends HttpFilter {

	@Override
	public void doFilter(jakarta.servlet.ServletRequest request,
			jakarta.servlet.ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();

		// LoginCtl ko filter se allow karo
		if (uri.endsWith("/LoginCtl")) {
			chain.doFilter(request, response);
			return;
		}

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			ServletUtility.setErrorMessage(
					"Your session has been expired, please re-login", req);

			ServletUtility.forward(ORSView.LOGIN_VIEW, req, res);
			return;
		}

		chain.doFilter(request, response);
	}
}