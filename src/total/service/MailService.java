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
	public boolean sendWelcomeMail(String email ) {
		
		UUID uuid = UUID.randomUUID();	// 고유식별문자 생성 (8-4-4-4-12) : 
		System.out.println(uuid.toString());
		String authkey = uuid.toString().split("-")[1];
		System.out.println(authkey);
	


		MimeMessage message =  mailSender.createMimeMessage();
		try {
		
		// 받을 사람
		message.setRecipient(RecipientType.TO, new InternetAddress(email));
		// 보내는 사람 

		// 제목 설정
		message.setSubject("[에코렌트카] 회원용 인증 메일 입니다.");

		String content = "가입을 <b>축하</b>드립니다.\\n 인증키 :" + authkey +" 를 입력해주세요\\n"
				+ "사용에 불편하신점이 있으면 고객센터에 글을 남겨주세요.\\n";
		
//		content +="<a href=\"http://192.168.10.96\">사이트 둘러보기</a>";
		// html 도 가능함. 단 string으로 짜야함. 노 가 다 ㅋ

//		message.setContent(content, "text/plain;charset=utf-8");
		message.setContent(content, "text/html;charset=utf-8");

		// content 설정을 text/html;charset=utf-8 이라고 보내면.. HTML로 보낼수도 있다.

		mailSender.send(message);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
