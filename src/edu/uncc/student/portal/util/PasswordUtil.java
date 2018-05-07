/**
 * 
 */
package edu.uncc.student.portal.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.Random;
import java.util.logging.Logger;

import org.apache.commons.lang3.RandomStringUtils;

import edu.uncc.student.portal.model.UserBean;

/**
 * @author venky
 *
 */
public class PasswordUtil {

	private static final Logger LOG = Logger.getLogger(PasswordUtil.class.getName());

	/**
	 * Method to generate random strong 8 digit password
	 * 
	 * @return password
	 */
	public static String generatePassword() {

		String numbers = RandomStringUtils.random(3, false, true);
		LOG.info("Numbers for password:" + numbers);
		StringBuilder stringBuilder = new StringBuilder(numbers);
		String alpha = RandomStringUtils.randomAlphabetic(10);
		LOG.info("Alpha's for password:" + alpha);
		stringBuilder.append(alpha);
		stringBuilder.append("!@#$%^&*-+");
		String password = RandomStringUtils.random(10, stringBuilder.toString().toCharArray());
		System.out.println("===================================");
		System.out.println("Initial Password--" + password);
		System.out.println("===================================");
		return password;

	}

	/**
	 * Method to Hash the password
	 * 
	 * @param password
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public static String hashPassword(String password) throws NoSuchAlgorithmException {
		// String hashedPassword = null;

		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		mDigest.reset();

		mDigest.update(password.getBytes());
		byte[] mdArray = mDigest.digest();
		StringBuilder sBuilder = new StringBuilder(mdArray.length * 2);
		for (byte b : mdArray) {
			int v = b & 0xff;
			if (v < 16) {
				sBuilder.append('0');
			}
			sBuilder.append(Integer.toHexString(v));

		}
		System.out.println("HashedPassword: " + sBuilder.toString());
		return sBuilder.toString();
	}

	/**
	 * 
	 * @return
	 */
	public static String getSalt() {
		Random random = new SecureRandom();
		byte[] saltByte = new byte[32];
		random.nextBytes(saltByte);
		return Base64.getEncoder().encodeToString(saltByte);
	}

	/**
	 * 
	 * @param user
	 * @return
	 */
	public static String hashAndSaltPassword(UserBean user) {
		String salt = user.getSalt();
		String hashAndSaltedPassword = null;
		try {
			hashAndSaltedPassword = hashPassword(user.getPassword() + salt);
		} catch (NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
		return hashAndSaltedPassword;
	}

	public static String hashAndSaltPassword(String password, String salt) {

		String hashAndSaltedPass = null;

		try {
			hashAndSaltedPass = hashPassword(password + salt);
		} catch (NoSuchAlgorithmException e) {
		
			e.printStackTrace();
		}
		System.out.println("New Hashed And Salted Pass: " + hashAndSaltedPass);
		return hashAndSaltedPass;
	}

	/**
	 * 
	 * @param user
	 * @return
	 */
	public static UserBean passwordManger(UserBean user) {

		user.setSalt(getSalt());
		System.out.println("Salt:" + user.getSalt());
		user.setPassword(generatePassword());

		String hashAndSaltPassword = hashAndSaltPassword(user);

		user.setHashedAndSaltedPassword(hashAndSaltPassword);
		System.out.println("Hashed and salted Pass:" + user.getHashedAndSaltedPassword());
		return user;
	}
}
