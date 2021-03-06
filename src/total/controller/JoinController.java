package total.controller;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import total.service.JoinService;
import total.service.LoginOutService;
import total.service.MessageService;

@Controller
public class JoinController {
	@Autowired
	JoinService joinService;
	@Autowired
	LoginOutService loginOutService;
	@Autowired
	MessageService messageService;
	
	@RequestMapping({"/join"})

	public String joinHandle(Model model) {
		model.addAttribute("main", "join.jsp");

		return "default";
	}

	@RequestMapping(path = {"/joinp","/register"}, method = RequestMethod.GET)

	public String joinpGetHandle(Model model) {
		return "redirect:/";
	}

	@RequestMapping(path = "/joinp", method = RequestMethod.POST)

	public String joinpHandle(Model model) {
		model.addAttribute("main", "joinp.jsp");

		return "default";
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)

	public String registerHandle(Model model, HttpSession session, Map map, @RequestParam Map<String, String> param) {
		try {

			String lv = param.get("lv");
			boolean rst = false;
			if (lv.equals("")) {
				param.put("lv", "0");

				rst = joinService.addNewOne(param);
			} else {
				param.put("lv", "1");
				rst = joinService.addNewOne(param);
			}
			if (rst) {
				Map info = loginOutService.findByIdAndPass(param);
				session.setAttribute("logon", info);
				return "redirect:/";
			}
			throw new Exception();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "ERROR.");
			model.addAttribute("main", "joinp.jsp");

			return "default";
		}
	}

	@ResponseBody
	@RequestMapping(path = "/idCheck", method = RequestMethod.POST)
	public String idCheck(Model model, HttpSession session, @RequestParam Map<String, String> param) {

		String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(param.get("id"));
		boolean b = m.matches();
		System.out.println(b);
		if (b) {

			try {
				Map map = joinService.existIdCheck(param.get("id"));
				if(map !=null) {
					return "false";
				} else {
					return "true";
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "error";
	}

	@ResponseBody
	@RequestMapping(path = "/phoneCheck", method = RequestMethod.POST)
	public boolean phoneCheck(Model model, HttpSession session, @RequestParam Map<String, String> param,
			HttpServletRequest req) {

		Map check = new HashMap<>();
		String regex = "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(param.get("phone"));
		if (m.matches()) {

			try {
				check = joinService.existPhoneCheck(param.get("phone"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return check == null;
		}

		return check == null;
	}
	
	//마이페이지 내 휴대폰번호 변경할 시 작동하는 phoneCheck
	
	@ResponseBody
	@RequestMapping(path = "/myphoneCheck", method = RequestMethod.POST)
	public boolean myphoneCheck(Model model, HttpSession session, @RequestParam Map<String, String> param,
			HttpServletRequest req) {

		HttpSession s = req.getSession();
		Map logon = (Map) s.getAttribute("logon");
		String phone = String.valueOf(logon.get("PHONE"));
		String paramphone = String.valueOf(param.get("phone"));
		Map check = new HashMap<>();
		String regex = "^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$";
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(param.get("phone"));

		if (paramphone.equals(phone)) {
			param.put("phone", phone);
		} else {
			if (m.matches()) {

				try {
					check = joinService.existPhoneCheck(param.get("phone"));
				} catch (Exception e) {
					e.printStackTrace();
				}
				return check == null;
			}

			return check == null;
		}
		return true;
	}
	

}
