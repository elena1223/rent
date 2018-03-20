package total.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.LoginOutService;

@Controller
public class LoginOutController {
	@Autowired
	LoginOutService loginOutService;
	
	@RequestMapping(path="/login", method=RequestMethod.GET)
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
			session.setAttribute("logon", logon.get("ID"));
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
	
}
