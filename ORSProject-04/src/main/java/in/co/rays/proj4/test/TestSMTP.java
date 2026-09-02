package in.co.rays.proj4.test;

import java.util.HashMap;

import in.co.rays.proj4.util.EmailBuilder;
import in.co.rays.proj4.util.EmailMessage;
import in.co.rays.proj4.util.EmailUtility;

public class TestSMTP {

	public static void main(String[] args) {
		testUserRegistrationMail();
		testForgetPasswordMail();
		
	}

	private static void testUserRegistrationMail() {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		EmailMessage msg = new EmailMessage();
		
		map.put("login", "aayushibokhre04@gmail.com");
		
		map.put("password", "aayushi@123");
		
		msg.setTo(map.get("login"));
		msg.setSubject("User Regitration Information");
		msg.setMessage(EmailBuilder.getUserRegistrationMessage(map));
		msg.setMessageType(EmailMessage.HTML_MSG);
		
		EmailUtility.sendMail(msg);
		System.out.println("Mail send successfully");
		
		
	}
	
	
private static void testForgetPasswordMail() {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		EmailMessage msg = new EmailMessage();
		
		map.put("login", "aayushibokhre04@gmail.com");
		
		map.put("password", "aayushi@123");
		
		map.put("firstName", "Aayushi");
		
		map.put("lastName", "Bokhre");
		
		msg.setTo(map.get("login"));
		msg.setSubject("Forget Password Information");
		msg.setMessage(EmailBuilder.getForgetPasswordMessage(map));
		msg.setMessageType(EmailMessage.HTML_MSG);
		
		EmailUtility.sendMail(msg);
		System.out.println("");
		
		
	}
	

private static void testChangePasswordMail() {
	
	HashMap<String, String> map = new HashMap<String, String>();
	
	EmailMessage msg = new EmailMessage();
	
	map.put("login", "aayushibokhre04@gmail.com");
	
	map.put("password", "aayushi@123");
	
	map.put("firstName", "Aayushi");
	
	map.put("lastName", "Bokhre");
	
	msg.setTo(map.get("login"));
	msg.setSubject("Change Password Information");
	msg.setMessage(EmailBuilder.getChangePasswordMessage(map));
	msg.setMessageType(EmailMessage.HTML_MSG);
	
	EmailUtility.sendMail(msg);
	System.out.println("");
	
	
}

	

	
}
