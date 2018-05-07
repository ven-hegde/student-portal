/**
 * 
 */
package edu.uncc.student.portal.model;

import java.io.Serializable;

/**
 * @author venky
 *
 */
public class TermBean implements Serializable{

	/**
	 * Default Constructor
	 */
	public TermBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = -518757763495026078L;
	private int termId;
	private String termName;
	private String startDate;
	private String endDate;
	private boolean termEnabled;
	private boolean regOpen;
	
	
	/**
	 * @return the regOpen
	 */
	public boolean isRegOpen() {
		return regOpen;
	}
	/**
	 * @param regOpen the regOpen to set
	 */
	public void setRegOpen(boolean regOpen) {
		this.regOpen = regOpen;
	}
	/**
	 * @return the termId
	 */
	public int getTermId() {
		return termId;
	}
	/**
	 * @param termId the termId to set
	 */
	public void setTermId(int termId) {
		this.termId = termId;
	}
	/**
	 * @return the termName
	 */
	public String getTermName() {
		return termName;
	}
	/**
	 * @param termName the termName to set
	 */
	public void setTermName(String termName) {
		this.termName = termName;
	}
	/**
	 * @return the startDate
	 */
	public String getStartDate() {
		return startDate;
	}
	/**
	 * @param startDate the startDate to set
	 */
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	/**
	 * @return the endDate
	 */
	public String getEndDate() {
		return endDate;
	}
	/**
	 * @param endDate the endDate to set
	 */
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	/**
	 * @return the termEnabled
	 */
	public boolean isTermEnabled() {
		return termEnabled;
	}
	/**
	 * @param termEnabled the termEnabled to set
	 */
	public void setTermEnabled(boolean termEnabled) {
		this.termEnabled = termEnabled;
	}
	/**
	 * @param termId
	 * @param termName
	 * @param startDate
	 * @param endDate
	 * @param termEnabled
	 * @param regOpen
	 */
	public TermBean(int termId, String termName, String startDate, String endDate, boolean termEnabled,
			boolean regOpen) {
		super();
		this.termId = termId;
		this.termName = termName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.termEnabled = termEnabled;
		this.regOpen = regOpen;
	}
	
	
}
