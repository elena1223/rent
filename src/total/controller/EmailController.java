package total.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import total.service.MailService;
import total.service.UuidService;

@Controller
public class EmailController {
	@Autowired
	MailService mailService;
	@Autowired
	UuidService uuidService;

	@ResponseBody
	@RequestMapping(path = "/email", method = RequestMethod.POST)
	public boolean authHandle(@RequestParam String email, String authkey, Map map, HttpServletRequest req,
			HttpSession session) {
		HttpSession s = req.getSession();
		String auth = uuidService.authUUID();
		authkey = auth;
		System.out.println(authkey);
		if (s != null) {

			boolean b = mailService.sendWelcomeMail(email, authkey);
			System.out.println("이메일 전송여부  = " + b);
			if (b) {
				session.setAttribute("authCheck", auth);
			}
			return true;
		} else {
			session.setAttribute("err", "error");

			return false;
		}

	}

	@ResponseBody
	@RequestMapping(path = "/authCheck", method = RequestMethod.POST)
	public boolean authCheck(Model model, HttpSession session, @RequestParam Map<String, String> param,
			HttpServletRequest req) {
		HttpSession s = req.getSession();
		boolean b = param.get("lv").equals((String) s.getAttribute("authCheck"));
		return b;

	}

}
