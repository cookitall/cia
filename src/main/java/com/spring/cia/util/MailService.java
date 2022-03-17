package com.spring.cia.util;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailService  {

	@Autowired
	private JavaMailSender sender;
	int random;
	
	
	public void makeNum() {
		
		Random r = new Random();
		int chekNum = r.nextInt(888888) + 111111;
		random = chekNum;
	}
	
	public String joinMail(String email) {
		makeNum();
		
		String setFrom = "plug111@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일";
		String content = "홈페이지를 방문해주셔서 감사합니다." +
				"<br><br>" + 
				"인증 번호는 " + random + "입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(random);
	}

	
	public void mailSend(String setFrom, String toMail, String title, String content) {
		
		try {
			MimeMessage messsage = sender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(messsage, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			sender.send(messsage);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	
}
	
}
