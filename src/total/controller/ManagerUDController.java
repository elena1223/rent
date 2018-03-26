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

import total.service.ManagerUDService;

@Controller
public class ManagerUDController {
	
	@Autowired
	ManagerUDService udService;

	@RequestMapping(path = "/manager/updateremove", method = RequestMethod.GET)
	public String managerHandle(Model model) {
		List<Map> list = udService.readAllCar();
		model.addAttribute("car", list);
		model.addAttribute("main", "managerUpdateRemove.jsp");
		return "default";
	}
	
	@RequestMapping(path = "/manager/update", method = RequestMethod.POST)
	public String managerUpdateHandle(@RequestParam MultiValueMap<String,String> param, Model model) {
		udService.readSelect(param);
		model.addAttribute("main", "managerUpdatep.jsp");
		return "default";
	}

	
}
