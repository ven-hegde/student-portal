/**
 * 
 */
package edu.uncc.student.portal.util;

import static org.junit.Assert.assertTrue;

import javax.mail.MessagingException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import edu.uncc.student.portal.model.NotificationBean;

/**
 * @author venky
 *
 */
public class StudentPortalUtilTest {

	NotificationBean notification  = null;
	StudentPortalUtil utilityClass = new StudentPortalUtil();
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		notification = new NotificationBean();
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link edu.uncc.student.portal.util.StudentPortalUtil#sendNotification(edu.uncc.student.portal.model.NotificationBean)}.
	 */
	@Test
	public void testSendNotification() {
		notification.setToAddress("venky.suh@gmail.com");
		notification.setSubject("Greetings From JUnit!");
		notification.setMessage("Dear UserBean,\n This is a Test mail sent from Junit\n\n\n\n");
		
		boolean result = false;
		try {
			result = StudentPortalUtil.sendNotification(notification);
		} catch (MessagingException e) {
			
			e.printStackTrace();
		}
		assertTrue(result);
	}

}
