package total.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import total.service.LoginOutService;
import total.service.MailService;
import total.service.MessageService;
import total.service.MypageService;

@Controller
public class LoginOutController {
	@Autowired
	LoginOutService loginOutService;
	@Autowired
	MailService mailService;
	@Autowired
	MypageService mypageService;
	@Autowired
	MessageService MessageService;
	
	@RequestMapping(path= {"/login","/findpass"}, method=RequestMethod.GET)
	public String loginGetHandle(HttpSession session, Model model) {
		if(session.getAttribute("logon") == null) {
			model.addAttribute("main","login.jsp");
			return "default";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(path="/session", method=RequestMethod.POST)
	public String loginPostHandle(@RequestParam Map<String, String> param, HttpSession session, Model model) {
		Map logon = loginOutService.findByIdAndPass(param);
		if(logon != null) {
			session.setAttribute("logon", logon);
			MessageService.logonMessage(String.valueOf(((Map)session.getAttribute("logon")).get("ID")));
			return "redirect:/";
		} else {
			model.addAttribute("err", "Logon Failed");
			model.addAttribute("main","login.jsp");
			return "default";
		}
	}
	
	@RequestMapping(path="/logout", method=RequestMethod.GET)
	public String logoutPostHandle(HttpSession session, Model model) {
		session.removeAttribute("logon");
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(path="/findpass", method=RequestMethod.POST)
	public String findPassHandle(HttpSession session, Model model, @RequestParam Map<String, String> param) {
		try {
			boolean b = false;
			 
			
			String phone = String.valueOf(param.get("phone"));
			String email = String.valueOf(param.get("id"));
			String pass = null;
			Map map = loginOutService.findPass(param); 
			
				if(map==null) {
					return "false";
				} else {
				pass = String.valueOf(map.get("PASSWORD"));
					b = mailService.sendPassMail(email, pass);
					if(b) {
						return "true";
					}
					
				} 

		}catch (Exception e) {
			e.printStackTrace();
		}
		return "false";

	}
	
	
	@RequestMapping(path = "/mypass")
	public String mypassHandle(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam Map<String, String> param) {
		return "mypass";

	}
	
	
}
