package total.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.MypageService;

@Controller
public class MypageController {
	@Autowired
	MypageService mypageService;
	
	@RequestMapping("/mypage")

	public String myPageHandle(Model model, HttpSession session, Map map,
			@RequestParam String id) {
	
		try {
			System.out.println("param =  " + id);
			map = mypageService.readOne(id); 
			System.out.println("È¸¿øÁ¤º¸ ¸Ê : " + map);
			model.addAttribute("main","mypage.jsp" );

		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "Error!");
			model.addAttribute("main","error.jsp" );

			return "default";
		}
	
	return "default";
	}

}
