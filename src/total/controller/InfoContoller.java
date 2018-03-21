package total.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.InfoService;

@Controller
public class InfoContoller {
	
	@Autowired
	InfoService infoService;

	@RequestMapping(path="/info", method=RequestMethod.GET)
	public String infoGetHandle(Model model) {
		List<Map> list = infoService.readAllCar();
		model.addAttribute("car", list);
		model.addAttribute("main","info.jsp");
		return "default";
	}
	
}
