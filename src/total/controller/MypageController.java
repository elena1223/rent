package total.controller;

import java.util.HashMap;
import java.util.List;
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
import total.service.ReserveService;

@Controller
public class MypageController {
	@Autowired
	MypageService mypageService;
	@Autowired
	LoginOutService loginOutService;

	@RequestMapping(path = "/mypage")
	public String myPageHandle(Model model, HttpSession session, Map map, HttpServletRequest req) {

		try {
			HttpSession s = req.getSession();
			Map logon = (Map) s.getAttribute("logon");
			if (logon == null) {
				return "redirect:/";
			}
			// System.out.println("(마이페이지 in)세션에 로그온 정보 맵" + logon);

			String id = (String) logon.get("ID");

			map = mypageService.readOne(id);
			System.out.println("회원정보 맵 : " + map);
			model.addAttribute("main", "mypage.jsp");
			model.addAttribute("mypage", map);

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "Error!");
			model.addAttribute("main", "error.jsp");

			return "default";
		}

		return "default";
	}
	
	
	
	
	@RequestMapping(path = "/mypageInfo")
	public String myPageHandle(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam Map<String, String> param) {
		try {
			Map map = new HashMap();
			Map editmap = new HashMap();
			// System.out.println("param = " + param);
			HttpSession s = req.getSession();
			Map logon = (Map) s.getAttribute("logon");
			if (logon == null) {
				return "redirect:/";
			}
			// String lv =param.get("LV"); // lv == null
			String lv = String.valueOf(param.get("LV")); // lv == "null"
			// String LV = String.valueOf(logon.get("LV"));
			String phone = String.valueOf(param.get("phone"));
			// System.out.println(lv);
			// System.out.println("(마이페이지out)세션에 로그온 정보 맵" + logon);
			if (lv == null) {
				param.put("lv", lv);
				map.put("lv", String.valueOf(logon.get("LV")));

			} else {
				if (logon.get("LV").equals("0")) {
					if (lv.equals("")) {
						param.put("lv", "0");
						map.put("lv", "0");
					} else {
						param.put("lv", "1");
						map.put("lv", "1");
					}
				}
			}
			if (phone == null) {
				param.put("phone", (String) logon.get("phone"));
				map.put("phone", (String) logon.get("phone"));
			}

			map.put("id", param.get("id"));
			map.put("password", param.get("password"));
			map.put("phone", param.get("phone"));

			// System.out.println("쿼리로 넘어가는 맵 = " + map);
			boolean b = mypageService.editMypage(map);
			// 수정되었는지 여부
			if (b) {
				editmap.put("id", param.get("id"));
				editmap.put("password", param.get("password"));

				Map logons = loginOutService.findByIdAndPass(editmap);
				session.setAttribute("logon", logons);
			} else {

				throw new Exception();
			}

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "Error!");
			model.addAttribute("main", "error.jsp");

			return "default";
		}
		return "redirect:/";
	}
	
	
	@RequestMapping(path="/outMember", method = RequestMethod.POST)

	public String registerHandle(Model model, HttpSession session, Map map,
			 HttpServletRequest req, @RequestParam Map<String, String> param) {
		try {

			System.out.println("param =  " + param);
			String password = param.get("password");
			String id = param.get("id");

//			System.out.println("인증안받음? " );
			
			boolean rst = false;
			rst= mypageService.outMember(param); 

			System.out.println("회원탈퇴 여부 =  " + rst);
			
			if(rst) {
				session.removeAttribute("logon");
				return "redirect:/";
			}
			throw new Exception();
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "회원 탈퇴에서 문제가 있었습니다.");
			model.addAttribute("main","error.jsp" );

			return "default";
		}
	}
	
	@RequestMapping(path = "/target")
	public String popupHandle(Model model, HttpSession session, HttpServletRequest req,
			@RequestParam Map<String, String> param) {
//		model.addAttribute("main","target.jsp" );
		return "target";

	}
	
	@RequestMapping("/mypage/reserve")
	public String readMyResevation(Model model, HttpSession session, HttpServletRequest req) {
		
		HttpSession s = req.getSession();
		Map logon = (Map) s.getAttribute("logon");
		if (logon == null) {
			return "redirect:/";
		}
		String no = String.valueOf(logon.get("NO"));
		List reservation = mypageService.readMyResevation(no);
		System.out.println("넘어온 파람값 " + reservation);
		if(reservation!=null) {
			model.addAttribute("my",reservation);
			model.addAttribute("main","myreservation.jsp");
			return "default";
			
		}else {
			return "redirect:/reserve";
		}
	}
	
}
