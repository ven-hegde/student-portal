package edu.uncc.student.portal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.uncc.student.portal.dataaccess.StudentData;
import edu.uncc.student.portal.model.UserBean;
import edu.uncc.student.portal.util.StudentPortalUtil;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String url = "";
		String message = "";
		HttpSession session = request.getSession();

		UserBean loggedInUser = null;

		String action = request.getParameter("action");
		// Login action
		if (action.equalsIgnoreCase("login")) {
			// Get the username and password
			String userName = request.getParameter("username");
			String password = request.getParameter("password");

			String email = StudentPortalUtil.constructEmail(userName); 
			
			UserBean userBean = new UserBean();
			userBean.setEmail(email);
			userBean.setPassword(password);
			boolean isUser = StudentData.isUser(userBean);
			if (isUser) {
				session.setAttribute("isloggedin", true);
				loggedInUser = new UserBean();
				loggedInUser = StudentData.getUser(userBean);

				boolean isAuthUser = StudentPortalUtil.isAuthenticatedUser(loggedInUser);
				if (isAuthUser) {
					if ("Student".equalsIgnoreCase(loggedInUser.getRole())) {
						url = "/studentHome.jsp";
					} else {
						url = "/adminHome.jsp";
					}
				} else {
					message = "Invaid Password";
					request.setAttribute("message", message);
					url = "/index.jsp";
					getServletContext().getRequestDispatcher(url).forward(request, response);
				}

			} else {
				message = "Invalid Username";
				request.setAttribute("message", message);
				url = "/index.jsp";
				getServletContext().getRequestDispatcher(url).forward(request, response);
			}
			session.setAttribute("user", loggedInUser);
			getServletContext().getRequestDispatcher(url).forward(request, response);
		} // end of action login

		// logout action
		if (action.equalsIgnoreCase("logout")) {
			url = "/logout.jsp";
			session.invalidate();
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

	}// end of doPost()

}// end of servlet
