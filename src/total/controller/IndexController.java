package total.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	
	@RequestMapping({"/index","/"})

	public String indexHandle(Model model, HttpSession session ) {
		model.addAttribute("hello","hello" );

		return "index";
	}
	
}
