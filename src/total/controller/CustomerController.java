package total.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	@RequestMapping("/qna/{no}")
	public String qnaNoHandle(Model model,@PathVariable String no) {
		Map read=customerService.readOne(no);
		model.addAttribute("board",read);
		model.addAttribute("main","customer/board.jsp");
		customerService.hitUp(read);
		return "default";
	}
	@RequestMapping(path="/write",method=RequestMethod.GET)
	public String writeHandle(Model model,String type) {
		model.addAttribute("main","customer/write.jsp");
		model.addAttribute("type",type);
		return "default";
	}
	@RequestMapping(path="/write",method=RequestMethod.POST)
	public String writePostHandle(Model model,@RequestParam Map map,HttpSession session) {
		if(session.getAttribute("logon")!=null) {
			map.put("writer", ((Map)session.getAttribute("logon")).get("NO"));
			map.put("name", ((Map)session.getAttribute("logon")).get("NAME"));
			if(customerService.addBoard(map)) {
				return "redirect:/customer/qna";
			}else{
				model.addAttribute("err","글작성 실패");
				return "redirect:/customer/qna";
			}
		}else {
			model.addAttribute("err","로그인 후 이용하실 수 있는 서비스입니다.");
			return "redirect:/login";
		}
	}
}
