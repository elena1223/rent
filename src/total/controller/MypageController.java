package total.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import total.service.LoginOutService;
import total.service.MypageService;

@Controller
public class MypageController {
	@Autowired
	MypageService mypageService;
	@Autowired
	LoginOutService loginOutService;
	
	@RequestMapping(path="/mypage")

	public String myPageHandle(Model model, HttpSession session, Map map,HttpServletRequest req) {
	
		try {
			HttpSession s = req.getSession();
			Map logon = (Map)s.getAttribute("logon");
			if(logon==null) {
				return "redirect:/";
			}
			System.out.println("(���������� in)���ǿ� �α׿� ���� ��" + logon);
			
			String id = (String)logon.get("ID");
			System.out.println("id =  " + id);
			
			map = mypageService.readOne(id); 
			System.out.println("ȸ������ �� : " + map);
			model.addAttribute("main","mypage.jsp" );
			model.addAttribute("mypage",map);

		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "Error!");
			model.addAttribute("main","error.jsp" );

			return "default";
		}
	
	return "default";
	}
	
	
	
	
	@RequestMapping(path="/mypageInfo")
		public String myPageHandle(Model model, HttpSession session, Map map,HttpServletRequest req,
				@RequestParam Map<String, String> param, Map editmap) {
		System.out.println("param =  " + param);
		try {
			HttpSession s = req.getSession();
			Map logon = (Map)s.getAttribute("logon");
			String lv = param.get("lv");
			System.out.println("(����������out)���ǿ� �α׿� ���� ��" + logon);
			if(lv == null) {
				param.put("lv", (String)logon.get("LV"));
				map.put("lv", logon.get("LV"));
				
			} else {
				if(logon.get("LV").equals("0")) {
					if(lv.equals("")) {
						param.put("lv", "0");
						map.put("lv", "0");
					}else {
						param.put("lv", "1");
						map.put("lv", "1");
					}
				} 
			}

			System.out.println("(2)id =  " + param.get("id"));
			System.out.println("(2)password =  " +  param.get("password"));
			System.out.println("(2)phone =  " + param.get("phone"));
			

			map.put("id", param.get("id"));
			map.put("password", param.get("password"));
			map.put("phone", param.get("phone"));
			
			System.out.println("�Ѿ�� �� =  " + map);
			boolean b = mypageService.editMypage(map); 
			// �����Ǿ����� ����
			if(b) {
				editmap.put("id", param.get("id"));
				editmap.put("password", param.get("password"));
				
				Map logons = loginOutService.findByIdAndPass(editmap);
				session.setAttribute("logon", logons);
			} else {
				
				throw new Exception();
			}

		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "Error!");
			model.addAttribute("main","error.jsp" );

			return "default";
		}
		return "redirect:/";
	}

	
//	@RequestMapping(path= {"/mypageInfo","/mypage"}, method=RequestMethod.GET)
//	public String logoutPostHandle(HttpSession session, Model model) {
//		session.removeAttribute("logon");
//		return "redirect:/";
//	}

}
