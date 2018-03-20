package total.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.MailService;

@Controller
public class EmailController {
	@Autowired
	MailService mailService;
	
	@RequestMapping(path="/email", method = RequestMethod.POST)
	public void emailTestHandle(@RequestParam String email, HttpServletRequest req, HttpSession session) {
		HttpSession s = req.getSession();
		if (s != null) {
//		System.out.println( " / session = " + authkey );
		}
		boolean b =mailService.sendWelcomeMail(email);
		System.out.println("메일 전송 결과 = " + b);
	}
	
}
