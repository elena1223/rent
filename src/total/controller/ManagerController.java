package total.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ManagerController {
	
	@RequestMapping(path="/manager/register", method=RequestMethod.GET)
	public String infoGetHandle(Model model) {
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
	
	@RequestMapping(path="/manager/addCar", method=RequestMethod.POST)
	public String addCarHandle(@RequestParam Map<String,String> param, Model model,@RequestParam(name = "img") MultipartFile img) {
		System.out.println(param);
		System.out.println(img.getName());
		System.out.println(img.getOriginalFilename());
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
}
