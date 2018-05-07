/**
 * 
 */
package edu.uncc.student.portal.dataaccess;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import edu.uncc.student.portal.model.CourseBean;
import edu.uncc.student.portal.model.RegCourse;
import edu.uncc.student.portal.model.RegisteredCourseBean;
import edu.uncc.student.portal.model.TermBean;
import edu.uncc.student.portal.model.UserBean;
import edu.uncc.student.portal.util.ConnectionPool;
import edu.uncc.student.portal.util.DBUtil;

/**
 * @author venky
 *
 */
public class StudentData {

	private static final Logger LOG = Logger.getLogger(StudentData.class.getName());

	public static UserBean getUser(UserBean userBean) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "SELECT * FROM user " + "WHERE email = ?";
		ResultSet rs = null;

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, userBean.getEmail());
			rs = ps.executeQuery();
			UserBean loggedInUser = null;
			if (rs.next()) {
				loggedInUser = new UserBean();
				loggedInUser.setFirstName(rs.getString("firstname"));
				loggedInUser.setLastName(rs.getString("lastname"));
				loggedInUser.setEmail(rs.getString("email"));
				loggedInUser.setPassword(rs.getString("password"));
				loggedInUser.setPhonenumber(rs.getString("phonenumber"));
				loggedInUser.setRole(rs.getString("role"));
				loggedInUser.setUserId(rs.getInt("iduser"));
				loggedInUser.setAddress(rs.getString("address"));
				loggedInUser.setHashedAndSaltedPassword(rs.getString("HashedAndSaltedPassword"));
				loggedInUser.setSalt(rs.getString("Salt"));
				if(null == rs.getBlob("profilePhoto")) {
					loggedInUser.setProPic(false);
				} else {
					loggedInUser.setProPic(true);
				}

			}
			return loggedInUser;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	public static boolean isUser(UserBean userBean) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT count(1) FROM user " + "WHERE email = ?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, userBean.getEmail());
			rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

	/**
	 * Update profile
	 * 
	 * @param userBean
	 * @return
	 */
	public static int updateProfile(UserBean userBean) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		InputStream inputStream = null;

		if (null != userBean.getPhoto()) {
			try {
				inputStream = userBean.getPhoto().getInputStream();
			} catch (IOException e) {

				e.printStackTrace();
			}
		}

		String query = "UPDATE user SET lastname = ?, address = ?, phonenumber = ?, profilePhoto = ? WHERE iduser = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, userBean.getLastName());
			ps.setString(2, userBean.getAddress());
			ps.setString(3, userBean.getPhonenumber());
			if(null != inputStream) {
				ps.setBlob(4, inputStream);
			}
			ps.setInt(5, userBean.getUserId());

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {

			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

	/**
	 * 
	 * @return
	 */
	public static List<UserBean> getAllStudents() {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT * FROM user where role= ?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, "Student");
			rs = ps.executeQuery();
			List<UserBean> studentList = new ArrayList<UserBean>();
			while (rs.next()) {
				UserBean userBean = new UserBean();
				userBean.setUserId(rs.getInt("iduser"));
				userBean.setAddress(rs.getString("address"));
				userBean.setEmail(rs.getString("email"));
				userBean.setFirstName(rs.getString("firstname"));
				userBean.setLastName(rs.getString("lastname"));
				userBean.setPhonenumber(rs.getString("phonenumber"));
				userBean.setPassword(rs.getString("password"));
				studentList.add(userBean);
			}
			return studentList;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}// end of getAllStudents

	/**
	 * 
	 * @param newStudent
	 */
	public static int addNewStudent(UserBean newStudent) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "INSERT INTO user (firstname, lastname, phonenumber, address, role, email, password, HashedAndSaltedPassword, Salt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, newStudent.getFirstName());
			ps.setString(2, newStudent.getLastName());
			ps.setString(3, newStudent.getPhonenumber());
			ps.setString(4, newStudent.getAddress());
			ps.setString(5, newStudent.getRole());
			ps.setString(6, newStudent.getEmail());
			ps.setString(7, newStudent.getPassword());
			ps.setString(8, newStudent.getHashedAndSaltedPassword());
			ps.setString(9, newStudent.getSalt());
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}// end of addNewStudent

	/**
	 * 
	 * @param studentId
	 * @return
	 */
	public static int deleteStudent(int studentId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "DELETE FROM user " + "WHERE iduser = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, studentId);
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}// end of deleteStudent

	/**
	 * 
	 * @param term
	 * @return
	 */
	public static List<CourseBean> getCoursesByTerm(String term) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT * FROM courses where term = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, term);
			rs = ps.executeQuery();
			List<CourseBean> courseList = new ArrayList<CourseBean>();
			while (rs.next()) {
				CourseBean courseBean = new CourseBean();

				courseBean.setCourseId(rs.getInt("idcourses"));
				courseBean.setCourseName(rs.getString("coursename"));
				courseBean.setCredit(rs.getInt("credits"));
				courseBean.setInstructor(rs.getString("instructor"));
				courseBean.setMode(rs.getString("mode"));
				courseBean.setTerm(rs.getString("term"));
				courseList.add(courseBean);
			}
			return courseList;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	/**
	 * Get Terms
	 * 
	 * @return
	 */
	public static List<String> getTerms() {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT distinct term FROM courses;";

		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			List<String> termList = new ArrayList<String>();
			while (rs.next()) {
				termList.add(rs.getString("term"));
			}
			return termList;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	/**
	 * Add new course
	 * 
	 * @param newCourse
	 * @return
	 */
	public static int addNewCourse(CourseBean newCourse) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "INSERT INTO courses (coursename, term, credits, instructor, mode) VALUES (?, ?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, newCourse.getCourseName());
			ps.setString(2, newCourse.getTerm());
			ps.setInt(3, newCourse.getCredit());
			ps.setString(4, newCourse.getInstructor());
			ps.setString(5, newCourse.getMode());

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}// end of addNewCourse

	/**
	 * Delete CourseBean
	 * 
	 * @param courseId
	 * @return
	 */
	public static int deleteCourse(int courseId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "DELETE FROM courses " + "WHERE idcourses = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, courseId);
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	/**
	 * Editing the student
	 * 
	 * @param editingStudent
	 * @return
	 */
	public static int editStudent(UserBean editingStudent) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		System.out.println("Updated Role:" + editingStudent.getRole());
		String query = "UPDATE user SET firstname=?,lastname = ?, address = ?, phonenumber = ?, role=?, email=? WHERE iduser = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, editingStudent.getFirstName());
			ps.setString(2, editingStudent.getLastName());
			ps.setString(3, editingStudent.getAddress());
			ps.setString(4, editingStudent.getPhonenumber());
			ps.setString(5, editingStudent.getRole());
			ps.setString(6, editingStudent.getEmail());
			ps.setInt(7, editingStudent.getUserId());

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {

			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	/**
	 * 
	 * @param editingCourse
	 * @return
	 */
	public static int editCourse(CourseBean editingCourse) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "UPDATE courses SET coursename=?,term = ?, credits = ?, instructor = ?, mode=? WHERE idcourses = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, editingCourse.getCourseName());
			ps.setString(2, editingCourse.getTerm());
			ps.setInt(3, editingCourse.getCredit());
			ps.setString(4, editingCourse.getInstructor());
			ps.setString(5, editingCourse.getMode());
			ps.setInt(6, editingCourse.getCourseId());
			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {

			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	/**
	 * 
	 * @return
	 */
	public static List<TermBean> getTerms1() {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT * FROM term";

		try {
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			List<TermBean> termList = new ArrayList<TermBean>();
			while (rs.next()) {
				TermBean termBean = new TermBean();
				termBean.setTermId(rs.getInt("idterm"));
				termBean.setTermName(rs.getString("term_name"));
				termBean.setTermEnabled(rs.getBoolean("term_enabled"));
				termBean.setStartDate(rs.getString("start_date"));
				termBean.setEndDate(rs.getString("end_date"));
				termBean.setRegOpen(rs.getBoolean("reg_open"));

				termList.add(termBean);
			}
			return termList;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

	public static int addNewTerm(TermBean termBean) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "INSERT INTO term (term_name, start_date, end_date, term_enabled) VALUES (?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setString(1, termBean.getTermName());
			ps.setString(2, termBean.getStartDate());
			ps.setString(3, termBean.getEndDate());
			ps.setBoolean(4, termBean.isTermEnabled());

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

	public static int enableDisableTerm(int termId, boolean b) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		System.out.println("Inside Enable Disable Term:" + b);
		String query = "UPDATE term SET term_enabled= ? WHERE idterm = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setBoolean(1, b);
			ps.setInt(2, termId);

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

	public static int enableDisableReg(int termId, boolean b) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "UPDATE term SET reg_open= ? WHERE idterm = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setBoolean(1, b);
			ps.setInt(2, termId);

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

	/**
	 * 
	 * @param userId
	 * @param term
	 */
	public static int getTotalregistredCreditsForTerm(int userId, String term) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT SUM(credits) AS totalCredits FROM registered_courses where student_id = ? AND term = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, userId);
			ps.setString(2, term);
			rs = ps.executeQuery();
			int intResult = 0;
			if (rs.next() && null != rs.getString(1)) {
				intResult = Integer.parseInt(rs.getString(1));
			}
			return intResult;
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	public static int RegisterCourse(RegCourse registerCourse) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "INSERT INTO registered_courses (course_id, student_id, term, credits) VALUES (?, ?, ?, ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, registerCourse.getCourseId());
			ps.setInt(2, registerCourse.getStudentId());
			ps.setString(3, registerCourse.getTerm());
			ps.setInt(4, registerCourse.getCredits());

			return ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

	public static int isRegisted(int courseId, int userId) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT EXISTS(SELECT 1 FROM registered_courses WHERE course_id = ? and student_id = ?)";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, courseId);
			ps.setInt(2, userId);
			rs = ps.executeQuery();
			int intResult = 0;
			if (rs.next()) {
				intResult = Integer.parseInt(rs.getString(1));
			}
			return intResult;
		} catch (SQLException e) {
			System.out.println(e);
			return 2;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	public static List<RegisteredCourseBean> getAllRegCourses(int studentId) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String query = "SELECT t1.resgistration_id, t1.course_id, t2.coursename, t2.instructor, t1.term, t1.credits FROM registered_courses as t1 JOIN courses as t2 ON t1.course_id = t2.idcourses WHERE t1.student_id = ?";

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, studentId);
			rs = ps.executeQuery();
			List<RegisteredCourseBean> allregCourses = new ArrayList<>();
			while (rs.next()) {
				RegisteredCourseBean regCourse = new RegisteredCourseBean();
				regCourse.setRegistrationId(Integer.parseInt(rs.getString(1)));
				regCourse.setCourseId(Integer.parseInt(rs.getString(2)));
				regCourse.setCourseName(rs.getString(3));
				regCourse.setInstructor(rs.getString(4));
				regCourse.setTerm(rs.getString(5));
				regCourse.setCredit(Integer.parseInt(rs.getString(6)));

				allregCourses.add(regCourse);
			}
			return allregCourses;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	public static boolean getRegStatusForTerm(String term) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		LOG.info("TermBean:" + term);
		String query = "SELECT reg_open FROM student_portal.term where term_name = ?";
		LOG.info("Query under Execution:");
		try {
			boolean regStatus = false;
			ps = con.prepareStatement(query);
			ps.setString(1, term);
			rs = ps.executeQuery();
			LOG.info("Query under Execution:" + query);
			if (rs.next()) {
				int result = Integer.parseInt(rs.getString(1));
				LOG.info("result:" + result);
				if (result == 1)
					regStatus = true;
			}
			return regStatus;
		} catch (SQLException e) {
			System.out.println(e);
			return false;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

	/**
	 * 
	 * @param studentId
	 * @return
	 */
	public static List<RegisteredCourseBean> getAllRegCoursesForTerm(int studentId, String term) {

		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		LOG.info("StudentID:" + studentId);
		LOG.info("TermBean:" + term);
		String query = "SELECT t1.resgistration_id,t1.course_id, t2.coursename, t2.instructor, t1.term, t1.credits FROM registered_courses as t1 JOIN courses as t2 ON t1.course_id = t2.idcourses WHERE t1.student_id = ? AND t1.term = ?";
		LOG.info("QUERY UNDER EXECUTION" + query);
		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, studentId);
			ps.setString(2, term);
			rs = ps.executeQuery();
			List<RegisteredCourseBean> allregCourses = new ArrayList<>();
			while (rs.next()) {
				System.out.println("Inside while");
				RegisteredCourseBean regCourse = new RegisteredCourseBean();
				regCourse.setRegistrationId(Integer.parseInt(rs.getString(1)));
				regCourse.setCourseId(Integer.parseInt(rs.getString(2)));
				regCourse.setCourseName(rs.getString(3));
				regCourse.setInstructor(rs.getString(4));
				regCourse.setTerm(rs.getString(5));
				regCourse.setCredit(Integer.parseInt(rs.getString(6)));

				allregCourses.add(regCourse);
			}
			for (RegisteredCourseBean registeredCourseBean : allregCourses) {
				System.out.println("CourseBean Name" + registeredCourseBean.getCourseName());
			}
			return allregCourses;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		} finally {
			DBUtil.closeResultSet(rs);
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}
	}

	public static int dropRegisteredCourse(int registartionId) {
		ConnectionPool pool = ConnectionPool.getInstance();
		Connection con = pool.getConnection();
		PreparedStatement ps = null;

		String query = "DELETE FROM registered_courses WHERE resgistration_id = ?";
		// DELETE FROM `student_portal`.`registered_courses` WHERE
		// `resgistration_id`='1';

		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, registartionId);
			int result = ps.executeUpdate();
			LOG.info("ExecuteUpdate Status:" + result);
			return result;
		} catch (SQLException e) {
			System.out.println(e);
			return 0;
		} finally {
			DBUtil.closePreparedStatement(ps);
			pool.freeConnection(con);
		}

	}

}// end of class
