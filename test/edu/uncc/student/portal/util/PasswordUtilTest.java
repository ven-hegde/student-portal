/**
 * 
 */
package edu.uncc.student.portal.util;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.Ignore;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.Test;

/**
 * @author venky
 *
 */
class PasswordUtilTest {

	/**
	 * @throws java.lang.Exception
	 */
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@BeforeEach
	void setUp() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterEach
	void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link edu.uncc.student.portal.util.PasswordUtil#generatePassword()}.
	 */
	@RepeatedTest(10)
	void testGeneratePassword() {
		String password = PasswordUtil.generatePassword();
		assertNotNull(password);
	}

	/**
	 * Test method for {@link edu.uncc.student.portal.util.PasswordUtil#hashPassword(java.lang.String)}.
	 */
	@Ignore
	@Test
	void testHashPassword() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link edu.uncc.student.portal.util.PasswordUtil#getSalt()}.
	 */
	@Ignore
	@Test
	void testGetSalt() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link edu.uncc.student.portal.util.PasswordUtil#hashAndSaltPassword(edu.uncc.student.portal.model.UserBean)}.
	 */
	@Ignore
	@Test
	void testHashAndSaltPasswordUserBean() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link edu.uncc.student.portal.util.PasswordUtil#hashAndSaltPassword(java.lang.String, java.lang.String)}.
	 */
	@Ignore
	@Test
	void testHashAndSaltPasswordStringString() {
		fail("Not yet implemented");
	}

	/**
	 * Test method for {@link edu.uncc.student.portal.util.PasswordUtil#passwordManger(edu.uncc.student.portal.model.UserBean)}.
	 */
	@Ignore
	@Test
	void testPasswordManger() {
		fail("Not yet implemented");
	}

}
