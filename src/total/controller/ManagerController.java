package total.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ManagerController {
	
	@RequestMapping(path="/manager/register", method=RequestMethod.GET)
	public String infoGetHandle(Model model) {
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
	
	@RequestMapping(path="/manager/addCar", method=RequestMethod.POST)
	public String addCarHandle(@RequestParam Map<String,String> param, Model model) {
		System.out.println(param);
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
	
}
