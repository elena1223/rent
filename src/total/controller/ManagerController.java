package total.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import total.service.ManagerService;
import total.service.ReserveService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	ManagerService	managerService;
	@Autowired
	ReserveService reserveService;
	
	@RequestMapping(path="/register", method=RequestMethod.GET)
	public String infoGetHandle(Model model) {
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
	
	@RequestMapping(path="/addCar", method=RequestMethod.POST)
	public String addCarHandle(HttpServletRequest req, @RequestParam Map<String,String> param, Model model,@RequestParam(name = "img") MultipartFile img) {
		ServletContext sc = req.getServletContext();
		String realPath = sc.getRealPath("/imgCar");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(new Date()) + "_" + img.getOriginalFilename();
		
		param.put("img", fileName);
		managerService.addCar(param);
		
		File saveFile = new File(realPath+"/"+fileName);
		try {
			img.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
	@RequestMapping("/reserve")
	public String managerReserveHandle(Model model, @RequestParam(defaultValue="") String key) {
		key="%"+key+"%";
		model.addAttribute("main","reserveManager.jsp");
		model.addAttribute("reserve",reserveService.readAll(key));
		model.addAttribute("end",reserveService.endReserve(key));
		model.addAttribute("cancel",reserveService.cancelReserve(key));
		
		return "default";
	}
	@RequestMapping(path="/cancelp",method=RequestMethod.POST)
	public String cancelpHandle(Model model, @RequestParam String[] no) {
		for(String each:no) {
			reserveService.delete(each);
		}
		
		return "redirect:/manager/reserve";
	}
	@RequestMapping("/member")
	public String memberHandle (Model model, @RequestParam(defaultValue="") String key ) {
		model.addAttribute("main","memberManager.jsp");
		model.addAttribute("member",managerService.readMember("%"+key+"%"));
		return "default";
	}
	@RequestMapping(path="/delete",method=RequestMethod.POST)
	public String deleteHandle(Model model, @RequestParam String[] no) {
		for(String each:no) {
			managerService.delMember(each);
		}
		return "redirect:/manager/member";
	}
}
