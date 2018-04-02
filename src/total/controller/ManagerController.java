package total.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import total.service.ManagerService;
import total.service.MessageService;
import total.service.ReserveService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	ManagerService	managerService;
	@Autowired
	ReserveService reserveService;
	@Autowired
	MessageService messageService;
	
	public boolean lvCheck(HttpSession session) {
		if(session.getAttribute("logon")==null) {
			return false;
		}else {
			Map logon = (Map)session.getAttribute("logon");
			return String.valueOf(logon.get("LV")).equals("2");
		}
		
	}
	
	@RequestMapping(path="/register", method=RequestMethod.GET)
	public String infoGetHandle(Model model,HttpSession session) {
		if(!lvCheck(session)) {
			return "redirect:/";
		}
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
	
	@RequestMapping(path="/addCar", method=RequestMethod.POST)
	public String addCarHandle(HttpServletRequest req,HttpSession session, @RequestParam Map<String,String> param, Model model,@RequestParam(name = "img") MultipartFile img) {
		if(!lvCheck(session)) {
			return "redirect:/";
		}
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
	public String managerReserveHandle(HttpSession session,Model model, @RequestParam(defaultValue="") String key) {
		if(!lvCheck(session)) {
			return "redirect:/";
		}
		key="%"+key+"%";
		model.addAttribute("main","reserveManager.jsp");
		model.addAttribute("reserve",reserveService.readAll(key));
		model.addAttribute("end",reserveService.endReserve(key));
		model.addAttribute("cancel",reserveService.cancelReserve(key));
		
		return "default";
	}
	@RequestMapping(path="/cancelp",method=RequestMethod.POST)
	public String cancelHandle(HttpSession session,Model model,@RequestParam String[] no,@RequestParam String c) {
		if(!lvCheck(session)) {
			return "redirect:/";
		}
		for(String each:no) {
			reserveService.cancellation(each,c);
		}
		
		return "redirect:/manager/reserve";
	}
	@RequestMapping("/member")
	public String memberHandle (HttpSession session,Model model, @RequestParam(defaultValue="") String key ) {
		if(!lvCheck(session)) {
			return "redirect:/";
		}
		model.addAttribute("main","memberManager.jsp");
		model.addAttribute("member",managerService.readMember("%"+key+"%"));
		return "default";
	}

	@RequestMapping(path="/delete",method=RequestMethod.POST)
	public String deleteHandle(HttpSession session,Model model, @RequestParam String[] no) {
		if(!lvCheck(session)) {
			return "redirect:/";
		}
		for(String each:no) {
			managerService.delMember(each);
		}
		return "redirect:/manager/member";
	}
	
	@ResponseBody
	@RequestMapping(path="/message",method=RequestMethod.POST)
	public boolean messageHandle(@RequestParam String target,@RequestParam String content) {
		System.out.println(target);
			messageService.sendMessage(target, content);
		return true;
	}
}
