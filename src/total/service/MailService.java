package total.service;

import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.sun.mail.iap.Response;

@Service
public class MailService {
	@Autowired
	JavaMailSender mailSender;
	public boolean sendWelcomeMail(String email, String authkey ) {

		MimeMessage message =  mailSender.createMimeMessage();
		try {
		
		message.setRecipient(RecipientType.TO, new InternetAddress(email));

		message.setSubject("[에코렌트카] 회원용 인증 메일 입니다.", "text/html;charset=utf-8");

		String content = "가입을 <b>축하</b>드립니다.<br/> 인증키 :" + authkey +" 를 입력해주세요."
				+ "<br/>사용에 불편하신점이 있으면 고객센터에 글을 남겨주세요.";
		

		message.setContent(content, "text/html;charset=utf-8");

		mailSender.send(message);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	public boolean sendPassMail(String email, String pass ) {

		MimeMessage message =  mailSender.createMimeMessage();
		try {
		
		message.setRecipient(RecipientType.TO, new InternetAddress(email));

		message.setSubject("[에코렌트카] 비밀번호 확인 메일 입니다.");

		String content = "고객님의 비밀번호는 <b>" + pass +"</b> 입니다.<br/>"
				+ "<br/> 로그인 후 비밀번호를 변경해주세요.";
		

		message.setContent(content, "text/html;charset=utf-8");

		mailSender.send(message);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
}
