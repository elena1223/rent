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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import total.service.InfoService;
import total.service.ReserveService;

@Controller
@RequestMapping("/reserve")
public class ReserveContoller {
	@Autowired
	InfoService infoService;
	@Autowired
	ReserveService reserveService;

	@RequestMapping("")
	public String reserveHandle(Model model, HttpSession session) {
		if (session.getAttribute("logon") == null) {
			model.addAttribute("main", "login.jsp");

			return "default";
		} else {
			model.addAttribute("main", "reserve/reserve.jsp");
			model.addAttribute("list", infoService.readAllCar());
			return "default";
		}

	}

	@RequestMapping("/{no}")
	public String noHandle(Model model, @PathVariable String no) {
		Map car = infoService.readOneCar(no);
		if (car.get("NO") != null) {
			model.addAttribute("car", car);
			model.addAttribute("main", "reserve/selectDate.jsp");
			return "default";

		} else {
			return "redirect:/reserve";
		}

	}

	@ResponseBody
	@RequestMapping(path = "/dateCheck", method = RequestMethod.POST)
	public Map dateCheckHandle(Model model, @RequestParam Map<String, String> map) {
		Map res = reserveService.dateCheck(map);
		return res;
	}

	@ResponseBody
	@RequestMapping(path = "/overlapCheck", method = RequestMethod.POST)
	public List overlapHandle(Model model, @RequestParam Map map) {
		List over = reserveService.overlapDate(map);
		return over;
	}

	@RequestMapping(path = "/result", method = RequestMethod.POST)
	public String reservepHandle(Model model, @RequestParam Map map, HttpSession session) {
		map.put("mno", ((Map) session.getAttribute("logon")).get("NO"));
		model.addAttribute("res", reserveService.newReserve(map));
		model.addAttribute("main", "reserve/reservep.jsp");
		return "default";
	}

}
