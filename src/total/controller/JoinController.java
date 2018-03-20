package total.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import total.service.JoinService;

@Controller
public class JoinController {
	@Autowired
	JoinService joinService;
	
	@RequestMapping({"/join"})

	public String joinHandle(Model model) {
		model.addAttribute("main","join.jsp" );
		
		return "default";
	}
	
	@RequestMapping({"/joinp"})

	public String joinpHandle(Model model) {
		model.addAttribute("main","joinp.jsp" );
		
		return "default";
	}
	
	@RequestMapping(path="/register", method = RequestMethod.POST)

	public String registerHandle(Model model, HttpSession session, Map map,
									@RequestParam Map<String, String> param) {
		try {
			boolean rst= joinService.addNewOne(param);
			System.out.println("rst =  " + rst);
			System.out.println("param =  " + param);
			
			if(rst) {
				session.setAttribute("logon", param);
				return "redirect:/";
			}
			
			throw new Exception();
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "계정생성에서 문제가 있었습니다.");
			model.addAttribute("main","joinp.jsp" );

			return "default";
		}
	}
	
	
}
