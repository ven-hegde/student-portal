package edu.uncc.student.portal.controller;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import edu.uncc.student.portal.dataaccess.StudentData;
import edu.uncc.student.portal.model.UserBean;

/**
 * Servlet implementation class ProfileController
 */
@WebServlet("/ProfileController")
@MultipartConfig(maxFileSize = 10485760)
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	final Logger LOG = Logger.getLogger(ProfileController.class.getName());
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileController() {
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
	
		String url = "";
		boolean profileEdit = true;
		HttpSession session = request.getSession();
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("editprofile")) {
			// get values
			UserBean loggedUser = (UserBean) session.getAttribute("user");
			loggedUser.setLastName(request.getParameter("lastname"));
			loggedUser.setAddress(request.getParameter("address"));
			loggedUser.setPhonenumber(request.getParameter("phonenumber"));
			System.out.println(request.getPart("photo"));
			Part photo = request.getPart("photo");
			if(null != photo) {
				LOG.info("File Name"+photo.getName());
				LOG.info("File Size"+photo.getSize());
				LOG.info("File Size"+photo.getContentType());
				loggedUser.setPhoto(photo);
				
			}
			
			
			int result = StudentData.updateProfile(loggedUser);
			if(result == 1) {
				url="/profile.jsp";
				if(null != photo) {
					loggedUser.setProPic(true);
				}
				session.setAttribute("user", loggedUser);
				request.setAttribute("proedit", profileEdit);
				request.setAttribute("proUpMsg", "Profile Updated Successfully!");
			} else {
				url="/profile.jsp";
				request.setAttribute("proedit", profileEdit);
				request.setAttribute("proUpMsg", "Something went wrong! Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}//end of if
	}

}
