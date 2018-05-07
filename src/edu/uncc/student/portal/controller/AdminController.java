
package edu.uncc.student.portal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import edu.uncc.student.portal.dataaccess.StudentData;
import edu.uncc.student.portal.model.CourseBean;
import edu.uncc.student.portal.model.NotificationBean;
import edu.uncc.student.portal.model.TermBean;
import edu.uncc.student.portal.model.UserBean;
import edu.uncc.student.portal.util.PasswordUtil;
import edu.uncc.student.portal.util.StudentPortalUtil;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentPortalUtil utility = new StudentPortalUtil();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final Logger LOG = Logger.getLogger(AdminController.class.getName());
		String url = "";
		@SuppressWarnings("unused")
		String messageAdminCtrl = "";
		HttpSession session = request.getSession();
		boolean addNewStFlag = false;

		String action = request.getParameter("action");
		LOG.info("Action:"+action);
		/**
		 * To get All students
		 * 
		 */
		if (action.equalsIgnoreCase("addDeleteStudent")) {
			LOG.info("Action:"+action);
			// 1. get all students details
			// 2. keep it in an array list

			List<UserBean> studentsList = new ArrayList<>();

			studentsList = StudentData.getAllStudents();

			// 3. store the array list in request object
			if (null != studentsList) {
				url = "/addDeleteStudent.jsp";
				request.setAttribute("studentList", studentsList);
			} else {
				url = "/addDeleteStudent.jsp";
				String messageEditStTool = "Unable to get student details..Please try later.";
				request.setAttribute("messageEditStTool", messageEditStTool);
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		} // end of action addDeleteStudent
		if (action.equalsIgnoreCase("addNewStudent")) {
			String defaultRole = "Student";
			String emailId = request.getParameter("email");
			UserBean newStudent = new UserBean();
			newStudent.setFirstName(request.getParameter("firstname"));
			newStudent.setLastName(request.getParameter("lastname"));
			newStudent.setEmail(request.getParameter("email"));
			newStudent.setPhonenumber(request.getParameter("phonenumber"));
			newStudent.setAddress(request.getParameter("address"));
			newStudent.setRole(defaultRole);
			newStudent = PasswordUtil.passwordManger(newStudent);

			int result = StudentData.addNewStudent(newStudent);

			if (result == 1) {
				@SuppressWarnings("unused")
				boolean isMailSent = false;
				// end email to student
				if (StringUtils.isNotBlank(emailId)) {
					NotificationBean notificationBean = new NotificationBean();
					notificationBean.setSubject("Welcome to Student Portal!");
					notificationBean.setToAddress(emailId);

					String message = "Dear " + newStudent.getFirstName() + ",\n Welcome to Student Portal!\n"
							+ "You have been added to the portal by Admin!\n"
							+ "Please note your username and password that you will be using to login into the system in future.\n"
							+ "Your emailId is your user name. Please find the below username and password\n\n"
							+ "UserName:" + emailId + "\n" + "Password:" + newStudent.getPassword()
							+ "\n\n Welcome Again!\n\n\n\n";

					notificationBean.setMessage(message);

					try {
						isMailSent = StudentPortalUtil.sendNotification(notificationBean);
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				List<UserBean> studentList = StudentData.getAllStudents();
				request.setAttribute("studentList", studentList);
				url = "/addDeleteStudent.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Added New Student");
			} else {
				url = "/addDeleteStudent.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		} // end of action add new student

		if (action.equalsIgnoreCase("delStudent")) {
			int studentId = Integer.parseInt(request.getParameter("delStudentId"));
			int result = StudentData.deleteStudent(studentId);

			if (result == 1) {
				List<UserBean> studentList = StudentData.getAllStudents();
				request.setAttribute("studentList", studentList);
				url = "/addDeleteStudent.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Student Deleted from System");
			} else {
				url = "/addDeleteStudent.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		/**
		 * Add/Delete course home action
		 */
		if (action.equalsIgnoreCase("termSelected")) {

			List<CourseBean> courseList = new ArrayList<>();

			String term = request.getParameter("term");

			session.setAttribute("term", term);

			courseList = StudentData.getCoursesByTerm(term);

			if (null != courseList) {
				url = "/addDeleteCourse.jsp";
				request.setAttribute("courseList", courseList);
			} else {
				url = "/addDeleteCourse.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		/**
		 * Add New CourseBean
		 */
		if (action.equalsIgnoreCase("addNewCourse")) {

			CourseBean newCourse = new CourseBean();
			newCourse.setCourseName(request.getParameter("courseName"));
			int credit = Integer.parseInt(request.getParameter("credit"));
			newCourse.setCredit(credit);
			newCourse.setInstructor(request.getParameter("instructor"));
			newCourse.setMode(request.getParameter("mode"));
			newCourse.setTerm(request.getParameter("term"));

			int result = StudentData.addNewCourse(newCourse);

			if (result == 1) {
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "CourseBean added successfully.");
				List<CourseBean> courseList = new ArrayList<>();
				String term = (String) session.getAttribute("term");
				courseList = StudentData.getCoursesByTerm(term);
				request.setAttribute("courseList", courseList);
				url = "/addDeleteCourse.jsp";
			} else {
				url = "//addDeleteCourse.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		/**
		 * Delete a course
		 */
		if (action.equalsIgnoreCase("delCourse")) {
			int courseId = Integer.parseInt(request.getParameter("delCourseId"));
			int result = StudentData.deleteCourse(courseId);

			if (result == 1) {
				List<CourseBean> courseList = new ArrayList<>();
				String term = (String) session.getAttribute("term");
				courseList = StudentData.getCoursesByTerm(term);
				request.setAttribute("courseList", courseList);
				url = "/addDeleteCourse.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "CourseBean Deleted from System");
			} else {
				url = "/addDeleteCourse.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		/**
		 * Edit Student
		 */
		if (action.equalsIgnoreCase("editStudentInit")) {
			UserBean editingStudent = new UserBean();

			editingStudent.setUserId(Integer.parseInt(request.getParameter("editStudentId")));
			editingStudent.setFirstName(request.getParameter("editStudentFnm"));
			editingStudent.setLastName(request.getParameter("editStudentLnm"));
			editingStudent.setEmail(request.getParameter("editStudentEmail"));
			editingStudent.setPhonenumber(request.getParameter("editStudentPhone"));
			editingStudent.setAddress(request.getParameter("editStudentAdd"));

			url = "/editStudentForm.jsp";
			request.setAttribute("editingStudent", editingStudent);

			getServletContext().getRequestDispatcher(url).forward(request, response);

		}
		if (action.equalsIgnoreCase("editStudentForm")) {

			UserBean editingStudent = new UserBean();

			editingStudent.setUserId(Integer.parseInt(request.getParameter("studentId")));
			editingStudent.setFirstName(request.getParameter("firstName"));
			editingStudent.setLastName(request.getParameter("lastName"));
			editingStudent.setEmail(request.getParameter("email"));
			editingStudent.setPhonenumber(request.getParameter("phone"));
			editingStudent.setAddress(request.getParameter("address"));
			editingStudent.setRole(request.getParameter("role"));

			int result = StudentData.editStudent(editingStudent);

			if (result == 1) {
				List<UserBean> studentList = StudentData.getAllStudents();
				request.setAttribute("studentList", studentList);
				url = "/addDeleteStudent.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Changes are Saved");
			} else {
				url = "/addDeleteStudent.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		/**
		 * Edit CourseBean
		 */
		if (action.equalsIgnoreCase("editCourseInit")) {
			CourseBean editingCourse = new CourseBean();

			editingCourse.setCourseId(Integer.parseInt(request.getParameter("courseId")));
			editingCourse.setCourseName(request.getParameter("courseName"));
			editingCourse.setTerm(request.getParameter("term"));
			editingCourse.setCredit(Integer.parseInt(request.getParameter("credit")));
			editingCourse.setInstructor(request.getParameter("instructor"));
			editingCourse.setMode(request.getParameter("mode"));

			url = "/editCourseForm.jsp";
			request.setAttribute("editingCourse", editingCourse);

			getServletContext().getRequestDispatcher(url).forward(request, response);

		}

		if (action.equalsIgnoreCase("editCourseForm")) {

			CourseBean editingCourse = new CourseBean();

			editingCourse.setCourseId(Integer.parseInt(request.getParameter("courseId")));
			editingCourse.setCourseName(request.getParameter("courseName"));
			editingCourse.setTerm(request.getParameter("term"));
			editingCourse.setCredit(Integer.parseInt(request.getParameter("credit")));
			editingCourse.setInstructor(request.getParameter("instructor"));
			editingCourse.setMode(request.getParameter("mode"));

			int result = StudentData.editCourse(editingCourse);

			if (result == 1) {
				List<CourseBean> courseList = new ArrayList<>();
				String term = (String) session.getAttribute("term");
				courseList = StudentData.getCoursesByTerm(term);
				request.setAttribute("courseList", courseList);
				url = "/addDeleteCourse.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Changes are saved!");
			} else {
				url = "/addDeleteCourse.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		/**
		 * Get terms from data base
		 */
		if (action.equalsIgnoreCase("getTerms")) {
			List<TermBean> termsList = new ArrayList<TermBean>();

			termsList = utility.getEnabledTerms();

			if (null != termsList) {
				url = "/addDeleteCourseHome.jsp";
				session.setAttribute("termList", termsList);
			} else {
				url = "/addDeleteCourseHome.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}

			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		if (action.equalsIgnoreCase("manageTerms")) {
			List<TermBean> termsList = utility.getAllTerms();
			

			if (null != termsList) {
				url = "/manageTerm.jsp";
				session.setAttribute("termList", termsList);
			} else {
				url = "/manageTerm.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		if (action.equalsIgnoreCase("addNewTerm")) {
			TermBean termBean = new TermBean();
			termBean.setTermName(request.getParameter("termName"));
			termBean.setStartDate(request.getParameter("startDate"));
			termBean.setEndDate(request.getParameter("endDate"));
			termBean.setTermEnabled(Boolean.parseBoolean(request.getParameter("isTermEnabled")));
			termBean.setRegOpen(Boolean.parseBoolean(request.getParameter("isRegOpen")));

			int result = StudentData.addNewTerm(termBean);

			if (result != 0) {
				url = "/manageTerm.jsp";
				List<TermBean> termsList = utility.getAllTerms();
				session.setAttribute("termList", termsList);
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "TermBean Added successfully.");
			} else {
				url = "/manageTerm.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);
		}

		// Disable the term
		if (action.equalsIgnoreCase("acDsTerm")) {
			int termId = Integer.parseInt(request.getParameter("termId"));
			String isTermEnabled = request.getParameter("isTermEnabled");
			isTermEnabled = isTermEnabled.trim();
			boolean isTrEnabled = false;
			if (StringUtils.equals(isTermEnabled, "true")) {
				isTrEnabled = true;
			}
			int result = 0;
		
			if (isTrEnabled) {
				result = StudentData.enableDisableTerm(termId, false);
			} else {
			
				result = StudentData.enableDisableTerm(termId, true);
				
			}

			if (result != 0) {
				url = "/manageTerm.jsp";
				List<TermBean> termsList = utility.getAllTerms();
				
				session.setAttribute("termList", termsList);
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Changed the term status successfully.");
			} else {
				url = "/manageTerm.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);

		}

		// Registration open/
		if (action.equalsIgnoreCase("regOpTerm")) {
			int termId = Integer.parseInt(request.getParameter("termId"));
			
			boolean isRegOpen = Boolean.parseBoolean(request.getParameter("isRegEnabled"));

			int result = 0;
			if (isRegOpen) {
				result = StudentData.enableDisableReg(termId, false);
			} else {
				result = StudentData.enableDisableReg(termId, true);
			}

			if (result != 0) {
				url = "/manageTerm.jsp";
				List<TermBean> termsList = utility.getAllTerms();

				session.setAttribute("termList", termsList);
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "RRegistration status changed");
			} else {
				url = "/manageTerm.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);

		}

	}// end of doPost

}// end of class
