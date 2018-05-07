/**
 * UserBean bean class
 */
package edu.uncc.student.portal.model;

import java.io.Serializable;

import javax.servlet.http.Part;

/**
 * @author venky
 *
 */
public class UserBean implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int userId;
	private String firstName;
	private String lastName;
	private String phonenumber;
	private String address;
	private String role;
	private String email;
	private String password;
	private String hashedAndSaltedPassword;
	private String salt;
	private Part photo;
	private boolean proPic;
	/**
	 * @return the proPic
	 */
	public boolean isProPic() {
		return proPic;
	}

	/**
	 * @param proPic the proPic to set
	 */
	public void setProPic(boolean proPic) {
		this.proPic = proPic;
	}

	/**
	 * @return the photo
	 */
	public Part getPhoto() {
		return photo;
	}

	/**
	 * @param photo the photo to set
	 */
	public void setPhoto(Part photo) {
		this.photo = photo;
	}

	/**
	 * Default constructor
	 */
	public UserBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @return the hashedAndSaltedPassword
	 */
	public String getHashedAndSaltedPassword() {
		return hashedAndSaltedPassword;
	}
	/**
	 * @param hashedAndSaltedPassword the hashedAndSaltedPassword to set
	 */
	public void setHashedAndSaltedPassword(String hashedAndSaltedPassword) {
		this.hashedAndSaltedPassword = hashedAndSaltedPassword;
	}
	/**
	 * @return the salt
	 */
	public String getSalt() {
		return salt;
	}
	/**
	 * @param salt the salt to set
	 */
	public void setSalt(String salt) {
		this.salt = salt;
	}
	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the phonenumber
	 */
	public String getPhonenumber() {
		return phonenumber;
	}
	/**
	 * @param phonenumber the phonenumber to set
	 */
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getFullName() {
		return firstName+" "+lastName;
	}
	/**
	 * @param userId
	 * @param firstName
	 * @param lastName
	 * @param phonenumber
	 * @param address
	 * @param role
	 * @param email
	 * @param password
	 * @param hashedAndSaltedPassword
	 * @param salt
	 */

	/**
	 * @param userId
	 * @param firstName
	 * @param lastName
	 * @param phonenumber
	 * @param address
	 * @param role
	 * @param email
	 * @param password
	 * @param hashedAndSaltedPassword
	 * @param salt
	 * @param photo
	 */
	public UserBean(int userId, String firstName, String lastName, String phonenumber, String address, String role,
			String email, String password, String hashedAndSaltedPassword, String salt, Part photo) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phonenumber = phonenumber;
		this.address = address;
		this.role = role;
		this.email = email;
		this.password = password;
		this.hashedAndSaltedPassword = hashedAndSaltedPassword;
		this.salt = salt;
		this.photo = photo;
	}

}
