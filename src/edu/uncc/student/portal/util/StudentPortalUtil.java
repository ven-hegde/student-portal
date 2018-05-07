/**
 * 
 */
package edu.uncc.student.portal.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.StringUtils;

import edu.uncc.student.portal.dataaccess.StudentData;
import edu.uncc.student.portal.model.NotificationBean;
import edu.uncc.student.portal.model.TermBean;
import edu.uncc.student.portal.model.UserBean;

/**
 * @author venky
 *
 */
public class StudentPortalUtil {

	private static final Logger LOG = Logger.getLogger(StudentPortalUtil.class.getName());

	/**
	 * 
	 * @return
	 */
	public List<TermBean> getEnabledTerms() {
		List<TermBean> enabledTermsList = new ArrayList<>();

		List<TermBean> tempList = getAllTerms();
		LOG.info(tempList.toString());
		for (TermBean termBean : tempList) {
			if (termBean.isTermEnabled()) {
				enabledTermsList.add(termBean);
			}
		}

		return enabledTermsList;

	}

	/**
	 * 
	 * @return
	 */
	public List<TermBean> getAllTerms() {

		List<TermBean> termsList = new ArrayList<>();

		termsList = StudentData.getTerms1();

		for (TermBean termBean : termsList) {
			System.out.println(termBean.getTermName());
			System.out.println(termBean.isRegOpen());
		}
		return termsList;

	}

	public int getTotalregistredCreditsForTerm(int userId, String term) {

		int totalCredits = StudentData.getTotalregistredCreditsForTerm(userId, term);

		return totalCredits;
	}

	public static boolean sendNotification(NotificationBean notificationBean) throws MessagingException {

		boolean returnValue = true;

		StringBuffer mailBody = new StringBuffer(notificationBean.getMessage());

		String signature = "------------------------------------------------------------------------------------------------\n"
				+ "\n This is a system generated email. Please DO NOT reply\n\n"
				+ "------------------------------------------------------------------------------------------------\n";

		mailBody.append(signature);

		String username = "notification.airline@gmail.com";
		String password = "uncc@123";

		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "465");

		Session mailSession = Session.getDefaultInstance(properties);
		mailSession.setDebug(true);
		// create mession

		Message message = new MimeMessage(mailSession);

		message.setSubject(notificationBean.getSubject());
		message.setText(mailBody.toString());

		// address the message
		Address fromAddress = new InternetAddress(username);
		Address toAddress = new InternetAddress(notificationBean.getToAddress());

		// send the message
		message.setFrom(fromAddress);
		message.setRecipient(Message.RecipientType.TO, toAddress);

		// send the message
		Transport transport = mailSession.getTransport();
		transport.connect(username, password);
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();

		return returnValue;

	}

	public static boolean isAuthenticatedUser(UserBean user) {
		boolean isAuthUser = false;
		String password = user.getPassword();
		String salt = user.getSalt();
		String hashedAndSaltedPassword = user.getHashedAndSaltedPassword();
		System.out.println("Password: " + password);
		System.out.println("Salt:" + salt);
		System.out.println("HashedSaltedFromDb: " + hashedAndSaltedPassword);

		String newHashedAndSaltedPassword = PasswordUtil.hashAndSaltPassword(password, salt);
		if (StringUtils.equals(hashedAndSaltedPassword, newHashedAndSaltedPassword)) {
			isAuthUser = true;
		}
		System.out.println("Is Auth User: " + isAuthUser);
		return isAuthUser;

	}

	/**
	 * 
	 * @param userName
	 * @return
	 */
	public static String constructEmail(String userName) {
		if (StringUtils.endsWith(userName, "@uncc.edu")) {
			return userName;
		} else {
			StringBuilder stringBuilder = new StringBuilder(userName);
			stringBuilder.append("@uncc.edu");
			return stringBuilder.toString();
		}

	}

}
