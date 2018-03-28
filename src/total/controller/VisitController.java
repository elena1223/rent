package total.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VisitController {

	@RequestMapping("/visit")
	public String wayController(Model model){
		model.addAttribute("main","visit.jsp");
		return "default";
	}
	
	
}
