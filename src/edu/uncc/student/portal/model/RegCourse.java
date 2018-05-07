/**
 * 
 */
package edu.uncc.student.portal.model;

/**
 * @author venky
 *
 */
public class RegCourse {

	/**
	 * 
	 */
	public RegCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	private int resgistrationId;
	private int courseId;
	private int studentId;
	private String term;
	private int credits;
	/**
	 * @return the resgistrationId
	 */
	public int getResgistrationId() {
		return resgistrationId;
	}
	/**
	 * @param resgistrationId the resgistrationId to set
	 */
	public void setResgistrationId(int resgistrationId) {
		this.resgistrationId = resgistrationId;
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
	 * @return the studentId
	 */
	public int getStudentId() {
		return studentId;
	}
	/**
	 * @param studentId the studentId to set
	 */
	public void setStudentId(int studentId) {
		this.studentId = studentId;
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
	 * @return the credits
	 */
	public int getCredits() {
		return credits;
	}
	/**
	 * @param credits the credits to set
	 */
	public void setCredits(int credits) {
		this.credits = credits;
	}
	/**
	 * @param resgistrationId
	 * @param courseId
	 * @param studentId
	 * @param term
	 * @param credits
	 */
	public RegCourse(int resgistrationId, int courseId, int studentId, String term, int credits) {
		super();
		this.resgistrationId = resgistrationId;
		this.courseId = courseId;
		this.studentId = studentId;
		this.term = term;
		this.credits = credits;
	}
	
}
