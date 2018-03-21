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

		message.setSubject("[���ڷ�Ʈī] ȸ���� ���� ���� �Դϴ�.");

		String content = "������ <b>����</b>�帳�ϴ�.\\n ����Ű :" + authkey +" �� �Է����ּ���\\n"
				+ "��뿡 �����Ͻ����� ������ �����Ϳ� ���� �����ּ���.\\n";
		

		message.setContent(content, "text/html;charset=utf-8");

		mailSender.send(message);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
