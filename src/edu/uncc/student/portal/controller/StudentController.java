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
import edu.uncc.student.portal.model.RegCourse;
import edu.uncc.student.portal.model.RegisteredCourseBean;
import edu.uncc.student.portal.model.TermBean;
import edu.uncc.student.portal.model.UserBean;
import edu.uncc.student.portal.util.StudentPortalUtil;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentPortalUtil utility = new StudentPortalUtil();

	private final static Logger LOG = Logger.getLogger(StudentController.class.getName());
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "";
		HttpSession session = request.getSession();
		boolean addNewStFlag = false;

		String action = request.getParameter("action");
		System.out.println("Action at top:" + action);

		if (action.equalsIgnoreCase("addCourse") || action.equalsIgnoreCase("dropCourse")) {
			session.setAttribute("studentAction", action);

			// get the terms
			List<TermBean> termsList = utility.getEnabledTerms();
			if (null != termsList) {
				url = "/selectTerm.jsp";
				request.setAttribute("termList", termsList);
			} else {
				url = "/selectTerm.jsp";
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
			}

			getServletContext().getRequestDispatcher(url).forward(request, response);

		} // end of addCourse or drop course

		if (action.equalsIgnoreCase("termSelected")) {
			String studentAction = (java.lang.String) session.getAttribute("studentAction");
			System.out.println("After Term Selected" + studentAction);
			String term = "";
			if (studentAction.equalsIgnoreCase("addCourse")) {
				url = "/addCourseTool.jsp";

				List<CourseBean> courseList = new ArrayList<>();

				term = request.getParameter("term");

				session.setAttribute("term", term);
				
				boolean regStatus = StudentData.getRegStatusForTerm(term);
				
				session.setAttribute("regStatus", regStatus);
				courseList = StudentData.getCoursesByTerm(term);

				if (null != courseList) {
					session.setAttribute("courseList", courseList);
				} else {
					addNewStFlag = true;
					request.setAttribute("addNewSt", addNewStFlag);
					request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
				}
				getServletContext().getRequestDispatcher(url).forward(request, response);
			}
			if (studentAction.equalsIgnoreCase("dropCourse")) {
				LOG.info("Inside the Drop Course");
				url = "/dropCourseTool.jsp";
				term = request.getParameter("term");
				// Check if the reg_open is 0 or 1
				boolean isRegOpenForTerm = StudentData.getRegStatusForTerm(term);
				LOG.info("isRegOpenForTerm:" + isRegOpenForTerm);
				if (isRegOpenForTerm) {

					List<RegisteredCourseBean> allregCourses = new ArrayList<>();
					UserBean student = (UserBean) session.getAttribute("user");
					allregCourses = StudentData.getAllRegCoursesForTerm(student.getUserId(), term);

					if (null != allregCourses) {
						session.setAttribute("allRegCourses", allregCourses);
						url = "/dropCourseTool.jsp";

					} else {
						addNewStFlag = true;
						request.setAttribute("addNewSt", addNewStFlag);
						request.setAttribute("addNewStMsg", "Something went wrong please try later");
						url = "/dropCourseTool.jsp";
					}

				} else {
					addNewStFlag = true;
					request.setAttribute("addNewSt", addNewStFlag);
					request.setAttribute("addNewStMsg", "You can't make changes for selected term");
				}

				getServletContext().getRequestDispatcher(url).forward(request, response);

			}
		} // end of if term selected

		if (action.equalsIgnoreCase("addSelectedCourse")) {

			UserBean student = (UserBean) session.getAttribute("user");
			int courseId = Integer.parseInt(request.getParameter("addCourseId"));
			
			int courseCredit = Integer.parseInt(request.getParameter("addCourseCr"));
			String term = request.getParameter("addCourseTr");
			String courseName = request.getParameter("addCourseName");
			int totalCreditforTerm = utility.getTotalregistredCreditsForTerm(student.getUserId(), term);

			if (totalCreditforTerm < 12) {
				// check if the user already registered for the course.
				int result = StudentData.isRegisted(courseId, student.getUserId());
				if (result == 0) {
					@SuppressWarnings("unused")
					boolean isMailSent = false;
					// register the course
					RegCourse registerCourse = new RegCourse();
					registerCourse.setCourseId(courseId);
					registerCourse.setCredits(courseCredit);
					registerCourse.setStudentId(student.getUserId());
					registerCourse.setTerm(term);
					int result1 = StudentData.RegisterCourse(registerCourse);
					if (result1 != 0) {
						
						if(StringUtils.isNotBlank(student.getEmail())) {
							NotificationBean notificationBean = new NotificationBean();
							notificationBean.setSubject("Course Register Successful");
							notificationBean.setToAddress(student.getEmail());
							
							String message = "Dear "+student.getFirstName()+",\n Greetings from Student Portal!\n"+ 
							"You have successfully registered for the Course -\n"+Integer.toString(courseId)+" - "+courseName+"\n"+
									"For the Term - "+term+"\n\n\n";
							
							notificationBean.setMessage(message);
							
							try {
								isMailSent = StudentPortalUtil.sendNotification(notificationBean);
							} catch (MessagingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						
						
						addNewStFlag = true;
						request.setAttribute("addNewSt", addNewStFlag);
						request.setAttribute("addNewStMsg", "Successful registration");
						url = "/addCourseTool.jsp";
					} else {
						addNewStFlag = true;
						request.setAttribute("addNewSt", addNewStFlag);
						request.setAttribute("addNewStMsg", "Something went wrong. Please try later.");
						url = "/addCourseTool.jsp";
					}
				} else {
					addNewStFlag = true;
					request.setAttribute("addNewSt", addNewStFlag);
					request.setAttribute("addNewStMsg", "You have already registered for this course");
					url = "/addCourseTool.jsp";
				}

			} else {
				// show the message that you can't register for more course
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "You can't register more than 12 credits per term");
				url = "/addCourseTool.jsp";
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);

		} // end of add selected course

		if (action.equalsIgnoreCase("myCourses")) {
			List<RegisteredCourseBean> allregCourses = new ArrayList<>();
			UserBean student = (UserBean) session.getAttribute("user");
			allregCourses = StudentData.getAllRegCourses(student.getUserId());

			if (null != allregCourses) {
				session.setAttribute("allRegCourses", allregCourses);
				url = "/allRegCourses.jsp";

			} else {
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong please try later");
				url = "/allRegCourses.jsp";
			}

			getServletContext().getRequestDispatcher(url).forward(request, response);

		} // end of view my courses

		if (action.equalsIgnoreCase("dropSelectedCourse")) {
			LOG.info("Action:" + action);

			String dropCourseTerm = request.getParameter("dropCourseTr");
			String courseId = request.getParameter("courseId");
			String courseName = request.getParameter("courseName");
			
			int courseRegId = Integer.parseInt(request.getParameter("dropCourseRegId"));
			UserBean student = (UserBean) session.getAttribute("user");
			LOG.info("CourseRegistrationID" + courseRegId);
			LOG.info("dropCourseTerm" + dropCourseTerm);
			int result = StudentData.dropRegisteredCourse(courseRegId);
			
			if (result == 1) {
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Droped the Course");

				// get the courses for that user and update list
				List<RegisteredCourseBean> allregCourses = new ArrayList<>();
				LOG.info("TermBean:" + dropCourseTerm);
				allregCourses = StudentData.getAllRegCoursesForTerm(student.getUserId(), dropCourseTerm);
				for (RegisteredCourseBean registeredCourseBean : allregCourses) {
					LOG.info("CourseBean Name" + registeredCourseBean.getCourseName());
				}
				if(StringUtils.isNotBlank(student.getEmail())) {
					@SuppressWarnings("unused")
					boolean isMailSent = false;
					NotificationBean notificationBean = new NotificationBean();
					notificationBean.setSubject("Course dropped");
					notificationBean.setToAddress(student.getEmail());
					
					String message = "Dear "+student.getFirstName()+",\n Greetings from Student Portal!\n"+ 
					"You have successfully dropped from the course -\n"+courseId+" - "+courseName+"\n"+
							"For the Term - "+dropCourseTerm+"\n\n\n";
					
					notificationBean.setMessage(message);
					
					try {
						isMailSent = StudentPortalUtil.sendNotification(notificationBean);
					} catch (MessagingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				session.setAttribute("allRegCourses", allregCourses);
				url = "/dropCourseTool.jsp";
				LOG.info("Drop Successfull");
			} else {
				addNewStFlag = true;
				request.setAttribute("addNewSt", addNewStFlag);
				request.setAttribute("addNewStMsg", "Something went wrong please try later");
				url = "/dropCourseTool.jsp";
			}
			getServletContext().getRequestDispatcher(url).forward(request, response);

		}
	}

	@SuppressWarnings("unused")
	private Object String(Object attribute) {
		// TODO Auto-generated method stub
		return null;
	}

}
