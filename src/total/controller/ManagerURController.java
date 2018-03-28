package total.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String managerUpdateHandle(@RequestParam Map<String, String> param, Model model) {
		List<Map> list = urService.readSelect(param);
		model.addAttribute("up", list);
		model.addAttribute("main", "managerUpdatep.jsp");
		return "default";
	}

	@RequestMapping(path = "/manager/updatep", method = RequestMethod.POST)
	public String managerUpdateCompleteHandle(Model model, @RequestParam Map<String, String> param,
			HttpServletRequest req, @RequestParam(name = "img") MultipartFile img) {

		ServletContext sc = req.getServletContext();
		String realPath = sc.getRealPath("/imgCar");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName = sdf.format(new Date()) + "_" + img.getOriginalFilename();
		
		if (img.getOriginalFilename().length() != 0) {
			param.put("img", fileName);
			File saveFile = new File(realPath + "/" + fileName);
			try {
				img.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		urService.updateCar(param);

		List<Map> list = urService.readAllCar();
		model.addAttribute("car", list);
		model.addAttribute("main", "managerUpdateRemove.jsp");
		return "default";
	}

	@RequestMapping(path = "/manager/remove", method = RequestMethod.POST)
	public String managerRemoveHandle(@RequestParam MultiValueMap<String, String> param, Model model) {
		boolean result = urService.remove(param);
		List<Map> list = urService.readAllCar();
		model.addAttribute("car", list);
		model.addAttribute("main", "managerUpdateRemove.jsp");
		return "default";
	}

}
