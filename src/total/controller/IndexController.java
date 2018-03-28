package total.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import total.service.InfoService;

@Controller
public class IndexController {
	@Autowired
	InfoService infoService;
	
	@RequestMapping({"/index","/"})

	public String indexHandle(Model model) {
		model.addAttribute("main","index.jsp" );
		model.addAttribute("car",infoService.readNewCar());
		return "index";
	}
	
}
