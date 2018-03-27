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

@Controller
public class ManagerController {
	@Autowired
	ManagerService	managerService;
	
	@RequestMapping(path="/manager/register", method=RequestMethod.GET)
	public String infoGetHandle(Model model) {
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
	
	@RequestMapping(path="/manager/addCar", method=RequestMethod.POST)
	public String addCarHandle(HttpServletRequest req, @RequestParam Map<String,String> param, Model model,@RequestParam(name = "img") MultipartFile img) {
		ServletContext sc = req.getServletContext();
		String realPath = sc.getRealPath("/imgCar");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(new Date()) + "_" + img.getOriginalFilename();
		
		param.put("img", fileName);
		managerService.addCar(param);
		
		// �뙆�씪 �뾽濡쒕뱶
		File saveFile = new File(realPath+"/"+fileName);
		try {
			img.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("main","managerRegister.jsp");
		return "default";
	}
}