package total.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service")
public class ServiceController {
	
	@RequestMapping("")
	public String serviceHandle(Model model, HttpSession session) {

		return "redirect:/service/way";

	}
	
	@RequestMapping("/way")
	public String wayController(Model model){
		model.addAttribute("main","service/way.jsp");
		return "default";
	}
	
	@RequestMapping("/condition")
	public String conditionController(Model model){
		model.addAttribute("main","service/condition.jsp");
		return "default";
	}
	
	@RequestMapping("/indemnity")
	public String indemnityController(Model model){
		model.addAttribute("main","service/indemnity.jsp");
		return "default";
	}
	
	

}
