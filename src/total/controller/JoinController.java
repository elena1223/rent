package total.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JoinController {
	@RequestMapping({"/join"})

	public String joinHandle(Model model) {
		model.addAttribute("main","join.jsp" );
		
		return "default";
	}
}
