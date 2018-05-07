/**
 * 
 */
package edu.uncc.student.portal.model;

import java.io.Serializable;

/**
 * @author venky
 *
 */
public class CourseBean	implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int courseId;
	private String courseName;
	private String term;
	private int credit;
	private String instructor;
	private String mode;
	
	/**
	 * Default Constructor
	 */
	public CourseBean() {
		
	}
	
	/**
	 * @param courseId
	 * @param courseName
	 * @param term
	 * @param credit
	 * @param instructor
	 * @param mode
	 */
	public CourseBean(int courseId, String courseName, String term, int credit, String instructor, String mode) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.term = term;
		this.credit = credit;
		this.instructor = instructor;
		this.mode = mode;
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
	 * @return the mode
	 */
	public String getMode() {
		return mode;
	}
	/**
	 * @param mode the mode to set
	 */
	public void setMode(String mode) {
		this.mode = mode;
	}
}
