package total.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/qna")
	public String qnaHandle(Model model) {
		model.addAttribute("main","customer/qna.jsp");
		model.addAttribute("board",customerService.readAll("qna"));
		return "default";
	}
	@RequestMapping(path="/write",method=RequestMethod.GET)
	public String writeHandle(Model model,String type) {
		model.addAttribute("main","customer/write.jsp");
		model.addAttribute("type",type);
		return "defalut";
	}
	@RequestMapping(path="/write",method=RequestMethod.POST)
	public String writePostHandle(Model model,@RequestParam Map map) {
		
		
		return "defalut";
	}
}
