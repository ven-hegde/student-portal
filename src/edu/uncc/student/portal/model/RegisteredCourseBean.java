/**
 * 
 */
package edu.uncc.student.portal.model;

import java.io.Serializable;

/**
 * @author venky
 *
 */
public class RegisteredCourseBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1547852374403657115L;


	/**
	 * 
	 */
	public RegisteredCourseBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int courseId;
	private int registrationId;
	private String courseName;
	private String instructor;
	private String term;
	private int credit;
	
	
	/**
	 * @return the registrationId
	 */
	public int getRegistrationId() {
		return registrationId;
	}
	/**
	 * @param registrationId the registrationId to set
	 */
	public void setRegistrationId(int registrationId) {
		this.registrationId = registrationId;
	}
	/**
	 * @return the courseId
	 */
	public int getCourseId() {
		return courseId;
	}
	/**
	 * @param courseId the courseId to set
	 */
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	/**
	 * @return the courseName
	 */
	public String getCourseName() {
		return courseName;
	}
	/**
	 * @param courseName the courseName to set
	 */
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	/**
	 * @return the instructor
	 */
	public String getInstructor() {
		return instructor;
	}
	/**
	 * @param instructor the instructor to set
	 */
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	/**
	 * @return the term
	 */
	public String getTerm() {
		return term;
	}
	/**
	 * @param term the term to set
	 */
	public void setTerm(String term) {
		this.term = term;
	}
	/**
	 * @return the credit
	 */
	public int getCredit() {
		return credit;
	}
	/**
	 * @param credit the credit to set
	 */
	public void setCredit(int credit) {
		this.credit = credit;
	}
	/**
	 * @param courseId
	 * @param registrationId
	 * @param courseName
	 * @param instructor
	 * @param term
	 * @param credit
	 */
	public RegisteredCourseBean(int courseId, int registrationId, String courseName, String instructor, String term,
			int credit) {
		super();
		this.courseId = courseId;
		this.registrationId = registrationId;
		this.courseName = courseName;
		this.instructor = instructor;
		this.term = term;
		this.credit = credit;
	}
}
