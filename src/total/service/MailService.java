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

		message.setSubject("[���ڷ�Ʈī] ȸ���� ���� ���� �Դϴ�.", "text/html;charset=utf-8");

		String content = "������ <b>����</b>�帳�ϴ�.<br/> ����Ű :" + authkey +" �� �Է����ּ���."
				+ "<br/>��뿡 �����Ͻ����� ������ �����Ϳ� ���� �����ּ���.";
		

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

		message.setSubject("[���ڷ�Ʈī] ��й�ȣ Ȯ�� ���� �Դϴ�.");

		String content = "������ ��й�ȣ�� <b>" + pass +"</b> �Դϴ�.<br/>"
				+ "<br/> �α��� �� ��й�ȣ�� �������ּ���.";
		

		message.setContent(content, "text/html;charset=utf-8");

		mailSender.send(message);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
}
