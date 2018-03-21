package total.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

	public String myPageHandle(Model model, HttpSession session, Map map,HttpServletRequest req) {
	
		try {
			HttpSession s = req.getSession();
			Map logon = (Map)s.getAttribute("logon");
			System.out.println("세션에 로그온 정보 맵" + logon);
				String id = (String)logon.get("ID");
				
			System.out.println("id =  " + id);
			map = mypageService.readOne(id); 
			System.out.println("회원정보 맵 : " + map);
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
