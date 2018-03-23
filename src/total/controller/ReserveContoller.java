package total.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import total.service.InfoService;

@Controller
@RequestMapping("/reserve")
public class ReserveContoller {
	@Autowired
	InfoService infoService;
	
	@RequestMapping("")
	public String reserveHandle(Model model,HttpSession session) {
		if(session.getAttribute("logon")==null) {
			return "redirect:/";
		}else {
			model.addAttribute("main","reserve/reserve.jsp");
			model.addAttribute("list",infoService.readAllCar());
			return "default";
		}
		
	}
	@RequestMapping("/{no}")
	public String noHandle(Model model, @PathVariable String no) {
		Map car = infoService.readOneCar(no);
		if(car.get("NO")!=null) {
			model.addAttribute("car",car);
			model.addAttribute("main","reserve/selectDate.jsp");
			return "default";
			
		}else {
			return "redirect:/reserve";
		}
		
		
	}

}
