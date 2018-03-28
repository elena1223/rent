package total.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.ManagerURService;

@Controller
public class ManagerURController {
	
	@Autowired
	ManagerURService urService;

	@RequestMapping(path = "/manager/updateremove", method = RequestMethod.GET)
	public String managerHandle(Model model) {
		List<Map> list = urService.readAllCar();
		model.addAttribute("car", list);
		model.addAttribute("main", "managerUpdateRemove.jsp");
		return "default";
	}
	
	@RequestMapping(path = "/manager/update", method = RequestMethod.POST)
	public String managerUpdateHandle(@RequestParam MultiValueMap<String,String> param, Model model) {
		List<Map> list = urService.readSelect(param);
		model.addAttribute("up",list);
		model.addAttribute("main", "managerUpdatep.jsp");
		return "default";
	}
	
	@RequestMapping(path = "/manager/updateremove", method = RequestMethod.POST)
	public String managerUpdateCompleteHandle(Model model, @RequestParam Map<String,String> param) {
		System.out.println(param);
		List<Map> list = urService.readAllCar();
		model.addAttribute("car", list);
		model.addAttribute("main", "managerUpdateRemove.jsp");
		return "default";
	}
	
	@RequestMapping(path = "/manager/remove", method = RequestMethod.POST)
	public String managerRemoveHandle(@RequestParam MultiValueMap<String,String> param, Model model) {
		boolean result = urService.remove(param);
		List<Map> list = urService.readAllCar();
		model.addAttribute("car", list);
		model.addAttribute("main", "managerUpdateRemove.jsp");
		return "default";
	}
	
}
