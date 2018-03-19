package total.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class infoContoller {
	@RequestMapping("")
	public String infoHandle(Model model) {
		model.addAttribute("main","info.jsp");
		
		return "default";
	}
}
